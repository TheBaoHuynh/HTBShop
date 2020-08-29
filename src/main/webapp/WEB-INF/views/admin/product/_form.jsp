<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="panel panel-default">
	<div class="panel-body">
		<form:form action="${base}/index" modelAttribute="entity"
			enctype="multipart/form-data">
			<div class="col-sm-6">
				<div class="form-group">
					<label>Mã sản phẩm</label>
					<form:input path="id" class="form-control" readonly="true"
						placeholder="" />
				</div>
				<div class="form-group">
					<label>Tên sản phẩm</label>
					<form:input path="name" class="form-control" required="required"
						id="name" placeholder="Tên sản phẩm"
						oninvalid="this.setCustomValidity('Vui lòng nhập đúng yêu cầu')"
						onkeyup="setCustomValidity('')" />
				</div>
				<div class="form-group">
					<label>Đơn giá</label>
					<form:input path="unitPrice" class="form-control" type="number"
						required="required" id="unitPrice"
						oninvalid="this.setCustomValidity('Vui lòng nhập đúng yêu cầu')"
						onkeyup="setCustomValidity('')" />
				</div>
				<div class="form-group">
					<label>Số lượng</label>
					<form:input path="quantity" class="form-control" />
				</div>
				<div class="form-group">
					<label>Giảm giá</label>
					<form:input path="discount" class="form-control" type="number"/>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="form-group">
					<label>Ngày nhập</label>
					<form:input path="productDate" id="datepicker" class="form-control" />
				</div>
				<div class="form-group">
					<label>Lượt xem</label>
					<form:input path="viewCount" class="form-control" />
				</div>
				<div class="form-group">
					<label>Đặt biệt?</label>
					<div class="form-control">
						<form:radiobutton path="special" value="true" label="Yes" />
						<form:radiobutton path="special" value="false" label="No" />
					</div>
				</div>
				<div class="form-group">
					<label>Trạng thái</label>
					<div class="form-control">
						<form:radiobutton path="available" value="true" label="Còn" />
						<form:radiobutton path="available" value="false" label="Hết hàng" />
					</div>
				</div>
				<div class="form-group">
					<label>Danh mục</label>
					<form:select path="category.id">
						<form:options items="${cates}" itemLabel="name" itemValue="id" />
					</form:select>
				</div>
			</div>
			<div class="col-sm-12">
				<div class="form-group">
					<label>Ảnh</label> <input type="file" name="image-file"
						class="form-control" />
					<form:hidden path="image" />
				</div>
			</div>
			<div class="col-sm-12">
				<div class="form-group">
					<label>Mô tả</label>
					<form:textarea path="description" rows="5" class="form-control" />
				</div>
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

<script type="text/javascript">
	//nicEdit
	bkLib.onDomLoaded(function() {
		nicEditors.allTextAreas()
	});
	//datepiker
	$(function() {
		$("#datepicker").datepicker();
	});
</script>
