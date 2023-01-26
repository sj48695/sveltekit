import { c as create_ssr_component } from "../../chunks/index.js";
import "../../chunks/supabaseClient.js";
const _layout_svelte_svelte_type_style_lang = "";
const css = {
  code: "@import '$assets/styles.css';",
  map: null
};
const Layout = create_ssr_component(($$result, $$props, $$bindings, slots) => {
  $$result.css.add(css);
  return `<div class="${"container"}" style="${"padding: 50px 0 100px 0"}"><a href="${"/"}">Home</a>
	<a href="${"/posts/hello"}">Post</a>
	<a href="${"/todos"}">Todo</a>
	${slots.default ? slots.default({}) : ``}</div>`;
});
export {
  Layout as default
};
