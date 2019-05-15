<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>EntreLink - ${viewProfileName}'s Profile</title>
	<link rel="stylesheet" type="text/css" href="../_view/css/style.css">
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
		<c:choose>
			<c:when test="${!empty userv.userFirstName}">
				<h2>${userv.userFirstName} ${userv.userLastName}'s Profile</h2>
				<img src="${userv.profilePic}" id="profileImg">
				<h3>${userv.userFirstName} ${userv.userLastName}</h3>
				<p id="profileBio">${userv.bio}</p>
				<table id="profileTable">
				
					<c:choose>
						<c:when test="${userv.major != '' and userv.major != ' ' and userv.major != 'N/A' and userv.major != null}">
							<tr>
								<td class="leftTable">Major: </td>
								<td class="rightTable">${userv.major}</td>
							</tr>
						</c:when>
					</c:choose>
						
					<c:choose>
						<c:when test="${userv.status != '' and userv.status != ' ' and userv.status != 'N/A' and userv.status != null}">
							<tr>
								<td class="leftTable">Status: </td>
								<td class="rightTable">${userv.status}</td>
							</tr>
						</c:when>
					</c:choose>
					
					<c:choose>
						<c:when test="${userv.interests != '' and userv.interests != ' ' and userv.interests != 'N/A' and userv.interests != null}">
							<tr>
								<td class="leftTable">Interests: </td>
								<td class="rightTable">${userv.interests}</td>
							</tr>
						</c:when>
					</c:choose>
					
					<c:choose>
						<c:when test="${userv.skills != '' and userv.skills != ' ' and userv.skills != 'N/A' and userv.skills != null}">
							<tr>
								<td class="leftTable">Skills: </td>
								<td class="rightTable">${userv.skills}</td>
							</tr>
						</c:when>
					</c:choose>
					
					<c:choose>
						<c:when test="${userv.website != '' and userv.website != ' ' and userv.website != 'N/A' and userv.website != null}">
							<tr>
								<td class="leftTable">Website: </td>
								<td class="rightTable"><a target="_blank" href="${userv.website}">${userv.website}</a></td>
							</tr>
						</c:when>
					</c:choose>
					
				</table>
				<br/><br/>
				<c:choose>
					<c:when test="${posts != null}">
						<h3>${userv.userFirstName} ${userv.userLastName}'s Posts</h3><br/><br/>
							<c:forEach items="${posts}" var="post">
								<div postId="${post.postId}" class="listingPost">
					    			<h3 class="projectTitle">${post.title}<span class="projectPosted"> posted by ${viewProfileName} on ${post.timePosted}</span></h3>
					    			<div class="hideOverflow">
										<p class="projectDescription">${post.description}</p>
										
					        			<table style="width:100%">
					        				<tr>
												<td><p class="projectTags">Tags: ${post.tags}</p></td>
											</tr>
										</table>
					    			</div>
								</div>
						</c:forEach>
					</c:when>
				</c:choose>
			</c:when>
			<c:otherwise>
				<br/><br/>
				<h3 style="color:red">Error: No such user.</h3>
			</c:otherwise>
		</c:choose>
	</div>


</body>
</html>
