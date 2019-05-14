<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
	<head>
		<title>EntreLink - Search</title>
	</head>

	<body>
		<div id="userBar">
			<h2>${loggedInName}</h2>
			<form action="${pageContext.servletContext.contextPath}/projects" method="openProjects">
				<input type="Submit" name="viewProjects" value="Projects">
			</form>
			<form action="${pageContext.servletContext.contextPath}/profile" method="openProfile">
				<input type="Submit" name="viewProjects" value="Profile">
			</form>
			<form action="${pageContext.servletContext.contextPath}/search" method="openSearch">
				<input type="Submit" name="viewProjects" value="Search">
			</form>
			<form action="${pageContext.servletContext.contextPath}/index" method="openHome">
				<input type="Submit" name="viewProjects" value="Home">
			</form>
		</div>
	
		<div id="Label">
			<p>Search</p>
		</div>
		<div id="searchBar">
			<input type="text" name="search" size="12"/>
			<input type="Submit" name="submitSearch" value="Search!">
		</div>
			<div id="description">
				it works
			</div>
	</body>
</html>
