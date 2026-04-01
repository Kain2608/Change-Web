<header class="header">
  <div class="inner-logo">
  <a href="/admin/dashboard">
    <span class="l-p1">Shop</span>
    <span class="l-p2">Vnb</span>
    <div class="l-sep"></div>
    <span class="l-p3">Admin</span>
  </a>
</div>
  <div class="inner-wrap">
    <div class="inner-notify">
      <img src="<c:url value='/images/icon-bell.svg'/>">
      <span>6</span>
    </div>
    <div class="inner-account">
      <div class="inner-avatar">
        <img src="${profile.avatar}">
      </div>
      <div class="inner-text">
        <div class="inner-name">${profile.fullName}</div>
        <span class="inner-role">${profile.role} | ${profile.position}</span>
      </div>
    </div>
  </div>
</header>