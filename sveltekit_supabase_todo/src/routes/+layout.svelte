<script lang="ts">
	import { supabase } from '$lib/supabaseClient';
	import { invalidate } from '$app/navigation';
	import { onMount } from 'svelte';
	// import './styles.css';

	let navigation = [
		{
			title: "Home",
			href: "/",
		},
		{
			title: "Post",
			href: "/posts/hello",
		},
		{
			title: "Todo",
			href: "/todos",
		},
		{
			title: "Profile",
			href: "/my/settings/profiles",
		},
	]

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

<div class="flex w-full h-full">

	<ul class="container" style="padding: 50px 0 100px 0">
		{#each navigation as navItem}
			<li>
				<a href={navItem.href}>{navItem.title}</a>
			</li>
		{/each}
		<slot />
	</ul>

</div>