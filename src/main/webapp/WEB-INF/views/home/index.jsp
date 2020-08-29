<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>


<!--theme  slideshow-->

			<div id="home">
				<!-- container -->
				<div class="container">
					<!-- home wrap -->
					<div class="home-wrap">
						<!-- home slick -->
						<div id="home-slick">
							<!-- banner -->
							<c:forEach var="p" items="${list}">
							<div class="banner banner-1 ">
								<%-- <img src="/static/images/products/${p.image}" alt="" class="slide-pro "> --%>
									<img src="/static/images/banner1.jpeg" alt="" class="slide-pro ">
								<div class="banner-caption text-center">
									<h1>Hot</h1>
									<h3 class="white-color font-weak">Giảm giá đến 20%</h3>
									<button class="primary-btn">Mua ngay</button>
								</div>
							</div>
							</c:forEach>
							<!-- /banner -->
						</div>
						<!-- /home slick -->
					</div>
					<!-- /home wrap -->
				</div>
				<!-- /container -->
			</div> 

<!-- /HOME -->
<!-- Ban chay  -->
<!--  <h4>Sản phầm bán chạy</h4> -->
<div class="section">
	<div class="container">
		<div class="row">
		<div class="col-md-12">
			<jsp:include page="../product/list.jsp"></jsp:include>
		</div>
	</div>
</div>
</div>



