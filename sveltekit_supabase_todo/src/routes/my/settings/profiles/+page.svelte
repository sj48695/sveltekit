<script>
  import { page } from '$app/stores';
  import Account from './Account.svelte';

  export let data;
  console.log('data', data);
  let { profile } = data;
</script>

{#if !$page.data.session}
  <div>aa</div>
{:else}
  <Account session={$page.data.session} />
{/if}
