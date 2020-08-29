<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>

<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="section-title">
					<h2 class="title">Giỏ hàng</h2>
					<h4>${msg}</h4>
					<div class="pull-right">
						<div class="product-slick-dots-2 custom-dots"></div>
					</div>
				</div>
				<table class="table">
					<thead>
						<tr>
							<th>Mã đơn hàng</th>
							<th>Sản phẩm</th>
							<th>Giá</th>
							<th>Giảm giá</th>
							<th>Số lượng</th>
							<th>Thành tiền</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="p"
							items="${sessionScope['scopedTarget.cartService'].items}">
							<tr data-id="${p.id}" data-price="${p.unitPrice}"
								data-discount="${p.discount}">
								<td>${p.id}</td>
								<td>${p.name}</td>
								<td><f:formatNumber value="${p.unitPrice}" pattern="#,###" /></td>
								<td><f:formatNumber value="${p.discount}"
								type="percent" /></td>
								<td><input value="${p.quantity}" type="number" min="1"
									style="width: 40px"></td>
								<td class="amt"><f:formatNumber
										value="${p.quantity * p.unitPrice * (1-p.discount)}"
										pattern="#,###" /></td>
								<td>
									<button class="btn btn-sm btn-warning btn-cart-remove">
										<i class="glyphicon glyphicon-trash"></i>
									</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<button class="btn btn-sm btn-danger btn-cart-clear">Xóa</button>
				<button class="btn btn-sm btn-info">Tiếp tục</button>
				<a href="/order/checkout" class="btn btn-sm btn-success">Thanh
					toán</a>
			</div>
		</div>
	</div>
</div>
