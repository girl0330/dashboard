<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
  <tiles:insertAttribute name="meta" />
  <title>
    <tiles:insertAttribute name="title" ignore="true" />
  </title>
  <tiles:insertAttribute name="styles" />
</head>
<body>
<!-- header start -->
<header class="header bg-dark">
  <tiles:insertAttribute name="header" />
</header>
<tiles:insertAttribute name="script" />
<!--  header end -->

<!-- main start -->
<main id="main" class="main">
<tiles:insertAttribute name="content" />
</main>
<!-- main end -->

<!-- footer start -->
<footer class="footer mt-0">
  <tiles:insertAttribute name="footer" />
</footer>
<!-- footer end -->

<!-- Back To Top start -->
<div id="back-to-top" class="back-to-top">
  <i class="fas fa-angle-up"></i>
</div>
<!-- Back To Top end -->


</body>
</html>
