<script lang="ts">
	import { page } from '$app/stores';
	import { onMount } from 'svelte';
	import { supabase } from '$lib/supabaseClient';

	let session = $page.data.session || {};
	let { user = {} } = session;

	let todos: any = [{}];

	let totalTodos: any = 0;
	let completedTodos: any = null;

	onMount(() => {
		getTodos();
	});

	let inputValue = '';

	let getTodos = async () => {
		if (!user?.id) return;
		const { data, error, status } = await supabase.from('todos').select(`*`).eq('user_id', user.id);

		if (data) {
			todos = data;
			totalTodos = todos.length;
			completedTodos = todos.filter((todo: any) => todo.is_complete).length;
			console.log('todos', todos);
		}

		if (error && status !== 406) throw error;
	};

	let addTodo = async () => {
		let todoItem = {
			task: inputValue,
			description: '',
			// is_complete: false,
			user_id: user.id
		};
		const { data, error, status } = await supabase
			.from('todos')
			.insert(todoItem)
			.eq('user_id', user.id)
			.select();
		console.log('data', data);
		if (error && status !== 406) throw error;
		if (data)
			todos = [...todos, data[0]];
		console.log('todos', todos);
		inputValue = '';
	};

	let updateTodo = async (id: any, todoItem: any) => {
		console.log('update', id);
		const { data, error, status } = await supabase
			.from('todos')
			.update({ ...todoItem })
			.eq('id', id)
			.eq('user_id', user.id)
			.select();
		if (data) {
			let updatedIndex = todos.findIndex((el:any) => el.id === data[0].id);
			todos[updatedIndex] = data[0];
		}
		console.log('data', data);
		if (error && status !== 406) throw error;
	};

	let deleteTodo = async (id: any) => {
		console.log('delete', id);
		const { data, error, status } = await supabase
			.from('todos')
			.delete()
			.eq('id', id)
			.eq('user_id', user.id)
			.select();
		if (data) {
			let deletedIndex = todos.findIndex((el:any) => el.id === data[0].id);
			todos.splice(deletedIndex, 1);
		}
		todos = todos;
		if (error && status !== 406) throw error;
	};

	let editTodo = (id: any) => {
		console.log('delete', id);
	};
</script>

<div>
	<input type="text" bind:value={inputValue} placeholder="TODO를 입력해주세요." />
	<button on:click={addTodo}>Add</button>
</div>

<h2 id="list-heading">{completedTodos} out of {totalTodos} items completed</h2>
<ul class="todo-list stack-large" aria-labelledby="list-heading">
	{#each todos as todo (todo.id)}
		<li class="todo" id={todo.id}>
			<div class="stack-small">
				<div class="c-cb">
					<!-- <input type="checkbox" id="todo-{todo.id}" checked={todo.is_complete} /> -->
					<label for="todo-{todo.id}" class="todo-label" class:done={todo.is_complete}>
						{todo.task}
					</label>
				</div>
				<div class="btn-group">
					<!-- <button
						type="button"
						on:click={() => {
							editTodo(todo.id);
						}}
						class="btn"
					>
						Edit
						<span class="visually-hidden">{todo.task}</span>
					</button> -->
					<button
						type="button"
						on:click={() => {
							updateTodo(todo.id, { is_complete: true });
						}}
						class="btn"
					>
						Complete
						<!-- <span class="visually-hidden">{todo.task}</span> -->
					</button>
					<button
						type="button"
						on:click={() => {
							updateTodo(todo.id, { is_complete: false });
						}}
						class="btn"
					>
						Cancel Complete
						<!-- <span class="visually-hidden">{todo.task}</span> -->
					</button>
					<button
						type="button"
						on:click={() => {
							deleteTodo(todo.id);
						}}
						class="btn btn__danger"
					>
						Delete
						<!-- <span class="visually-hidden">{todo.task}</span> -->
					</button>
				</div>
			</div>
		</li>
	{:else}
		<li>Nothing to do here!</li>
	{/each}
</ul>

<style>
	label.done {
		text-decoration: line-through;
	}
</style>
