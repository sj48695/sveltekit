import { c as create_ssr_component, e as escape, f as add_attribute } from "./index.js";
const LayoutDefault_svelte_svelte_type_style_lang = "";
const css = {
  code: ".info.svelte-26tkrd{margin:1em 0 6em}",
  map: null
};
const LayoutDefault = create_ssr_component(($$result, $$props, $$bindings, slots) => {
  let { title = "" } = $$props;
  let { summary = "" } = $$props;
  let { publishedAt = "" } = $$props;
  if ($$props.title === void 0 && $$bindings.title && title !== void 0)
    $$bindings.title(title);
  if ($$props.summary === void 0 && $$bindings.summary && summary !== void 0)
    $$bindings.summary(summary);
  if ($$props.publishedAt === void 0 && $$bindings.publishedAt && publishedAt !== void 0)
    $$bindings.publishedAt(publishedAt);
  $$result.css.add(css);
  return `${$$result.head += `<!-- HEAD_svelte-3o3bgx_START -->${$$result.title = `<title>${escape(title)}</title>`, ""}<meta name="${"description"}"${add_attribute("content", summary, 0)}><!-- HEAD_svelte-3o3bgx_END -->`, ""}

<article class="${"post"}"><h1>${escape(title)}</h1>
  <p class="${"info svelte-26tkrd"}"><time>${escape(publishedAt)}</time></p>
  ${slots.default ? slots.default({}) : ``}
</article>`;
});
export {
  LayoutDefault as L
};
