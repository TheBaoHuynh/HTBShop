<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>


<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="section-title">
					<h2 class="title">Đăng nhập</h2>
					<h4>${msg}</h4>
					<div class="pull-right">
						<div class="product-slick-dots-2 custom-dots"></div>
					</div>
				</div>
				<form action="/account/login" method="POST">
					<div class="form-group">
						<label>Tên đăng nhập</label> <input name="id" id="id" class="form-control"
							value="${uid}">
					</div>
					<div class="form-group">
						<label>Mật khẩu</label> <input name="pw" class="form-control" type="password"
							value="${pwd}">
					</div>
					<div class="form-group">
						<div class="form-control">
							<label>Nhớ mật khẩu</label> <input name="rm" type="checkbox">
						</div>
					</div>
					<div class="form-group">
						<button class="btn-login">Đăng nhập</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>