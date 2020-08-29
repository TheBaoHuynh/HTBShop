<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
							<th>Mã sản phẩm</th>
							<th>Tên sản phẩm</th>
							<th>Giá</th>
							<th>Giảm giá</th>
							<th>Số lượng</th>
							<th>Thành tiền</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="p"
							items="${sessionScope['scopedTarget.cartService'].items}">
							<tr>
								<td>${p.id}</td>
								<td>${p.name}</td>
								<td><f:formatNumber value="${p.unitPrice}"
										pattern="#,###.00" /></td>
								<td><f:formatNumber value="${p.discount}"
								type="percent" /></td>
								<td>${p.quantity}</td>
								<td class="amt"><f:formatNumber
										value="${p.quantity * p.unitPrice * (1-p.discount)}"
										pattern="#,###" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="section-title">
					<h2 class="title">Thanh toán</h2>
					<h4>${msg}</h4>
					<div class="pull-right">
						<div class="product-slick-dots-2 custom-dots"></div>
					</div>
				</div>
				<c:set var="cart"
					value="${sessionScope['scopedTarget.cartService']}"></c:set>
				<form:form action="/order/checkout" modelAttribute="order">
					<div class="form-group">
						<label>Khách hàng</label>
						<form:input path="customer.id" class="form-control" readonly="true"/>
					</div>
					<div class="form-group">
						<label>Ngày đặt hàng</label>
						<form:input path="orderDate" class="form-control" readonly="true"/>
					</div>
					<div class="form-group">
						<label>Địa chỉ</label>
						<form:input path="address" class="form-control" />
					</div>
					<div class="form-group">
						<label>Tổng tiền</label>
						<%-- <f:formatNumber var="famount" value="${cart.amount}"
										pattern="#,###,###" /> --%>
						<form:input  path="amount" class="form-control" readonly="true"/>
					</div>
					<div class="form-group">
						<label>Ghi chú</label>
						<form:textarea path="description" rows="3" class="form-control" />
					</div>

					<div class="form-group">
						<button class="btn btn-danger">Thanh toán</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>