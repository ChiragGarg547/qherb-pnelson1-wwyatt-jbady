<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>EntreLink - Edit User</title>
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
		<h2>Edit User</h2>
				<form action="${pageContext.servletContext.contextPath}/editUser" method="post">
					<table id="newUserTable">
						<c:choose>
							<c:when test="${loggedInImg != 'https://i.imgur.com/46FYTE7.png'}">
								<tr>
									<td class="leftTable">Picture </td>
									<td class="rightTable"><input type="text" name="loggedInImg" size="12" value="${loggedInImg}" class="signupBox"></td>
								</tr>	
							</c:when>
							<c:otherwise>
								<tr>
									<td class="leftTable">Picture </td>
									<td class="rightTable"><input type="text" name="loggedInImg" size="12" value="" class="signupBox"></td>
								</tr>	
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${loggedInBio != '' and loggedInBio != ' ' and loggedInBio != 'N/A'}">
								<tr>
									<td class="leftTable">Bio </td>
									<td class="rightTable"><textarea type="text" name="loggedInBio" size="12" value="${loggedInBio}" class="signupBox" style="width:400px; max-width:400px; max-height: 300px; min-width:400px;">${loggedInBio}</textarea></td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<td class="leftTable">Bio </td>
									<td class="rightTable"><textarea type="text" name="loggedInBio" size="12" value="" class="signupBox" style="width:400px; max-width:400px; max-height: 300px; min-width:400px;"></textarea></td>
								</tr>
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${loggedInMajor != '' and loggedInMajor != ' ' and loggedInMajor != 'N/A'}">
								<tr>
									<td class="leftTable">Major </td>
									<td class="rightTable"><input type="text" name="loggedInMajor" size="12" value="${loggedInMajor}" class="signupBox"></td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<td class="leftTable">Major </td>
									<td class="rightTable"><input type="text" name="loggedInMajor" size="12" value="" class="signupBox"></td>
								</tr>
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${loggedInStatus != '' and loggedInStatus != ' ' and loggedInStatus != 'N/A'}">
								<tr>
									<td class="leftTable">Status </td>
									<td class="rightTable"><input type="text" name="loggedInStatus" size="12" value="${loggedInStatus}" class="signupBox"></td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<td class="leftTable">Status </td>
									<td class="rightTable"><input type="text" name="loggedInStatus" size="12" value="" class="signupBox"></td>
								</tr>
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${loggedInInterests != '' and loggedInInterests != ' ' and loggedInInterests != 'N/A'}">
								<tr>
									<td class="leftTable">Interests </td>
									<td class="rightTable"><input type="text" name="loggedInInterests" size="12" value="${loggedInInterests}" class="signupBox"></td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<td class="leftTable">Interests </td>
									<td class="rightTable"><input type="text" name="loggedInInterests" size="12" value="" class="signupBox"></td>
								</tr>
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${loggedInSkills != '' and loggedInSkills != ' ' and loggedInSkills != 'N/A'}">
								<tr>
									<td class="leftTable">Skills </td>
									<td class="rightTable"><input type="text" name="loggedInSkills" size="12" value="${loggedInSkills}" class="signupBox"></td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<td class="leftTable">Skills </td>
									<td class="rightTable"><input type="text" name="loggedInSkills" size="12" value="" class="signupBox"></td>
								</tr>
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${loggedInWebsite != '' and loggedInWebsite != ' ' and loggedInWebsite != 'N/A'}">
								<tr>
									<td class="leftTable">Website </td>
									<td class="rightTable"><input type="text" name="loggedInWebsite" size="12" value="${loggedInWebsite}" class="signupBox"></td>
								</tr>	
							</c:when>
							<c:otherwise>
								<tr>
									<td class="leftTable">Website </td>
									<td class="rightTable"><input type="text" name="loggedInWebsite" size="12" value="" class="signupBox"></td>
								</tr>	
							</c:otherwise>
						</c:choose>
										
					</table>
					<input type="Submit" name="edituser" value="Confirm" style="display: block; margin: 10px auto;" method="post">
				</form>
	</div>

	
</body>
</html>
