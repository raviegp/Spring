
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

	<h2>Update Note Information</h2>

	<form action="update" method="post">

		Note ID:<input type='text' value=${note.noteId} disabled>
		<input type="hidden" id="noteId" name="noteId"
			value=${note.noteId}> <br> 
		Title: <input type="text"
			id="noteTitle" name="noteTitle" value=${note.noteTitle}> <br>
		Content: <input type="text" id="noteContent" name="noteContent"
			value=${note.noteContent}> <br> 
		Status: <select
			id="noteStatus" name="noteStatus">
			<option value="active">Active</option>
			<option value="inactive">Inactive</option>
		</select> <br> <br> <input type="submit" value="Update Note">

	</form>

	<br>
	<c:if test="${not empty error}">
		<p style="color: red">
			<b>Error</b>: ${error}
		</p>
	</c:if>

</body>

</html>