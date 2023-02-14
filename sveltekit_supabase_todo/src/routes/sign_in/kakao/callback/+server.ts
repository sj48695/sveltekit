import { redirect, error } from '@sveltejs/kit';
import type { RequestHandler } from '$types';
import { kakaoAuthUri, kakaoApiUri } from '$lib/kakao';
import axios from 'axios';
import { inspect } from "util";

export const GET: RequestHandler = async ({ locals, url }) => {
  let code = url.searchParams.get('code');
  let Location = "/sign_in";

  try {
    let result = await kakaoRedirectHandler(code);
    console.log("kakaoRedirectHandler result", inspect(result, { depth: 5 }));
    
    if (result) {
      const { access_token } = result;
      result = await getUserInfo({ access_token });
      console.log("getUserInfo result", inspect(result, { depth: 5 }));
      let { email, profile: { nickname } } = result.kakao_account;
      let password = "1234kkkk";
      result = await locals.sb_admin.auth.admin.createUser({
        email,
        email_confirm: true,
        password,
        user_metadata: { name: nickname }
      });
      console.log("createUser result", inspect(result, { depth: 5 }));
      
      const { data, error: err } = await locals.sb.auth.signInWithPassword({ email, password });

      if (err) throw error(err.status, err);
      console.log("signInWithPassword result", inspect(data, { depth: 5 }));
      Location = "/";
    }
  } catch (e) {
    console.error("error: ", e);
    // alert("카카오 로그인 실패!");
  }
  return new Response('Redirect', { status: 302, headers: { Location } });
};


const kakaoRedirectHandler = (code: any) => {
  const grant_type = 'authorization_code';
  kakaoAuthUri.pathname = `oauth/token`;
  kakaoAuthUri.searchParams.set('grant_type', grant_type);
  kakaoAuthUri.searchParams.set('code', code);
  const headers = {
    'Content-type': 'application/x-www-form-urlencoded;charset=utf-8'
  };
  const result = axios
    .post(kakaoAuthUri.toString(), { headers })
    .then((res) => {
      const { data } = res;
      return data;
    })
    .catch((e) => {
      const { response: { data } } = e;
      console.error('error: ', data);
    });
  return result;
};

const getUserInfo = ({ access_token }: any) => {
  kakaoApiUri.pathname = "/v2/user/me";
  const headers = {
    'Authorization': `Bearer ${access_token}`
  };

  const result = axios
    .get(kakaoApiUri.toString(), { headers })
    .then((res) => {
      const { data } = res;
      return data;
    })
    .catch((e) => {
      const { response: { data } } = e;
      console.error('error: ', data);
    });

  return result;
}