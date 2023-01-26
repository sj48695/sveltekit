import { c as create_ssr_component, b as subscribe, f as add_attribute, e as escape, h as each, v as validate_component } from "../../../chunks/index.js";
import { L as LayoutDefault } from "../../../chunks/LayoutDefault.js";
import { p as page } from "../../../chunks/stores.js";
import "../../../chunks/supabaseClient.js";
const Todos_svelte_svelte_type_style_lang = "";
const css = {
  code: "label.done.svelte-1r2fpxu{text-decoration:line-through}",
  map: null
};
const Todos = create_ssr_component(($$result, $$props, $$bindings, slots) => {
  let $page, $$unsubscribe_page;
  $$unsubscribe_page = subscribe(page, (value) => $page = value);
  $page.data.session;
  let todos = [{}];
  let totalTodos = 0;
  let completedTodos = null;
  let inputValue = "";
  $$result.css.add(css);
  $$unsubscribe_page();
  return `<div><input type="${"text"}" placeholder="${"TODO를 입력해주세요."}"${add_attribute("value", inputValue, 0)}>
	<button>Add</button></div>

<h2 id="${"list-heading"}">${escape(completedTodos)} out of ${escape(totalTodos)} items completed</h2>
<ul class="${"todo-list stack-large"}" aria-labelledby="${"list-heading"}">${todos.length ? each(todos, (todo) => {
    return `<li class="${"todo"}"${add_attribute("id", todo.id, 0)}><div class="${"stack-small"}"><div class="${"c-cb"}">
					<label for="${"todo-" + escape(todo.id, true)}" class="${["todo-label svelte-1r2fpxu", todo.is_complete ? "done" : ""].join(" ").trim()}">${escape(todo.task)}
					</label></div>
				<div class="${"btn-group"}">
					<button type="${"button"}" class="${"btn"}">Complete
						</button>
					<button type="${"button"}" class="${"btn"}">Cancel Complete
						</button>
					<button type="${"button"}" class="${"btn btn__danger"}">Delete
						</button>
				</div></div>
		</li>`;
  }) : `<li>Nothing to do here!</li>`}
</ul>`;
});
const Page = create_ssr_component(($$result, $$props, $$bindings, slots) => {
  return `${validate_component(LayoutDefault, "Layout_MDSVEX_DEFAULT").$$render($$result, Object.assign($$props), {}, {
    default: () => {
      return `
${validate_component(Todos, "Todos").$$render($$result, {}, {}, {})}`;
    }
  })}`;
});
export {
  Page as default
};
