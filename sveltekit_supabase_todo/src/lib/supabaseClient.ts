import { createClient } from '@supabase/auth-helpers-sveltekit';
import {
  PUBLIC_SUPABASE_URL,
  PUBLIC_SUPABASE_ANON_KEY,
  PUBLIC_SUPABASE_SERVICE_ROLE_KEY,
} from "$env/static/public";
// import {
//   SUPABASE_SERVICE_ROLE_KEY,
// } from "$env/static/private";

const supabaseUrl = PUBLIC_SUPABASE_URL;
const supabase = createClient(supabaseUrl, PUBLIC_SUPABASE_ANON_KEY)
const supabaseAdmin = createClient(supabaseUrl, PUBLIC_SUPABASE_SERVICE_ROLE_KEY, {});

export {
  supabaseUrl,
  supabase,
  supabaseAdmin,
}