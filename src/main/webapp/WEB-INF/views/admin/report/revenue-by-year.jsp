<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>

<h2 class="alert alert-success">Doanh thu theo năm</h2>
<table class="table table-hover">
	<thead>
		<tr>
			<th>Năm</th>
			<th>Số lượng</th>
			<th>Danh số</th>
			<th>Giá bán thấp nhất</th>
			<th>Giá bán cao nhât</th>
			<th>Giá bán trung bình</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="e" items="${data}">
			<tr>
				<td>${e[0]}</td>
				<td>${e[1]}</td>
				<td><f:formatNumber value="${e[2]}" pattern="#,###,###.00" />VNĐ</td>
				<td><f:formatNumber value="${e[3]}" pattern="#,###,###.00" />VNĐ</td>
				<td><f:formatNumber value="${e[4]}" pattern="#,###,###.00" />VNĐ</td>
				<td><f:formatNumber value="${e[5]}" pattern="#,###,###.00" />VNĐ</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

