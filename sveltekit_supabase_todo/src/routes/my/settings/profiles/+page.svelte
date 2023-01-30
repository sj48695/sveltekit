<script lang="ts">
	import { page } from '$app/stores';
  import Account from "./Account.svelte";
</script>

{#if !$page.data.session}
<div>aa</div>
{:else}
<Account session={$page.data.session}/>
{/if}