<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>EntreLink - Projects</title>
	<link rel="stylesheet" type="text/css" href="_view/css/style.css">
</head>
<body>

	<div id="navbar">
		<c:choose>
			<c:when test="${empty loggedInName}">
				<form action="${pageContext.servletContext.contextPath}/login" method="get">
					<input type="Submit" name="submit" value="Log In" class="navLink">
				</form>
			</c:when>
			<c:otherwise>
					<div class="navLink" style="padding:0;" id="profileLink">
						<img id="userPic" src="${loggedInImg}" style="border-radius: 100%;width: 40px;display: inline-block;float: left;margin-top:14px;margin-left:10px;">
						<input type="Submit" name="submit" value="${loggedInName}" class="navLink">
						<div id="profileDropdown">
							<form action="${pageContext.servletContext.contextPath}/profile" method="openProfile">
								<input type="Submit" name="profile" value="Profile" class="navLink">
							</form>
							<form action="${pageContext.servletContext.contextPath}/messages" method="get">
								<input type="Submit" name="messages" value="Messages" class="navLink">
							</form>
							<form action="${pageContext.servletContext.contextPath}/logout" method="get">
								<input type="Submit" name="logout" value="Log Out" class="navLink">
							</form>
						</div>
					</div>
			</c:otherwise>
		</c:choose>

		<form action="${pageContext.servletContext.contextPath}/index" method="openHome">
			<input type="Submit" name="viewIndex" value="Home" class="navLink">
		</form>
		<form action="${pageContext.servletContext.contextPath}/projects" method="openProjects">
			<input type="Submit" name="viewProjects" value="Projects" class="navLink">
		</form>
		<form action="${pageContext.servletContext.contextPath}/search" method="openSearch">
			<input type="Submit" name="viewSearch" value="Search" class="navLink" style="float: right;">
			<input type="text" name="searchText" id="searchBox">
		</form>
	</div>

	<div class="content">
		<h2>Projects</h2>
		<div id="filterProjects">
			Filter by:
			<form action="${pageContext.servletContext.contextPath}/projects" method="post" id="filterForm">
				<select onchange="this.form.submit()" name="filterBy" value="${filterBy}">
					<option>All Listings</option>
					<option>Business Proposals</option>
					<option>Student Proposals</option>
					<option>Student Skills</option>
				</select>
			</form>
		</div>
		
		<c:forEach items="${posts}" var="post">
			<div postId="${post.postId}" class="listingPost">
    			<h3 class="projectTitle">${post.title}<span class="projectPosted"> posted by ${post.name} on ${post.timePosted}</span></h3>
    			<div class="hideOverflow">
					<p class="projectDescription">${post.description}</p>
					
        			<table style="width:100%">
        				<tr>
							<td><p class="projectTags">Tags: ${post.tags}</p></td>
							
							<c:choose>
								<c:when test="${loggedInName != post.name}">
									<td style="text-align:right"><form action="${pageContext.servletContext.contextPath}/newmessage" method="compMessage">
									<c:choose>
										<c:when test="${post.postType != 2}">
											<input type="Submit" name="${post.name}" value="Message Student" class="msgUser">
										</c:when>
										<c:otherwise>
											<input type="Submit" name="${post.name}" value="Message Business" class="msgUser">
										</c:otherwise>
									</c:choose>
									</form></td>
								</c:when>
							</c:choose>
						</tr>
					</table>
    			</div>
			</div>
		</c:forEach>
	</div>


</body>
</html>
