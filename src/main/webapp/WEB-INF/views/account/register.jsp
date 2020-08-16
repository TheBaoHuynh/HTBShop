<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<h2>Đăng kí</h2>
<h4>${msg}</h4>
<form:form action="/account/register" modelAttribute="form" enctype="multipart/form-data">
<div class="form-group">
	<label>Tên đăng nhập</label> <form:input path="id" class="form-control"/>
	<form:errors path="id"></form:errors>
</div>
<div class="form-group">
	<label>Mật khẩu</label> <form:input path="password" class="form-control"/>
	<form:errors path="password"></form:errors>
</div>
<div class="form-group">
	<label>Họ và tên</label> <form:input path="fullname" class="form-control"/>
	<form:errors path="fullname"></form:errors>
</div>
<div class="form-group">
	<label>Email</label> <form:input path="email" class="form-control"/>
	<form:errors path="email"></form:errors>
</div>
<div class="form-group">
	<label>Ảnh</label>
	<input type="file" name="photo_file">
	<form:hidden path="photo" class="form-control"/>
</div>

<div class="form-group">
	<button class="btn btn-default">Đăng kí</button>
</div>
</form:form>