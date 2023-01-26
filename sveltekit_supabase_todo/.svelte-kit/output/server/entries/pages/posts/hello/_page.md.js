import { c as create_ssr_component, v as validate_component } from "../../../../chunks/index.js";
import { L as LayoutDefault } from "../../../../chunks/LayoutDefault.js";
const metadata = {
  "title": "제목",
  "summary": "요약",
  "publishedAt": "2020-04-01"
};
const Page = create_ssr_component(($$result, $$props, $$bindings, slots) => {
  return `${validate_component(LayoutDefault, "Layout_MDSVEX_DEFAULT").$$render($$result, Object.assign($$props, metadata), {}, {
    default: () => {
      return `<p><em>안녕</em>하세요.</p>`;
    }
  })}`;
});
export {
  Page as default,
  metadata
};
