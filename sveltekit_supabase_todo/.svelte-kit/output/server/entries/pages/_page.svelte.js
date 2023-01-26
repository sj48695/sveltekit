import { c as create_ssr_component, d as createEventDispatcher, e as escape, f as add_attribute, v as validate_component, b as subscribe } from "../../chunks/index.js";
import { p as page } from "../../chunks/stores.js";
import { s as supabase } from "../../chunks/supabaseClient.js";
const Avatar = create_ssr_component(($$result, $$props, $$bindings, slots) => {
  let { size = 10 } = $$props;
  let { url } = $$props;
  let avatarUrl = null;
  createEventDispatcher();
  const downloadImage = async (path) => {
    try {
      const { data, error } = await supabase.storage.from("avatars").download(path);
      if (error) {
        throw error;
      }
      const url2 = URL.createObjectURL(data);
      avatarUrl = url2;
    } catch (error) {
      if (error instanceof Error) {
        console.log("Error downloading image: ", error.message);
      }
    }
  };
  if ($$props.size === void 0 && $$bindings.size && size !== void 0)
    $$bindings.size(size);
  if ($$props.url === void 0 && $$bindings.url && url !== void 0)
    $$bindings.url(url);
  {
    if (url)
      downloadImage(url);
  }
  return `<div>${avatarUrl ? `<img${add_attribute("src", avatarUrl, 0)}${add_attribute("alt", avatarUrl ? "Avatar" : "No image", 0)} class="${"avatar image"}" style="${"height: " + escape(size, true) + "em; width: " + escape(size, true) + "em;"}">` : `<div class="${"avatar no-image"}" style="${"height: " + escape(size, true) + "em; width: " + escape(size, true) + "em;"}"></div>`}

	<div style="${"width: " + escape(size, true) + "em;"}"><label class="${"button primary block"}" for="${"single"}">${escape("Upload")}</label>
		<input style="${"visibility: hidden; position:absolute;"}" type="${"file"}" id="${"single"}" accept="${"image/*"}" ${""}></div></div>`;
});
const Account = create_ssr_component(($$result, $$props, $$bindings, slots) => {
  let { session } = $$props;
  let username = null;
  let website = null;
  let avatarUrl = null;
  if ($$props.session === void 0 && $$bindings.session && session !== void 0)
    $$bindings.session(session);
  return `<form class="${"form-widget"}">${validate_component(Avatar, "Avatar").$$render($$result, { url: avatarUrl }, {}, {})}
	<div><label for="${"email"}">Email</label>
		<input id="${"email"}" type="${"text"}"${add_attribute("value", session.user.email, 0)} disabled></div>
	<div><label for="${"username"}">Name</label>
		<input id="${"username"}" type="${"text"}"${add_attribute("value", username, 0)}></div>
	<div><label for="${"website"}">Website</label>
		<input id="${"website"}" type="${"website"}"${add_attribute("value", website, 0)}></div>

	<div><input type="${"submit"}" class="${"button block primary"}"${add_attribute("value", "Update", 0)} ${""}></div>

	<div><button class="${"button block"}" ${""}>Sign Out</button></div></form>`;
});
const Auth = create_ssr_component(($$result, $$props, $$bindings, slots) => {
  let email;
  return `<form class="${"row flex-center flex"}"><div class="${"col-6 form-widget"}"><h1 class="${"header"}">Supabase + SvelteKit</h1>
		<p class="${"description"}">Sign in via magic link with your email below</p>
		<div><input class="${"inputField"}" type="${"email"}" placeholder="${"Your email"}"${add_attribute("value", email, 0)}></div>
		<div><input type="${"submit"}" class="${"button block"}"${add_attribute("value", "Send magic link", 0)} ${""}></div></div></form>`;
});
const Page = create_ssr_component(($$result, $$props, $$bindings, slots) => {
  let $page, $$unsubscribe_page;
  $$unsubscribe_page = subscribe(page, (value) => $page = value);
  $$unsubscribe_page();
  return `


${$$result.head += `<!-- HEAD_svelte-168c3vc_START -->${$$result.title = `<title>Supabase + SvelteKit</title>`, ""}<meta name="${"description"}" content="${"SvelteKit using supabase-js v2"}"><!-- HEAD_svelte-168c3vc_END -->`, ""}

${!$page.data.session ? `${validate_component(Auth, "Auth").$$render($$result, {}, {}, {})}` : `${validate_component(Account, "Account").$$render($$result, { session: $page.data.session }, {}, {})}`}`;
});
export {
  Page as default
};
