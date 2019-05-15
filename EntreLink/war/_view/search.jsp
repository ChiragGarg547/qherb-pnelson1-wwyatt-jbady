<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>EntreLink - Messages</title>
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
		<form action="${pageContext.servletContext.contextPath}/search" method="post">
			<input type="Submit" name="viewSearch" value="Search" class="navLink" style="float: right;">
			<input type="text" name="search" id="searchBox" value="${search}">
		</form>
	</div>

	<div class="content">
 		<h2>Search Results 
 		<c:choose>
 			<c:when test="${posts != null and search != null and search != '' and search != ' '}">
 				for '${search}'
 			</c:when>
 		</c:choose>
 		
 		
 		</h2>
 		<br/>
 		<c:choose>
 			<c:when test="${posts != null}">
		 		<c:forEach items="${posts}" var="post">
					<div postId="${post.postId}" class="listingPost">
		    			<h3 class="projectTitle">${post.title}<span class="projectPosted"> posted by <a href="${pageContext.servletContext.contextPath}/viewProfile/${post.posterId}" style="display: inline; color: #111;">${post.name}</a> on ${post.timePosted}</span></h3>
		    			<div class="hideOverflow">
							<p class="projectDescription">${post.description}</p>
							
		        			<table style="width:100%">
		        				<tr>
									<td><p class="projectTags">Tags: ${post.tags}</p></td>
									
									<c:choose>
										<c:when test="${loggedInName != post.name}">
											<td style="text-align:right"><form action="${pageContext.servletContext.contextPath}/newmessage" method="compMessage">
												<input type="Submit" name="${post.name}" value="Message Student" class="msgUser">
											</form></td>
										</c:when>
									</c:choose>
								</tr>
							</table>
		    			</div>
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<h3 style="color:red">No projects or skills found</h3>
			</c:otherwise>
		</c:choose>
	</div>


</body>
</html>
