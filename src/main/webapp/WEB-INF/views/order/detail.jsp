<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>


<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="section-title">
					<h2 class="title">Thông tin đơn hàng</h2>
					<h4>${msg}</h4>
					<div class="pull-right">
						<div class="product-slick-dots-2 custom-dots"></div>
					</div>
				</div>
				<form:form action="/order/detail" modelAttribute="order">
					<div class="form-group">
						<label>Mã đơn hàng</label>
						<form:input path="id" class="form-control" readonly="true" />
					</div>
					<div class="form-group">
						<label>Khách hàng</label>
						<form:input path="customer.id" class="form-control"
							readonly="true" />
					</div>
					<div class="form-group">
						<label>Ngày đặt hàng</label>
						<form:input path="orderDate" class="form-control" readonly="true" />
					</div>
					<div class="form-group">
						<label>Địa chỉ</label>
						<form:input path="address" class="form-control" readonly="true" />
					</div>
					<div class="form-group">
						<label>Tổng tiền</label>
						<form:input path="amount" class="form-control" readonly="true" />
					</div>
					<div class="form-group">
						<label>Ghi chú</label>
						<form:textarea path="description" rows="3" class="form-control"
							readonly="true" />
					</div>
				</form:form>

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
						<c:forEach var="d" items="${details}">
							<tr>
								<td>${d.product.id}</td>
								<td>${d.product.name}</td>
								<td><f:formatNumber value="${d.unitPrice}"
										pattern="#,###.00" /></td>
								<td><f:formatNumber value="${p.discount}"
								type="percent" /></td>
								<td>${d.quantity}</td>
								<td class="amt"><f:formatNumber
										value="${d.quantity * d.unitPrice * (1-d.discount)}"
										pattern="#,###.00" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>