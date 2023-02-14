<script lang="ts">
  import { supabase } from '$lib/supabaseClient';
  import { invalidate } from '$app/navigation';
  import { onMount } from 'svelte';
  import Footer from '$components/Footer.svelte';
  import Header from '$components/Header.svelte';

  let navigation = [
    {
      title: 'Home',
      href: '/'
    },
    {
      title: 'Post',
      href: '/posts/hello'
    },
    {
      title: 'Todo',
      href: '/todos'
    },
    {
      title: 'Profile',
      href: '/my/settings/profiles'
    }
  ];

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

  export let data: any;
</script>

<Header bind:data />
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
<Footer />

<style lang="css">
  @import '$assets/styles.css';
</style>
