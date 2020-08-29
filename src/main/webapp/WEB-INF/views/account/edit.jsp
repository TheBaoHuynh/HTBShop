<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="section-title">
					<h2 class="title">Chỉnh sửa tài khoản</h2>
					<h4>${msg}</h4>
					<div class="pull-right">
						<div class="product-slick-dots-2 custom-dots"></div>
					</div>
				</div>
				<form:form action="/account/edit" modelAttribute="form"
					enctype="multipart/form-data">
					<div class="form-group">
						<label>Tên đăng nhập</label>
						<form:input path="id" class="form-control" readonly="true" />
					</div>
					<div class="form-group">
						<label>Họ và tên</label>
						<form:input path="fullname" class="form-control" />
					</div>
					<div class="form-group">
						<label>Email</label>
						<form:input path="email" class="form-control" />
					</div>
					<div class="form-group">
						<label>Ảnh</label> <img
							src="/static/images/customers/${form.photo}"
							style="width: 80px; height: 90px;"> <input type="file"
							name="photo_file">
						<form:hidden path="photo" class="form-control" />
					</div>

					<div class="form-group">
						<form:hidden path="password" />
						<form:hidden path="activated" />
						<form:hidden path="admin" />
						<button class="btn btn-default">Cập nhật</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>