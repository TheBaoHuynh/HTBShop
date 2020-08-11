<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<h2>Đăng nhập</h2>
<h4>${msg}</h4>
<form action="/account/login" method="POST">
<div class="form-group">
	<label>Ten dang nhap</label> <input name="id" class="form-control" value="${uid}">
</div>
<div class="form-group">
	<label>Mat khau</label> <input name="pw" class="form-control" value="${pwd}">
</div>
<div class="form-group">
	<div class="form-control">
		<label>Nho mat khau?</label> <input name="rm" type="checkbox">
	</div>
</div>
<div class="form-group">
	<button class="btn-login">Dang nhap</button>
</div>
</form>