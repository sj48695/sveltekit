<script>
  export let data;
</script>

<div class="navbar bg-base-100">
  <div class="flex-1">
    <a class="btn btn-ghost normal-case text-xl" href="/">펀딩플레이</a>
  </div>
  <div class="flex-none">
    <ul class="menu menu-horizontal px-1">
      <li><a href="/projects">프로젝트</a></li>

      {#if data.session}
        <li><a href="/my">마이 페이지</a></li>
      {:else}
        <li><a href="/sign_in">로그인</a></li>
      {/if}
    </ul>
  </div>
</div>
