import { createClient } from "@supabase/auth-helpers-sveltekit";
import { e as env } from "./env-public.js";
const supabase = createClient(env.PUBLIC_SUPABASE_URL, env.PUBLIC_SUPABASE_ANON_KEY);
export {
  supabase as s
};
