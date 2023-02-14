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
const supabaseAnonKey = PUBLIC_SUPABASE_ANON_KEY;
const supabaseServiceRoleKey = PUBLIC_SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseAnonKey)
const supabaseAdmin = createClient(supabaseUrl, supabaseServiceRoleKey, {});

export {
  supabaseUrl,
  supabase,
  supabaseAdmin,
}