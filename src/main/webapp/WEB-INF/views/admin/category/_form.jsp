<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="panel panel-default">
	<div class="panel-body">
		<form:form action="${base}/index" modelAttribute="entity">
			<div class="form-group">
				<label>Mã danh mục</label>
				<form:input path="id" class="form-control" readonly="true"/>
			</div>
			<div class="form-group">
				<label>Tên danh mục</label>
				<form:input path="name" class="form-control" required="required" 
							oninvalid="this.setCustomValidity('Vui lòng nhập đúng yêu cầu')"
							onkeyup="setCustomValidity('')"/>
			</div>
			<div class="form-group">
				<button class="btn btn-primary" formaction="${base}/create">Thêm</button>
				<button class="btn btn-warning" formaction="${base}/update">Sửa</button>
				<button class="btn btn-danger" formaction="${base}/delete">Xóa</button>
				<a class="btn btn-default" href="${base}/index">Khôi phục</a>
			</div>
		</form:form>

	</div>
</div>
