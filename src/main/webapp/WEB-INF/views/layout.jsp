<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>HTBStore</title>
<tiles:insertAttribute name="head" />
</head>
<body>
	<header>
		<tiles:insertAttribute name="menu" />
	</header>
	<div class="section">
		<tiles:insertAttribute name="body" />
	</div>

	<footer id="footer" class="section section-grey">
		<tiles:insertAttribute name="footer" />
	</footer>
</body>
	<!-- jQuery Plugins -->
	<script src="/static/themeplate/js/jquery.min.js"></script>
	<script src="/static/themeplate/js/bootstrap.min.js"></script>
	<script src="/static/themeplate/js/slick.min.js"></script>
	<script src="/static/themeplate/js/nouislider.min.js"></script>
	<script src="/static/themeplate/js/jquery.zoom.min.js"></script>
	<script src="/static/themeplate/js/main.js"></script>
	<script src="/static/themeplate/js/jquery.validate.min.js"></script>
	
	  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.12.4.js"></script>
  <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</html>