<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>

<!-- HEADER -->

<!-- top Header -->
<div id="top-header">
	<div class="container">
		<div class="pull-left">
			<span>Chào mừng đến HTBStore!</span>
		</div>
		<div class="pull-right">
			<ul class="header-top-links">
				<li><a href="#"><i class="fa fa-facebook"></i></a></li>
				<li><a href="#"><i class="fa fa-instagram"></i></a></li>
			</ul>
		</div>
	</div>
</div>
<!-- /top Header -->
<!-- header -->
<div id="header">
	<div class="container">
		<div class="pull-left">
			<!-- Logo -->
			<div class="header-logo">
				<a class="logo" href="/home/index"> <img src="/static/images/logo.png"
					alt="">
				</a>
			</div>
			<!-- /Logo -->

			<!-- Search -->
			<div class="header-search">
				<form action="/product/list-by-keywords" method="post">

					<input value="${param.keywords}" name="keywords"
						class="form-control input search-input" type="text"
						placeholder="Nhập từ khóa" />
					<button class="search-btn">
						<i class="fa fa-search"></i>
					</button>
				</form>
			</div>
			<!-- /Search -->
		</div>
		<div class="pull-right">
			<ul class="header-btns">
				<!-- Account -->
				<li class="header-account dropdown default-dropdown">
					<div class="dropdown-toggle" role="button" data-toggle="dropdown"
						aria-expanded="true">
						<div class="header-btns-icon">
							<i class="fa fa-user-o"></i>
						</div>
						<strong class="text-uppercase">Tài khoản <i
							class="fa fa-caret-down"></i></strong>
					</div> <c:choose>
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
					</c:choose>
				</li>
				<!-- /Account -->

				<!-- Cart -->
				<c:set var="cart"
					value="${sessionScope['scopedTarget.cartService']}"></c:set>
				<li class="header-cart dropdown default-dropdown"><a
					class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
						<div class="header-btns-icon">
							<i class="fa fa-shopping-cart" id="cart-img"></i> 
							<span class="qty" id="cart-cnt">${cart.count}</span>
						</div> 
						<strong class="text-uppercase">Giỏ hàng:</strong> 
						<br> 
						<span><b id="cart-amt"><f:formatNumber value="${cart.amount}"
									pattern="#,###.###" /></b>VND</span>
				</a>
					<div class="custom-menu">
						<div id="shopping-cart">
							<div class="shopping-cart-list">
								<c:forEach var="p"
									items="${sessionScope['scopedTarget.cartService'].items}">
									<div class="product product-widget">
										<div class="product-thumb">
											<img src="/static/images/products/${p.image}" alt="">
										</div>
										<div class="product-body">
											<h3 class="product-price">
												${p.unitPrice} <span class="qty">${p.quantity}</span>
											</h3>
											<h2 class="product-name">
												<a href="#">${p.name}</a>
											</h2>
										</div>
									</div>
								</c:forEach>
							</div>
							<div class="shopping-cart-btns">
								<a class="main-btn" href="/cart/view">Xem giỏ hàng</a> <a
									href="/order/checkout" class="btn btn-sm btn-danger">Thanh
									toán</a>

							</div>
						</div>
					</div></li>
				<!-- /Cart -->

				<!-- Mobile nav toggle-->
				<li class="nav-toggle">
					<button class="nav-toggle-btn main-btn icon-btn">
						<i class="fa fa-bars"></i>
					</button>
				</li>
				<!-- / Mobile nav toggle -->
			</ul>
		</div>
	</div>
	<!-- header -->
</div>
<!-- container -->

<!-- /HEADER -->
<!-- NAVIGATION -->
<div id="navigation">
	<!-- container -->
	<div class="container">
		<div id="responsive-nav">
			<!-- category nav -->
			<div class="category-nav show-on-click">
				<span class="category-header">Danh mục <i class="fa fa-list"></i></span>
				<ul class="category-list">


					<c:forEach var="c" items="${cates}">
						<a href="/product/list-by-category/${c.id}"
							class="list-group-item">${c.name}</a>
					</c:forEach>


				</ul>
			</div>
			<!-- /category nav -->

			<!-- menu nav -->
			<div class="menu-nav">
				<span class="menu-header">Menu <i class="fa fa-bars"></i></span>
				<ul class="menu-list">
					<li><a href="/home/index">Trang chủ</a></li>
					<li><a href="#">Giới thiệu</a></li>
					<li><a href="#">Liên hệ</a></li>

				</ul>
			</div>
			<!-- menu nav -->
		</div>
	</div>
	<!-- /container -->
</div>
<!-- /NAVIGATION -->
<style id="cart-css">
	
</style>


