
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KeepNote</title>
</head>
<body>

	<!-- Create a form which will have text boxes for Note ID, title, content and status along with a Send 
		 button. Handle errors like empty fields -->

	<h2>Note Information</h2>

	<form action="add" method="post">

		Note ID:<input type="text" id="noteId" name="noteId">
		<c:if test="${not empty idError}">
			<p style="color: red"> ${idError}</p>
		</c:if>
		<br> Title: <input type="text" id="noteTitle" name="noteTitle"><br>
		Content: <input type="text" id="noteContent" name="noteContent"><br>
		Status: <select id="noteStatus" name="noteStatus">
			<option value="active">Active</option>
			<option value="inactive">Inactive</option>
		</select> <br> <br> <input type="submit" value="Add Note">

	</form>

	<br>
	<c:if test="${not empty error}">
		<p style="color: red">
			<b>Error</b>: ${error}
		</p>
	</c:if>
	<!-- display all existing notes in a tabular structure with Id, Title,Content,Status, Created Date and Action -->


	<table>
		<c:if test="${not empty allNotes}">
			<h2>Saved Notes</h2>
			<tr>
				<th>Note Id</th>
				<th>Note Title</th>
				<th>Note Content</th>
				<th>Note Status</th>
				<th>Note Created On</th>
				<th>Note Action</th>
			</tr>
		</c:if>

		<c:forEach items="${allNotes}" var="note">
			<tr>
				<th><c:out value="${note.noteId}" /></th>
				<th><c:out value="${note.noteTitle}" /></th>
				<th><c:out value="${note.noteContent}" /></th>
				<th><c:out value="${note.noteStatus}" /></th>
				<th><fmt:parseDate value="${note.createdAt}"
						pattern="yyyy-MM-dd" var="parsedDate" type="date" /> <fmt:formatDate
						value="${parsedDate}" var="stdDatum" type="date"
						pattern="dd.MM.yyyy" /></th>
						<th><form action="updateNote" method="post">
						<input type="hidden" id="noteId" name="noteId"
							value="${note.noteId}" />
						<button type="submit">Update</button>
					</form>
						</th>
				<th><form action="delete" method="post">
						<input type="hidden" id="noteId" name="noteId"
							value="${note.noteId}" />
						<button type="submit">Delete</button>
					</form></th>
			</tr>
		</c:forEach>

	</table>
</body>

</html>