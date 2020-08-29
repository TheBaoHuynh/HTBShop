<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="section-title">
					<h2 class="title">Đăng kí</h2>
					<h4>${msg}</h4>
					<div class="pull-right">
						<div class="product-slick-dots-2 custom-dots"></div>
					</div>
				</div>
				<form:form action="/account/register" modelAttribute="form"
					enctype="multipart/form-data" id="form">

					<div class="col-sm-6">
						<div class="form-group">
							<label>Tên đăng nhập *</label>
							<form:input path="id" class="form-control"
								title="Không được để trống" placeholder="Tên đăng nhập"
								required="required" id="username"
								oninvalid="this.setCustomValidity('Vui lòng nhập đúng yêu cầu')"
								onkeyup="setCustomValidity('')" />
							<form:errors path="id" style="color:red"></form:errors>
						</div>
						<div class="form-group">
							<label>Mật khẩu *(Từ 6-20 kí tự)</label>
							<form:input path="password" class="form-control" type="password"
								title="Vui lòng nhập đúng yêu cầu" pattern=".{6,}"
								placeholder="Mật khẩu phải từ 6-20 kí tự" required="required"
								oninvalid="this.setCustomValidity('Vui lòng nhập đúng yêu cầu')"
								onkeyup="setCustomValidity('')" />
							<form:errors path="password" style="color:red"></form:errors>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
							<label>Họ và tên *</label>
							<form:input path="fullname" class="form-control"
								title="Vui lòng nhập đúng yêu cầu"
								placeholder="Không được để trống" required="required"
								oninvalid="this.setCustomValidity('Vui lòng nhập đúng yêu cầu')"
								onkeyup="setCustomValidity('')" />
							<form:errors path="fullname" style="color:red"></form:errors>
						</div>
						<div class="col-sm-12">
							<div class="form-group">
								<label>Email*</label>
								<form:input path="email" class="form-control"
									pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"
									title="Nhập đúng định dạng email" placeholder="Nhập email"
									required="required"
									oninvalid="this.setCustomValidity('Không được để trống và nhập đúng định dạng')"
									onkeyup="setCustomValidity('')" />
								<form:errors path="email" style="color:red"></form:errors>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label>Ảnh</label> <input type="file" name="photo_file">
						<form:hidden path="photo" class="form-control" />
					</div>

					<div class="form-group">
						<button class="btn btn-default">Đăng kí</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>
<script>
	var input = document.getElementById('username');
</script>

