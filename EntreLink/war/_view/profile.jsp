<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>EntreLink - My Profile</title>
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
		<h2>My Profile</h2>
		<img src="${loggedInImg}" id="profileImg">
		
		<h3>${loggedInName}</h3>
		<center>
			<form action="${pageContext.servletContext.contextPath}/edituser" method="openEditUser">
				<input style="background-color:green;color:white;font-weight:bold;border-radius:4px;border:2px solid green;cursor:pointer;" type="Submit" name="editProfile" value="Edit Profile">
			</form>
		</center>
		
		<c:choose>
			<c:when test="${loggedInBio != ''}">
				<p id="profileBio">${loggedInBio}</p>
			</c:when>
			
			<c:otherwise>
				<center><p id="profileBio">${loggedInName}'s bio.</p></center>
			</c:otherwise>
		</c:choose>
		
		<table id="profileTable">
			<c:choose>
				<c:when test="${loggedInMajor != ''}">
					<tr>
						<td class="leftTable">Major: </td>
						<td class="rightTable">${loggedInMajor}</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td class="leftTable">Major: </td>
						<td class="rightTable">N/A</td>
					</tr>
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test="${loggedInStatus != ''}">
					<tr>
						<td class="leftTable">Status: </td>
						<td class="rightTable">${loggedInStatus}</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td class="leftTable">Status: </td>
						<td class="rightTable">N/A</td>
					</tr>
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test="${loggedInInterests != ''}">
					<tr>
						<td class="leftTable">Interests: </td>
						<td class="rightTable">${loggedInInterests}</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td class="leftTable">Interests: </td>
						<td class="rightTable">N/A</td>
					</tr>
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test="${loggedInSkills != ''}">
					<tr>
						<td class="leftTable">Skills: </td>
						<td class="rightTable">${loggedInSkills}</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td class="leftTable">Skills: </td>
						<td class="rightTable">N/A</td>
					</tr>
				</c:otherwise>
			</c:choose>
			
			<c:choose>
				<c:when test="${loggedInWebsite != ''}">
					<tr>
						<td class="leftTable">Website: </td>
						<td class="rightTable">
							<c:choose>
								<c:when test="${loggedInWebsite != 'N/A'}">
									<a target="_blank" href="${loggedInWebsite}">${loggedInWebsite}</a>
								</c:when>
								<c:otherwise>
									${loggedInWebsite}
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td class="leftTable">Website: </td>
						<td class="rightTable">N/A</td>
					</tr>
				</c:otherwise>
			</c:choose>
			
		</table>
		<br/><br/>
		<c:choose>
			<c:when test="${posts != null}">
				<h3>My Projects</h3>
				<c:forEach items="${posts}" var="post">
					<div postId="${post.postId}" class="listingPost">
	        			<h3 class="projectTitle">${post.title}<span class="projectPosted"> posted by ${loggedInName} on ${post.timePosted}</span></h3>
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
	</div>


</body>
</html>
