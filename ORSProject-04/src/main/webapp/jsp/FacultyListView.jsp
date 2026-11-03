<%@page import="in.co.rays.proj4.controller.FacultyCtl"%>
<%@page import="java.util.Iterator"%>
<%@page import="in.co.rays.proj4.bean.FacultyBean"%>
<%@page import="java.util.List"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>

	<%
	String succ = ServletUtility.getSuccessMessage(request);
	String error = ServletUtility.getErrorMessage(request);
	List<FacultyBean> list = ServletUtility.getList(request);
	int pageNo = ServletUtility.getPageNo(request);
	int pageSize = ServletUtility.getPageSize(request);
	int index = (pageNo - 1) * pageSize + 1;
	Iterator<FacultyBean> it = list.iterator();
	%>

	<%@include file="Header.jsp"%>

	<!-- pb-5 mb-5 keeps the last rows from hiding behind the fixed footer -->
	<div align="center" class="container-fluid px-3 pb-5 mb-5">

		<%-- OLD heading (kept): <h1>Faculty List</h1> --%>
		<h1 class="my-3">Faculty List</h1>

		<%-- OLD messages (kept, not deleted; replaced by the Bootstrap alerts below)
		<h3 style="color: green"><%=succ%></h3>
		<h3 style="color: red"><%=error%></h3>
		--%>

		<%
		if (succ != null && !succ.trim().equals("")) {
		%>
		<div class="alert alert-success py-2 w-50 mx-auto" role="alert"><%=succ%></div>
		<%
		}
		%>

		<%
		if (error != null && !error.trim().equals("")) {
		%>
		<div class="alert alert-danger py-2 w-50 mx-auto" role="alert"><%=error%></div>
		<%
		}
		%>

		<form action="<%=ORSView.FACULTY_LIST_CTL%>" method="post">

			<%-- OLD search table (kept, not deleted; replaced by the Bootstrap row below)
			<table>
				<tr>
					<th>First Name</th>
					<td><input type="text" name="firstName" value=""
						placeholder="search by first name">

					<th>Last Name</th>
					<td><input type="text" name="lastName" value=""
						placeholder="search by last name"><input type="submit"
						name="operation" value="<%=FacultyCtl.OP_SEARCH%>"></td>
				</tr>
			</table>
			--%>

			<!-- NEW: Bootstrap search row (same field names, so FacultyListCtl reads them as before) -->
			<div class="row g-2 justify-content-center align-items-end mb-3">

				<div class="col-12 col-md-auto text-start">
					<label class="form-label fw-bold mb-1">First Name</label>
					<input type="text" name="firstName" value="" class="form-control"
						placeholder="search by first name">
				</div>

				<div class="col-12 col-md-auto text-start">
					<label class="form-label fw-bold mb-1">Last Name</label>
					<input type="text" name="lastName" value="" class="form-control"
						placeholder="search by last name">
				</div>

				<div class="col-12 col-md-auto">
					<input type="submit" name="operation"
						value="<%=FacultyCtl.OP_SEARCH%>" class="btn btn-primary">
				</div>

			</div>

			<%-- OLD table tag (kept): <table border="10px" width="100%"> --%>
			<div class="table-responsive">
			<table class="table table-bordered table-hover table-striped align-middle text-center">

				<%-- OLD header row (kept, not deleted; replaced by the thead below)
				<tr style="background: skyblue">
					<th><input type="checkbox"
						onclick="document.querySelectorAll('input[name=ids]').forEach(c=>c.checked=this.checked)">Select
						All</th>
					<th>S No.</th>
					<th>College Id</th>
					<th>College Name</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Mobile No</th>
					<th>Address</th>
					<th>Gender</th>
					<th>DOB</th>
					<th>Edit</th>
				</tr>
				--%>

				<thead class="table-info">
					<tr>
						<th>
							<div class="form-check d-flex justify-content-center align-items-center gap-2 mb-0">
								<input class="form-check-input" type="checkbox"
									onclick="document.querySelectorAll('input[name=ids]').forEach(c=>c.checked=this.checked)">
								<label class="form-check-label">Select All</label>
							</div>
						</th>
						<th>S No.</th>
						<th>College Id</th>
						<th>College Name</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Email</th>
						<th>Mobile No</th>
						<th>Address</th>
						<th>Gender</th>
						<th>DOB</th>
						<th>Edit</th>
					</tr>
				</thead>

				<%
				while (it.hasNext()) {
					FacultyBean bean = it.next();
				%>
				<tr align="center">
					<td><input type="checkbox" name="ids" class="form-check-input"
						value="<%=bean.getId()%>"></td>
					<td><%=index++%></td>
					<td><%=bean.getCollegeId()%></td>
					<td><%=bean.getCollegeName()%></td>
					<td><%=bean.getFirstName()%></td>
					<td><%=bean.getLastName()%></td>
					<td><%=bean.getEmail()%></td>
					<td><%=bean.getMobileNo()%></td>
					<td><%=bean.getAddress()%></td>
					<td><%=bean.getGender()%></td>
					<td><%=bean.getDateOfBirth()%></td>
					<%-- OLD edit link (kept; it was missing its closing </td>): <td><a href="<%=ORSView.FACULTY_CTL + "?id=" + bean.getId()%>">Edit</a> --%>
					<td><a class="btn btn-info btn-sm" href="<%=ORSView.FACULTY_CTL + "?id=" + bean.getId()%>">Edit</a></td>
				</tr>
				<%
				}
				%>

				<%@include file="ListFooter.jsp"%>
			</table>
			</div>

		</form>
	</div>
	<%@include file="Footer.jsp"%>
</body>
</html>