<%@page import="in.co.rays.proj4.controller.MarksheetCtl"%>
<%@page import="java.util.Iterator"%>
<%@page import="in.co.rays.proj4.bean.MarksheetBean"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="java.util.List"%>
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
	List<MarksheetBean> list = ServletUtility.getList(request);
	int pageNo = ServletUtility.getPageNo(request);
	int pageSize = ServletUtility.getPageSize(request);
	int index = (pageNo - 1) * pageSize + 1;
	Iterator<MarksheetBean> it = list.iterator();
	%>

	<%@include file="Header.jsp"%>

	<!-- pb-5 mb-5 keeps the last rows from hiding behind the fixed footer -->
	<div align="center" class="container-fluid px-3 pb-5 mb-5">

		<%-- OLD heading (kept): <h1>MarkSheet List</h1> --%>
		<h1 class="my-3">MarkSheet List</h1>

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

		<form action="<%=ORSView.MARKSHEET_LIST_CTL%>" method="post">

			<%-- OLD search table (kept, not deleted; replaced by the Bootstrap row below)
			<table>
				<tr>
					<th>Roll No.</th>
					<td><input type="number" name="rollNo"
						placeholder="search by roll no" value=""></td>

					<th>Name</th>
					<td><input type="text" name="name" value=""
						placeholder="search by name"><input type="submit"
						name="operation" value="<%=MarksheetCtl.OP_SEARCH%>"></td>
				</tr>
			</table>
			--%>

			<!-- NEW: Bootstrap search row (same field names, so MarksheetListCtl reads them as before) -->
			<div class="row g-2 justify-content-center align-items-end mb-3">

				<div class="col-12 col-md-auto text-start">
					<label class="form-label fw-bold mb-1">Roll No.</label>
					<input type="number" name="rollNo" class="form-control"
						placeholder="search by roll no" value="">
				</div>

				<div class="col-12 col-md-auto text-start">
					<label class="form-label fw-bold mb-1">Name</label>
					<input type="text" name="name" value="" class="form-control"
						placeholder="search by name">
				</div>

				<div class="col-12 col-md-auto">
					<input type="submit" name="operation"
						value="<%=MarksheetCtl.OP_SEARCH%>" class="btn btn-primary">
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
					<th>Roll No.</th>
					<th>Student Id</th>
					<th>Name</th>
					<th>Physics</th>
					<th>Chemistry</th>
					<th>Maths</th>
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
						<th>Roll No.</th>
						<th>Student Id</th>
						<th>Name</th>
						<th>Physics</th>
						<th>Chemistry</th>
						<th>Maths</th>
						<th>Edit</th>
					</tr>
				</thead>

				<%
				while (it.hasNext()) {
					MarksheetBean bean = it.next();
				%>
				<tr align="center">
					<td><input type="checkbox" name="ids" class="form-check-input"
						value="<%=bean.getId()%>"></td>

					<%-- OLD data cells (kept, not deleted; they used <th>, which made every value bold,
					     and the Edit cell had no closing </th>. Replaced by the <td> cells below.)
					<th><%=index++%></th>
					<th><%=bean.getRollNo()%></th>
					<th><%=bean.getStudentId()%></th>
					<th><%=bean.getName()%></th>
					<th><%=bean.getPhysics()%></th>
					<th><%=bean.getChemistry()%></th>
					<th><%=bean.getMaths()%></th>
					<th><a
						href="<%=ORSView.MARKSHEET_CTL + "?id=" + bean.getId()%>">Edit</a>
					--%>

					<td><%=index++%></td>
					<td><%=bean.getRollNo()%></td>
					<td><%=bean.getStudentId()%></td>
					<td><%=bean.getName()%></td>
					<td><%=bean.getPhysics()%></td>
					<td><%=bean.getChemistry()%></td>
					<td><%=bean.getMaths()%></td>
					<td><a class="btn btn-info btn-sm"
						href="<%=ORSView.MARKSHEET_CTL + "?id=" + bean.getId()%>">Edit</a></td>
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