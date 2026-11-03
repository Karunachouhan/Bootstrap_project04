<%@page import="in.co.rays.proj4.controller.UserCtl"%>
<%@page import="java.util.Iterator"%>
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
	List<UserBean> list = ServletUtility.getList(request);
	int pageNo = ServletUtility.getPageNo(request);
	int pageSize = ServletUtility.getPageSize(request);
	int index = (pageNo - 1) * pageSize + 1;
	Iterator<UserBean> it = list.iterator();
	%>
	<%@ include file="Header.jsp"%>

	<!-- pb-5 mb-5 keeps the last rows from hiding behind the fixed footer -->
	<div align="center" class="container-fluid px-3 pb-5 mb-5">

		<%-- OLD heading (kept): <h1>User List</h1> --%>
		<h1 class="my-3">User List</h1>

		<%-- OLD messages (kept, not deleted; replaced by the Bootstrap alerts below)
		<h3 style="color: red"><%=succ%></h3>
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

		<form action="<%=ORSView.USER_LIST_CTL%>" method="post">

			<%-- OLD search table (kept, not deleted; replaced by the Bootstrap row below)
			<table>
				<tr>
					<th>First Name</th>
					<td><input type="text" name="firstName" value=""
						placeholder="search by first name"></td>

					<th>Last Name</th>
					<td><input type="text" name="lastName" value=""
						placeholder="search by last name"></td>

					<th>Login</th>
					<td><input type="email" name="login" value=""
						placeholder="search by login"></td>

					<th>Dob</th>
					<td><input type="date" name="dob" value=""
						placeholder="search by dob"><input type="submit"
						name="operation" value="<%=UserCtl.OP_SEARCH%>"></td>
				</tr>
			</table>
			--%>

			<!-- NEW: Bootstrap search row (same field names, so UserListCtl reads them as before) -->
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

				<div class="col-12 col-md-auto text-start">
					<label class="form-label fw-bold mb-1">Login</label>
					<input type="email" name="login" value="" class="form-control"
						placeholder="search by login">
				</div>

				<div class="col-12 col-md-auto text-start">
					<label class="form-label fw-bold mb-1">Dob</label>
					<input type="date" name="dob" value="" class="form-control"
						placeholder="search by dob">
				</div>

				<div class="col-12 col-md-auto">
					<input type="submit" name="operation"
						value="<%=UserCtl.OP_SEARCH%>" class="btn btn-primary">
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
					<th>First Name</th>
					<th>Last Name</th>
					<th>Login</th>
					<th>Gender</th>
					<th>Dob</th>
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
						<th>First Name</th>
						<th>Last Name</th>
						<th>Login</th>
						<th>Gender</th>
						<th>Dob</th>
						<th>Edit</th>
					</tr>
				</thead>

				<%
				while (it.hasNext()) {
					UserBean bean = it.next();
				%>
				<tr align="center">
					<td><input type="checkbox" name="ids" class="form-check-input"
						value="<%=bean.getId()%>"></td>
					<td><%=index++%></td>
					<td><%=bean.getFirstName()%></td>
					<td><%=bean.getLastName()%></td>
					<td><%=bean.getLogin()%></td>
					<td><%=bean.getGender()%></td>
					<td><%=bean.getDob()%></td>
					<%-- OLD edit link (kept): <td><a href="<%=ORSView.USER_CTL + "?id=" + bean.getId()%>">Edit</a></td> --%>
					<td><a class="btn btn-info btn-sm" href="<%=ORSView.USER_CTL + "?id=" + bean.getId()%>">Edit</a></td>
				</tr>
				<%
				}
				%>

				<%@ include file="ListFooter.jsp"%>
			</table>
			</div>
		</form>
	</div>
	<%@ include file="Footer.jsp"%>
</body>
</html>