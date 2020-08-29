<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="panel panel-default">
	<div class="panel-body">
		<form:form action="${base}/index" modelAttribute="entity"
			enctype="multipart/form-data">
			<div class="col-sm-6">
				<div class="form-group">
					<label>Tên đăng nhập</label>
					<form:input path="id" class="form-control"
						readonly="${!empty entity.id}" required="required" id="name"
						placeholder="Tên đăng nhập"
						oninvalid="this.setCustomValidity('Vui lòng nhập đúng yêu cầu')"
						onkeyup="setCustomValidity('')" />
				</div>
				<div class="form-group">
					<label>Mật khẩu</label>
					<form:input path="password" class="form-control" type="password"
						readonly="${!empty entity.id}" />
				</div>
				<div class="form-group">
					<label>Tên khách hàng</label>
					<form:input path="fullname" class="form-control"
						required="required" id="name" placeholder="Tên sản khách hàng"
						oninvalid="this.setCustomValidity('Vui lòng nhập đúng yêu cầu')"
						onkeyup="setCustomValidity('')" />
				</div>
			</div>
			<div class="col-sm-6">
				<div class="form-group">
					<label>Email</label>
					<form:input path="email" class="form-control" required="required"
						id="name" placeholder="Tên sản phẩm"
						pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"
						title="Nhập đúng định dạng email" placeholder="Nhập email"
						oninvalid="this.setCustomValidity('Vui lòng nhập đúng yêu cầu')"
						onkeyup="setCustomValidity('')" />
				</div>
				<div class="form-group">
					<label>Trạng thái</label>
					<div class="form-control">
						<form:radiobutton path="activated" value="true" label="Yes" />
						<form:radiobutton path="activated" value="false" label="No" />
					</div>
				</div>
				<div class="form-group">
					<label>Quyền</label>
					<div class="form-control">
						<form:radiobutton path="admin" value="true" label="Admin" />
						<form:radiobutton path="admin" value="false" label="Khách hàng" />
					</div>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="form-group">
					<label>Ảnh</label> <input type="file" name="photo-file"
						class="form-control" />
					<form:hidden path="photo" />
				</div>
			</div>
			<div class="col-sm-6">
				<div class="form-group">
					<button class="btn btn-primary" formaction="${base}/create">Thêm</button>
					<button class="btn btn-warning" formaction="${base}/update">Sửa</button>
					<button class="btn btn-danger" formaction="${base}/delete">Xóa</button>
					<a class="btn btn-default" href="${base}/index">Khôi phục</a>
				</div>
			</div>
		</form:form>

	</div>
</div>
