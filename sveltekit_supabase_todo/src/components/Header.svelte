<script>
  export let data;
</script>

<div class="navbar bg-base-100">
  <div class="flex-1">
    <a class="btn btn-ghost normal-case text-xl" href="/">펀딩플레이</a>
  </div>
  <div class="flex-none">
    <ul class="menu menu-horizontal px-1">
      {#if data.session}
        <li><a href="/my/settings/profiles">마이 페이지</a></li>
        <li>
          <form action="/sign_out" method="POST">
            <button type="submit" class="btn">Logout</button>
          </form>
        </li>
      {:else}
        <li><a href="/sign_in">로그인</a></li>
      {/if}
    </ul>
  </div>
</div>
