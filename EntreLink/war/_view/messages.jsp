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
 		<c:choose>
		
		
			<c:when test="${! empty loggedInName}">
				<h2>Messages</h2>
				<center><br/>
				
					<form action="${pageContext.servletContext.contextPath}/newmessage" method="compMessage">
						<input type="Submit" value="Compose New Message" class="msgUser">
					</form>
					
						<c:choose>
							<c:when test="${messages != null}">
								<c:forEach items="${messages}" var="msg">
									<br/>
									<table id="messageTable">
										<tr>
											<th>${msg.recipientName} - ${msg.subject}</th>
											<th style="text-align:right">Received ${msg.date}</th>
										</tr>
										<tr>
											<td colspan="2">${msg.body}</td>
										</tr>
									</table>
								</c:forEach>
							</c:when>
							<c:otherwise>
							<br/>
								<h3 style="color:red">You have no messages.</h3>
							</c:otherwise>
						</c:choose>
				</center>
			</c:when>
			
			
			<c:otherwise>
				<div style="font-size: 20px; text-align: center; width: 100%; font-family: sans-serif; margin-top: 100px;">You must be logged in to view your messages.</div>
				<form action="${pageContext.servletContext.contextPath}/login" method="get">
					<input type="Submit" name="submit" value="Log In" style="display: block; margin: 10px auto;">
				</form>
			</c:otherwise>
		</c:choose>
	</div>


</body>
</html>
