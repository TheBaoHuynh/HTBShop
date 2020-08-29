<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>

<div class="section">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="col-md-12">
			<div class="col-md-12">
				<div class="col-sm-5 text-center">
					<img class="detail-img" src="/static/images/products/${p.image}">
				</div>
				<div class="col-sm-7">
					<ul class="detail-info">
						<li>${p.name}</li>
						<li>Giá: <f:formatNumber value="${p.unitPrice}"
								pattern="#,###" />VNĐ
						</li>
						<li>Danh mục: ${p.category.name}</li>
						<li>Giảm giá: <f:formatNumber value="${p.discount}"
								type="percent" /></li>
						<li>Lượt xem: ${p.viewCount}</li>
					</ul>
					
					
				</div>
			</div>
			<div class="section-title">
				<h4 class="title">Mô tả</h4>
				<div class="pull-right">
					<div class="product-slick-dots-2 custom-dots"></div>
				</div>
			</div>
			<div class="text-justify">${p.description}</div>

		</div>
	</div>
</div>





<!-- theme -->
<!-- section -->
<div class="section">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="row">
			<!-- section title -->
			<div class="col-md-12">


				<ul class="nav nav-tabs">
					<li class="active"><a data-toggle="tab" href="#tab1"
						class="section-title "><h3 class="title">Sản phẩm tương
								tự</h3></a></li>
					<li><a data-toggle="tab" href="#tab2" class="section-title "><h3
								class="title">Sản phẩm yêu thích</h3></a></li>
					<li><a data-toggle="tab" href="#tab3" class="section-title "><h3
								class="title">Sản phẩm đã xem</h3></a></li>
				</ul>
			</div>
			<!-- section title -->

			<div class="tab-content">
				<div id="tab1" class="tab-pane fade in active">
					<div>
						<c:forEach var="p" items="${list}">
							<a href="/product/detail/${p.id}"> <img class="thumb-img"
								src="/static/images/products/${p.image}">
							</a>

						</c:forEach>
					</div>
				</div>
				<div id="tab2" class="tab-pane fade">
					<div>
						<c:forEach var="p" items="${favote}">
							<a href="/product/detail/${p.id}"> <img class="thumb-img"
								src="/static/images/products/${p.image}">
							</a>

						</c:forEach>
					</div>
				</div>
				<div id="tab3" class="tab-pane fade">
					<div>
						<c:forEach var="p" items="${viewed}">
							<a href="/product/detail/${p.id}"> <img class="thumb-img"
								src="/static/images/products/${p.image}">
							</a>

						</c:forEach>
					</div>
				</div>
			</div>


		</div>
	</div>
</div>
