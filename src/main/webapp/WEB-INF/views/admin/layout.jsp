<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>HTBStore-Trang quản trị</title>
<tiles:insertAttribute name="head" />
</head>
<body>

	<div class="container">
		<header class="row">
			<h1 class= "alert alert-success">HTBStore-Trang quản trị</h1>

		</header>
		<nav class="row">
			<tiles:insertAttribute name="menu" />
		</nav>
		<div class="row">
				<tiles:insertAttribute name="body"/>
		</div>
	<footer>
			<p class="text-center">&copy;2020 by Huynh The Bao</p>
	</footer>
		
	</div>

</body>
</html>