<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="section-title">
					<h2 class="title">${title}</h2>
					<div class="pull-right">
						<div class="product-slick-dots-2 custom-dots"></div>
					</div>
				</div>
				<c:forEach var="p" items="${list}">
					<div class="col-sm-4 product">
						<div class="thumbnail pro-icon-wraper" style="position: relative;">
							<a href="/product/detail/${p.id}"> <img class="img_product"
								src="/static/images/products/${p.image}">
							</a>
							<div class="caption">
								<p>${p.name}</p>
								<div class="pull-right" data-id="${p.id}">
									<button class="btn btn-sm btn-danger">
										<i class="glyphicon glyphicon-shopping-cart btn-add-to-cart"></i>
									</button>
									<button class="btn btn-sm btn-warning btn-star">
										<i class="glyphicon glyphicon-star"></i>
									</button>
								</div>
								<p>
									<f:formatNumber value="${p.unitPrice}" pattern="#,###" />
									VNĐ
								</p>
							</div>
							<c:choose>
								<c:when test="${p.special}">
									<img class="pro-icon" src="/static/images/hot.png"
										style="position: absolute; top: 0px; right: 0px;">
								</c:when>
								<c:when test="${p.discount > 0}">
									<img class="pro-icon" src="/static/images/giam.png"
										style="position: absolute; top: 0px; right: 0px;">
								</c:when>
							</c:choose>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
	</div>
</div>
