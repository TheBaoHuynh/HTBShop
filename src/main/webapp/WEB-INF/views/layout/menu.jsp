<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="/home/index">Trang chủ</a>
		</div>
		<ul class="nav navbar-nav">
			<li><a href="/home/about">Giới thiệu</a></li>
			<li><a href="/home/contact">Liên hệ</a></li>
			<li><a href="/home/feedback">Phản hồi</a></li>

		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#">Tài khoản<span class="caret "></span></a>
				<c:choose>
					<c:when test="${empty sessionScope.user}">
						<ul class="dropdown-menu">
							<li><a href="/account/login">Đăng nhập</a></li>
							<li><a href="/account/register">Đăng kí</a></li>
							<li><a href="/account/forgot">Quên mật khẩu</a></li>
						</ul>
					</c:when>
					<c:otherwise>
						<ul class="dropdown-menu">
							<li><a href="/account/edit">Cập nhật tài khoản</a></li>
							<li><a href="/account/change">Đổi mật khẩu</a></li>
							<li><a href="/account/logout">Đăng xuất</a></li>
							<li><a href="/order/list">Đơn hàng</a></li>
							<li><a href="/order/items">Hàng đã mua</a></li>

						</ul>
					</c:otherwise>
				</c:choose></li>
			<li><a href="#"><span class="glyphicon glyphicon-user"></span>
					Đăng kí</a></li>
			<li><a href="#"><span class="glyphicon glyphicon-log-in"></span>
					Đăng nhập</a></li>
		</ul>
	</div>
</nav>