<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<table class="table table-hover">
	<thead>
		<tr>
		<th>Mã</th>
		<th>Tên</th>
		<th>Email</th>
		<th>Trạng thái</th>
		<th>Quyền</th>
		</tr>
	</thead>
	<tbody id="tbody">
<%-- 	<c:forEach var="e" items="${list}">
		<tr>
			<td>${e.id}</td>
			<td>${e.fullname}</td>
			<td>${e.email}</td>
			<td>${e.activated ? 'Đã kích hoat':'Chưa kích hoạt'}</td>
			<td>${e.admin ? 'Adminstrator':'Khách hàng'}</td>
			<td>
				<a class="btn btn-sm btn-danger" href="${base}/delete/${e.id}">Xóa</a>
				<a class="btn btn-sm btn-info" href="${base}/edit/${e.id}">Sửa</a>
			</td>
		</tr>
	</c:forEach> --%>
	</tbody>
</table>
<!--phan trang  -->
<ul class="pager">
  <li><a href="#">Trang đầu</a></li>
  <li><a href="#">Trang trước</a></li>
  <li><a href="#"><span id="page-info"></span></a></li>
  <li><a href="#">Trang sau</a></li>
  <li><a href="#">Trang cuối</a></li>
</ul>

<script type="text/javascript">
$(function() {
	var pageNo = 0;
	var pageCount = 0;
	var pageSize = 10;
	$.ajax({
		url:'/pager/customer/page-count',
		success: function(response){
			pageCount =response;
			$(".pager a:eq(0)").click();
		}
	});
	$(".pager a:eq(0)").click(function() {
		pageNo = 0;
		$.ajax({
			url:'/pager/customer/page/' + pageNo,
			success: handle
		})
		return false;
		
	});
	
	$(".pager a:eq(1)").click(function() {
		if(pageNo > 0){
			pageNo--;
			$.ajax({
				url:'/pager/customer/page/' + pageNo,
				success: handle
			})
		}
		
		return false;
	});

	$(".pager a:eq(3)").click(function() {
		if(pageNo < pageCount-1){
			pageNo++;
			$.ajax({
				url:'/pager/customer/page/' + pageNo,
				success: handle
			})
		}
	
		return false;
	});
	$(".pager a:eq(4)").click(function() {
		pageNo = pageCount-1;
		$.ajax({
			url:'/pager/customer/page/' + pageNo,
			success: handle
		})
		return false;
	});
	function handle(response){
			$("#tbody").html("")
			$(response).each(function(index, user){
				var tr = $("<tr/>");
				var td = $("<td/>").html(user.id).appendTo(tr);
				var td = $("<td/>").html(user.fullname).appendTo(tr);
				var td = $("<td/>").html(user.email).appendTo(tr);
				var td = $("<td/>").html(user.activated? 'Đã kích hoạt':'Chưa kích hoạt').appendTo(tr);
				var td = $("<td/>").html(user.admin ? 'Admin':'Khách hàng').appendTo(tr);
				var s = `<td class="text-center">
					<a class="btn btn-sm btn-danger" href="/admin/customer/delete/`+user.id+`">Xóa</a>
					<a class="btn btn-sm btn-info" href="/admin/customer/edit/`+user.id+`">Sửa</a>
				</td>`;
				$(s).appendTo(tr);
				tr.appendTo("tbody")
				$("#page-info").html((pageNo+1)+'/'+pageCount);
			});
	}
});
</script>
