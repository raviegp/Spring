
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

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

	<P>The time on the server is ${serverTime}.</p>

	<form action="saveNote" method="post">

		Note ID:<br> <input type="text" id="noteId" name="noteId"><br>
		Title:<br> <input type="text" id="noteTitle" name="noteTitle"><br>
		Content:<br> <input type="text" id="noteContent"
			name="noteContent"><br> Status:<br> <select
			id="noteStatus" name="noteStatus">
			<option value="active">Active</option>
			<option value="inactive">Inactive</option>
		</select> <br> <br> <input type="submit" value="Add Note">

	</form>

	<br>
	<c:if test="${not empty error}">
		<p style="color: red"><b>Error</b>: ${error}</p>
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
				<th>Note Created At</th>
				<th>Note Action</th>
			</tr>
		</c:if>

		<c:forEach items="${allNotes}" var="note">
			<tr>
				<th><c:out value="${note.noteId}" /></th>
				<th><c:out value="${note.noteTitle}" /></th>
				<th><c:out value="${note.noteContent}" /></th>
				<th><c:out value="${note.noteStatus}" /></th>
				<th><c:out value="${note.createdAt}" /></th>
				<th><form action="deleteNote">
						<input type="hidden" id="noteId" name="noteId"
							value="${note.noteId}" />
						<button type="submit">Delete</button>
					</form></th>
			</tr>
		</c:forEach>

	</table>
</body>

</html>