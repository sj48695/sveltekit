import { supabase } from '$lib/supabaseClient';

// export async function load(
// 	{
// 		// fetch
// 	}
// ) {
// 	// let res = await fetch('');

// 	const { data: todos, error } = await supabase
// 		.from('todos')
// 		.select(`id, task, description, is_complete`);
// 	if (error)
// 		console.log('error', error);
// 	console.log('todos', todos);
// 	// let todos = [
// 	// 	{ id: 1, task: 'Create a Svelte starter app', is_complete: true },
// 	// 	{ id: 2, task: 'Create your first component', is_complete: true },
// 	// 	{ id: 3, task: 'Complete the rest of the tutorial', is_complete: false }
// 	// ];

// 	let result: any | null = { todos };
// 	return result;
// }
