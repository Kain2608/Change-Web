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
        <%-- CHUÔNG THÔNG BÁO --%>
        <div class="inner-notify">
            <img src="<c:url value='/images/icon-bell.svg'/>">
            <span id="notif-count">0</span>
            <ul id="notif-list" class="notif-dropdown">
                <li class="notif-item notif-placeholder" 
                    style="color:#999; text-align:center; padding:16px;">
                    Không có thông báo mới
                </li>
            </ul>
        </div>

        <%-- THÔNG TIN TÀI KHOẢN --%>
        <div class="inner-account" 
             id="user-info" 
             data-user-id="${profile.id}" 
             data-user-role="${profile.role}">
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