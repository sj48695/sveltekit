<script lang="ts">
	import { supabase } from '$lib/supabaseClient';
	import { invalidate } from '$app/navigation';
	import { onMount } from 'svelte';
	// import './styles.css';

	onMount(() => {
		const {
			data: { subscription }
		} = supabase.auth.onAuthStateChange(() => {
			invalidate('supabase:auth');
		});

		return () => {
			subscription.unsubscribe();
		};
	});
</script>
<style lang="css">
	@import '$assets/styles.css';
</style>

<div class="container" style="padding: 50px 0 100px 0">
	<a href="/">Home</a>
	<a href="/posts/hello">Post</a>
	<a href="/todos">Todo</a>
	<slot />
</div>
