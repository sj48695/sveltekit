<script>
  import { enhance } from "$app/forms";
  import { supabase } from "$lib/supabaseClient";
  import { kakaoAuthUri } from "$lib/kakao";

  const signInWithProvider = async (provider) => {
    if (provider == "kakao") {
      kakaoAuthUri.pathname = '/oauth/authorize';
      location.href = kakaoAuthUri;
      return;
    }
    const { data, error } = await supabase.auth.signInWithOAuth({ provider });
  };

  const submitSocialLogin = async ({ action, cancel }) => {
    const provider = action.searchParams.get("provider");
    switch (provider) {
      case "google":
      case "kakao":
      case "apple":
        console.log("provider1", provider)
        await signInWithProvider(provider);
        break;
      default:
        break;
    }
    cancel();
  };
</script>

<main>
  <h1>Login</h1>
  <form class="socials" method="POST" use:enhance={submitSocialLogin}>
    <button formaction="?/sign_in&provider=google" class="btn btn-outline">Google</button>
    <button formaction="?/sign_in&provider=kakao" class="btn btn-outline">Kakao</button>
    <button formaction="?/sign_in&provider=apple" class="btn btn-outline">Apple</button>
  </form>
  <u><a href="/findPassword">비밀번호를 잊어버렸나요?</a></u>
</main>
