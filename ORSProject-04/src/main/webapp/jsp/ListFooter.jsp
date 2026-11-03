<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.bean.RoleBean"%>
<%@page import="java.util.List"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	int pageNo1 = ServletUtility.getPageNo(request);
	List nextList = (List) request.getAttribute("nextList");
	%>
	<table width="100%">
		<input type="hidden" name="pageNo" value="<%=pageNo1%>">
		<tr>
		<tr>

			<%-- OLD buttons (kept, not deleted; replaced by the Bootstrap buttons below)

			<td><input type="submit" name="operation"
				<%=pageNo1 == 1 ? "disabled" : ""%> value="<%=BaseCtl.OP_PREVIOUS%>"></td>
			<td align="center"><input type="submit" name="operation"
				value="<%=BaseCtl.OP_DELETE%>"></td>
			<td align="right"><input type="submit" name="operation"
				<%=nextList.size() == 0 ? "disabled" : ""%>
				value="<%=BaseCtl.OP_NEXT%>"></td>

			--%>

			<!-- NEW: Previous = btn-warning when enabled, btn-secondary when disabled -->
			<td class="py-2"><input type="submit" name="operation"
				class="btn <%=pageNo1 == 1 ? "btn-secondary" : "btn-warning"%>"
				<%=pageNo1 == 1 ? "disabled" : ""%> value="<%=BaseCtl.OP_PREVIOUS%>"></td>

			<!-- NEW: Delete = btn-danger -->
			<td align="center" class="py-2"><input type="submit" name="operation"
				class="btn btn-danger"
				value="<%=BaseCtl.OP_DELETE%>"></td>

			<!-- NEW: Next = btn-warning when enabled, btn-secondary when disabled -->
			<td align="right" class="py-2"><input type="submit" name="operation"
				class="btn <%=nextList.size() == 0 ? "btn-secondary" : "btn-warning"%>"
				<%=nextList.size() == 0 ? "disabled" : ""%>
				value="<%=BaseCtl.OP_NEXT%>"></td>
		</tr>
	</table>

</body>
</html>