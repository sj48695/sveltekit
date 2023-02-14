import {
  PUBLIC_KAKAO_REST_API_KEY,
  PUBLIC_KAKAO_REDIRECT_URI
} from '$env/static/public';

const kakaoAuthUri = new URL("https://kauth.kakao.com");
kakaoAuthUri.searchParams.append("client_id", PUBLIC_KAKAO_REST_API_KEY);
kakaoAuthUri.searchParams.append("redirect_uri", PUBLIC_KAKAO_REDIRECT_URI);
kakaoAuthUri.searchParams.append("response_type", "code");
kakaoAuthUri.searchParams.append("scope", "account_email");

const kakaoApiUri = new URL("https://kapi.kakao.com");

export {
  kakaoAuthUri,
  kakaoApiUri,
}