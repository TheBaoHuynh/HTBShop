<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="section-title">
					<h2 class="title">Đơn hàng</h2>
					<h4>${msg}</h4>
					<div class="pull-right">
						<div class="product-slick-dots-2 custom-dots"></div>
					</div>
				</div>
				<table class="table">
					<thead>
						<tr>
							<th>Mã đơn hàng</th>
							<th>Ngày đặt</th>
							<th>Địa chỉ nhận</th>
							<th>Tổng số tiền</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="o" items="${orders}">
							<tr>
								<td>${o.id}</td>
								<td>${o.orderDate}</td>
								<td>${o.address}</td>
								<td><f:formatNumber value="${o.amount}" pattern="#,###.00" /></td>
								<td><a href="/order/detail/${o.id}"
									class="btn btn-sm btn-warning btn-cart-remove"> Chi tiết </a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
