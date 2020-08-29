<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>

<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="section-title">
					<h2 class="title">Quên mật khẩu</h2>
					<h4>${msg}</h4>
					<div class="pull-right">
						<div class="product-slick-dots-2 custom-dots"></div>
					</div>
				</div>
				<form action="/account/forgot" method="POST">
					<div class="form-group">
						<label>Tên đăng nhập</label> <input name="id" class="form-control">
					</div>
					<div class="form-group">
						<label>Email</label> <input name="email" class="form-control">
					</div>

					<div class="form-group">
						<button class="btn-login">Nhận lại mật khẩu</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>