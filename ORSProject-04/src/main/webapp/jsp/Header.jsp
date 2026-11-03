<%@page import="in.co.rays.proj4.util.MessageSource"%>

<%@page import="in.co.rays.proj4.bean.RoleBean"%>

<%@page import="in.co.rays.proj4.controller.ORSView"%>

<%@page import="in.co.rays.proj4.bean.UserBean"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
    crossorigin="anonymous">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
    crossorigin="anonymous"></script>

</head>

<body>

<!-- Duplicate Bootstrap JS (commented, not deleted)
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
-->


<%
    MessageSource ms = MessageSource.getInstance();

    UserBean user = (UserBean) session.getAttribute("user");

    String role = (String) session.getAttribute("role");

    boolean isLogin = user != null;

    String welcomeMsg = ms.get("header.hii");

    String locale = ms.getLanguage();
%>

<%-- OLD welcome heading block (moved inside the navbar below)
<%
if (isLogin) {
%>

<h2><%=welcomeMsg + user.getFirstName() + "(" + role + ")"%></h2>

<%
} else {
%>

<h2><%=welcomeMsg + ms.get("header.guest")%></h2>

<%
}
%>
--%>

<!-- ================= BOOTSTRAP 5 NAVBAR ================= -->
<!-- py-3 = more padding above and below (was py-2). Use py-4 for even more. -->
<nav class="navbar navbar-expand-lg navbar-light px-3 py-3" style="background-color: #e3f2fd;">
  <div class="container-fluid">

    <!-- Welcome heading (smaller now: fs-5 instead of h2 size) -->
<%
if (isLogin) {
%>

    <h2 class="navbar-brand mb-0 fs-5 me-3"><%=welcomeMsg + user.getFirstName() + "(" + role + ")"%></h2>

<%
} else {
%>

    <h2 class="navbar-brand mb-0 fs-5 me-3"><%=welcomeMsg + ms.get("header.guest")%></h2>

<%
}
%>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
        data-bs-target="#orsNavbar" aria-controls="orsNavbar"
        aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="orsNavbar">
      <ul class="navbar-nav flex-wrap me-auto align-items-lg-center">

<%
if (isLogin) {
%>

<%-- OLD flat links after login (kept, not deleted)

        <li class="nav-item d-flex align-items-center"><a class="nav-link" href="<%=ORSView.ROLE_CTL%>"><%=ms.get("header.addRole")%></a> |</li>

        <li class="nav-item d-flex align-items-center"><a class="nav-link" href="<%=ORSView.ROLE_LIST_CTL%>"><%=ms.get("header.roleList")%></a> |</li>

        <li class="nav-item d-flex align-items-center"><a class="nav-link" href="<%=ORSView.USER_CTL%>"><%=ms.get("header.addUser")%></a> |</li>

        <li class="nav-item d-flex align-items-center"><a class="nav-link" href="<%=ORSView.USER_LIST_CTL%>"><%=ms.get("header.userList")%></a> |</li>

        <li class="nav-item d-flex align-items-center"><a class="nav-link" href="<%=ORSView.COLLEGE_CTL%>"><%=ms.get("header.addCollege")%></a> |</li>

        <li class="nav-item d-flex align-items-center"><a class="nav-link" href="<%=ORSView.COLLEGE_LIST_CTL%>"><%=ms.get("header.collegeList")%></a> |</li>

        <li class="nav-item d-flex align-items-center"><a class="nav-link" href="<%=ORSView.COURSE_CTL%>"><%=ms.get("header.addCourse")%></a> |</li>

        <li class="nav-item d-flex align-items-center"><a class="nav-link" href="<%=ORSView.COURSE_LIST_CTL%>"><%=ms.get("header.courseList")%></a> |</li>

        <li class="nav-item d-flex align-items-center"><a class="nav-link" href="<%=ORSView.FACULTY_CTL%>"><%=ms.get("header.addFaculty")%></a> |</li>

        <li class="nav-item d-flex align-items-center"><a class="nav-link" href="<%=ORSView.FACULTY_LIST_CTL%>"><%=ms.get("header.facultyList")%></a> |</li>

        <li class="nav-item d-flex align-items-center"><a class="nav-link" href="<%=ORSView.MARKSHEET_CTL%>"><%=ms.get("header.addMarksheet")%></a> |</li>

        <li class="nav-item d-flex align-items-center"><a class="nav-link" href="<%=ORSView.MARKSHEET_LIST_CTL%>"><%=ms.get("header.marksheetList")%></a> |</li>

        <li class="nav-item d-flex align-items-center"><a class="nav-link" href="<%=ORSView.SUBJECT_CTL%>"><%=ms.get("header.addSubject")%></a> |</li>

        <li class="nav-item d-flex align-items-center"><a class="nav-link" href="<%=ORSView.SUBJECT_LIST_CTL%>"><%=ms.get("header.subjectList")%></a> |</li>

        <li class="nav-item d-flex align-items-center"><a class="nav-link" href="<%=ORSView.STUDENT_CTL%>"><%=ms.get("header.addStudent")%></a> |</li>

        <li class="nav-item d-flex align-items-center"><a class="nav-link" href="<%=ORSView.STUDENT_LIST_CTL%>"><%=ms.get("header.studentList")%></a> |</li>

        <li class="nav-item d-flex align-items-center"><a class="nav-link" href="<%=ORSView.CHANGE_PASSWORD_CTL%>"><%=ms.get("header.changePassword")%></a> |</li>

        <li class="nav-item d-flex align-items-center"><a class="nav-link" href="<%=ORSView.HOSPITAL_CTL %>"><%=ms.get("header.addHospital")%></a> |</li>

        <li class="nav-item d-flex align-items-center"><a class="nav-link" href="<%=ORSView.HOSPITAL_LIST_CTL %>"><%=ms.get("header.hospitalList")%></a> |</li>

        <li class="nav-item d-flex align-items-center"><a class="nav-link" href="<%=ORSView.ATM_CTL %>"><%=ms.get("header.addATM")%></a> |</li>

        <li class="nav-item d-flex align-items-center"><a class="nav-link" href="<%=ORSView.ATM_LIST_CTL %>"><%=ms.get("header.atmList")%></a> |</li>

        <li class="nav-item d-flex align-items-center"><a class="nav-link" href="<%=ORSView.RAILWAY_CTL %>"><%=ms.get("header.addRailway")%></a> |</li>

        <li class="nav-item d-flex align-items-center"><a class="nav-link" href="<%=ORSView.RAILWAY_LIST_CTL %>"><%=ms.get("header.railwayList")%></a> |</li>

        <li class="nav-item d-flex align-items-center"><a class="nav-link" href="<%=ORSView.LOGIN_CTL + "?operation=logout"%>"><%=ms.get("header.logout")%></a> |</li>

--%>

<%-- OLD nav-link style dropdowns (kept, not deleted; replaced by the button-style dropdowns below)

        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Role</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="<%=ORSView.ROLE_CTL%>"><%=ms.get("header.addRole")%></a></li>
            <li><a class="dropdown-item" href="<%=ORSView.ROLE_LIST_CTL%>"><%=ms.get("header.roleList")%></a></li>
          </ul>
        </li>

        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">User</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="<%=ORSView.USER_CTL%>"><%=ms.get("header.addUser")%></a></li>
            <li><a class="dropdown-item" href="<%=ORSView.USER_LIST_CTL%>"><%=ms.get("header.userList")%></a></li>
          </ul>
        </li>

        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">College</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="<%=ORSView.COLLEGE_CTL%>"><%=ms.get("header.addCollege")%></a></li>
            <li><a class="dropdown-item" href="<%=ORSView.COLLEGE_LIST_CTL%>"><%=ms.get("header.collegeList")%></a></li>
          </ul>
        </li>

        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Course</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="<%=ORSView.COURSE_CTL%>"><%=ms.get("header.addCourse")%></a></li>
            <li><a class="dropdown-item" href="<%=ORSView.COURSE_LIST_CTL%>"><%=ms.get("header.courseList")%></a></li>
          </ul>
        </li>

        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Faculty</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="<%=ORSView.FACULTY_CTL%>"><%=ms.get("header.addFaculty")%></a></li>
            <li><a class="dropdown-item" href="<%=ORSView.FACULTY_LIST_CTL%>"><%=ms.get("header.facultyList")%></a></li>
          </ul>
        </li>

        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Marksheet</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="<%=ORSView.MARKSHEET_CTL%>"><%=ms.get("header.addMarksheet")%></a></li>
            <li><a class="dropdown-item" href="<%=ORSView.MARKSHEET_LIST_CTL%>"><%=ms.get("header.marksheetList")%></a></li>
          </ul>
        </li>

        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Subject</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="<%=ORSView.SUBJECT_CTL%>"><%=ms.get("header.addSubject")%></a></li>
            <li><a class="dropdown-item" href="<%=ORSView.SUBJECT_LIST_CTL%>"><%=ms.get("header.subjectList")%></a></li>
          </ul>
        </li>

        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Student</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="<%=ORSView.STUDENT_CTL%>"><%=ms.get("header.addStudent")%></a></li>
            <li><a class="dropdown-item" href="<%=ORSView.STUDENT_LIST_CTL%>"><%=ms.get("header.studentList")%></a></li>
          </ul>
        </li>

        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Hospital</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="<%=ORSView.HOSPITAL_CTL %>"><%=ms.get("header.addHospital")%></a></li>
            <li><a class="dropdown-item" href="<%=ORSView.HOSPITAL_LIST_CTL %>"><%=ms.get("header.hospitalList")%></a></li>
          </ul>
        </li>

        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">ATM</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="<%=ORSView.ATM_CTL %>"><%=ms.get("header.addATM")%></a></li>
            <li><a class="dropdown-item" href="<%=ORSView.ATM_LIST_CTL %>"><%=ms.get("header.atmList")%></a></li>
          </ul>
        </li>

        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Railway</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="<%=ORSView.RAILWAY_CTL %>"><%=ms.get("header.addRailway")%></a></li>
            <li><a class="dropdown-item" href="<%=ORSView.RAILWAY_LIST_CTL %>"><%=ms.get("header.railwayList")%></a></li>
          </ul>
        </li>

        <li class="nav-item"><a class="nav-link" href="<%=ORSView.CHANGE_PASSWORD_CTL%>"><%=ms.get("header.changePassword")%></a></li>

        <li class="nav-item"><a class="nav-link" href="<%=ORSView.LOGIN_CTL + "?operation=logout"%>"><%=ms.get("header.logout")%></a></li>

--%>

        <!-- ===== NEW: Compact button-style dropdowns (after login), all btn-info btn-sm ===== -->

        <!-- Role -->
        <li class="nav-item me-1 my-1">
          <div class="btn-group">
            <button type="button" class="btn btn-info btn-sm dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
              Role
            </button>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="<%=ORSView.ROLE_CTL%>"><%=ms.get("header.addRole")%></a></li>
              <li><a class="dropdown-item" href="<%=ORSView.ROLE_LIST_CTL%>"><%=ms.get("header.roleList")%></a></li>
            </ul>
          </div>
        </li>

        <!-- User -->
        <li class="nav-item me-1 my-1">
          <div class="btn-group">
            <button type="button" class="btn btn-info btn-sm dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
              User
            </button>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="<%=ORSView.USER_CTL%>"><%=ms.get("header.addUser")%></a></li>
              <li><a class="dropdown-item" href="<%=ORSView.USER_LIST_CTL%>"><%=ms.get("header.userList")%></a></li>
            </ul>
          </div>
        </li>

        <!-- College -->
        <li class="nav-item me-1 my-1">
          <div class="btn-group">
            <button type="button" class="btn btn-info btn-sm dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
              College
            </button>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="<%=ORSView.COLLEGE_CTL%>"><%=ms.get("header.addCollege")%></a></li>
              <li><a class="dropdown-item" href="<%=ORSView.COLLEGE_LIST_CTL%>"><%=ms.get("header.collegeList")%></a></li>
            </ul>
          </div>
        </li>

        <!-- Course -->
        <li class="nav-item me-1 my-1">
          <div class="btn-group">
            <button type="button" class="btn btn-info btn-sm dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
              Course
            </button>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="<%=ORSView.COURSE_CTL%>"><%=ms.get("header.addCourse")%></a></li>
              <li><a class="dropdown-item" href="<%=ORSView.COURSE_LIST_CTL%>"><%=ms.get("header.courseList")%></a></li>
            </ul>
          </div>
        </li>

        <!-- Faculty -->
        <li class="nav-item me-1 my-1">
          <div class="btn-group">
            <button type="button" class="btn btn-info btn-sm dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
              Faculty
            </button>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="<%=ORSView.FACULTY_CTL%>"><%=ms.get("header.addFaculty")%></a></li>
              <li><a class="dropdown-item" href="<%=ORSView.FACULTY_LIST_CTL%>"><%=ms.get("header.facultyList")%></a></li>
            </ul>
          </div>
        </li>

        <!-- Marksheet -->
        <li class="nav-item me-1 my-1">
          <div class="btn-group">
            <button type="button" class="btn btn-info btn-sm dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
              Marksheet
            </button>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="<%=ORSView.MARKSHEET_CTL%>"><%=ms.get("header.addMarksheet")%></a></li>
              <li><a class="dropdown-item" href="<%=ORSView.MARKSHEET_LIST_CTL%>"><%=ms.get("header.marksheetList")%></a></li>
            </ul>
          </div>
        </li>

        <!-- Subject -->
        <li class="nav-item me-1 my-1">
          <div class="btn-group">
            <button type="button" class="btn btn-info btn-sm dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
              Subject
            </button>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="<%=ORSView.SUBJECT_CTL%>"><%=ms.get("header.addSubject")%></a></li>
              <li><a class="dropdown-item" href="<%=ORSView.SUBJECT_LIST_CTL%>"><%=ms.get("header.subjectList")%></a></li>
            </ul>
          </div>
        </li>

        <!-- Student -->
        <li class="nav-item me-1 my-1">
          <div class="btn-group">
            <button type="button" class="btn btn-info btn-sm dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
              Student
            </button>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="<%=ORSView.STUDENT_CTL%>"><%=ms.get("header.addStudent")%></a></li>
              <li><a class="dropdown-item" href="<%=ORSView.STUDENT_LIST_CTL%>"><%=ms.get("header.studentList")%></a></li>
            </ul>
          </div>
        </li>

        <!-- Hospital -->
        <li class="nav-item me-1 my-1">
          <div class="btn-group">
            <button type="button" class="btn btn-info btn-sm dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
              Hospital
            </button>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="<%=ORSView.HOSPITAL_CTL %>"><%=ms.get("header.addHospital")%></a></li>
              <li><a class="dropdown-item" href="<%=ORSView.HOSPITAL_LIST_CTL %>"><%=ms.get("header.hospitalList")%></a></li>
            </ul>
          </div>
        </li>

        <!-- ATM -->
        <li class="nav-item me-1 my-1">
          <div class="btn-group">
            <button type="button" class="btn btn-info btn-sm dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
              ATM
            </button>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="<%=ORSView.ATM_CTL %>"><%=ms.get("header.addATM")%></a></li>
              <li><a class="dropdown-item" href="<%=ORSView.ATM_LIST_CTL %>"><%=ms.get("header.atmList")%></a></li>
            </ul>
          </div>
        </li>

        <!-- Railway -->
        <li class="nav-item me-1 my-1">
          <div class="btn-group">
            <button type="button" class="btn btn-info btn-sm dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
              Railway
            </button>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="<%=ORSView.RAILWAY_CTL %>"><%=ms.get("header.addRailway")%></a></li>
              <li><a class="dropdown-item" href="<%=ORSView.RAILWAY_LIST_CTL %>"><%=ms.get("header.railwayList")%></a></li>
            </ul>
          </div>
        </li>

        <!-- Single buttons -->
        <li class="nav-item me-1 my-1"><a class="btn btn-outline-dark btn-sm" href="<%=ORSView.CHANGE_PASSWORD_CTL%>"><%=ms.get("header.changePassword")%></a></li>

        <li class="nav-item me-1 my-1"><a class="btn btn-dark btn-sm" href="<%=ORSView.LOGIN_CTL + "?operation=logout"%>"><%=ms.get("header.logout")%></a></li>

<%
} else {
%>

        <li class="nav-item d-flex align-items-center"><a class="nav-link" href="<%=ORSView.LOGIN_CTL%>"><%=ms.get("login.title")%></a> |</li>

        <li class="nav-item d-flex align-items-center"><a class="nav-link" href="<%=ORSView.USER_REGISTRATION_CTL%>"><%=ms.get("header.signUp")%></a> |</li>

<%
}
%>

        <li class="nav-item d-flex align-items-center"><a class="nav-link px-2" href="<%=ORSView.WELCOME_CTL%>"><%=ms.get("header.welcome")%></a></li>

      </ul>

<%-- OLD Language Dropdown inside navbar (kept, not deleted; replaced by the btn-primary dropdown below)

      <form class="d-flex ms-lg-auto mb-0">
        <select name="lang" class="form-select form-select-sm" style="width:auto;" onchange="this.form.submit()">

            <option value="en" <%=("en".equals(locale)) ? "selected" : ""%>>
                English
            </option>

            <option value="hi" <%=("hi".equals(locale)) ? "selected" : ""%>>
                Hindi
            </option>

        </select>
      </form>

--%>

      <!-- NEW: Language Dropdown styled as btn-primary (right side of the navbar).
           Each item links to ?lang=xx, which sends the same "lang" parameter the old select form sent. -->
      <div class="btn-group ms-lg-auto">
        <button type="button" class="btn btn-primary btn-sm dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
          <%=("hi".equals(locale)) ? "Hindi" : "English"%>
        </button>
        <ul class="dropdown-menu dropdown-menu-end">
          <li><a class="dropdown-item <%=("en".equals(locale)) ? "active" : ""%>" href="?lang=en">English</a></li>
          <li><a class="dropdown-item <%=("hi".equals(locale)) ? "active" : ""%>" href="?lang=hi">Hindi</a></li>
        </ul>
      </div>

    </div>

  </div>
</nav>
<!-- ================= END NAVBAR ================= -->

<%-- OLD Language Dropdown (kept, not deleted; now lives inside the navbar above)

<!-- Language Dropdown -->

<div align="right">

    <table>

        <tr>

            <td style="width:120px; text-align:center;">

                <form style="margin:0;">

                    <select name="lang" onchange="this.form.submit()">

                        <option value="en" <%=("en".equals(locale)) ? "selected" : ""%>>
                            English
                        </option>

                        <option value="hi" <%=("hi".equals(locale)) ? "selected" : ""%>>
                            Hindi
                        </option>

                    </select>

                </form>

            </td>

        </tr>

    </table>

</div>
--%>

<hr class="mt-0">

    <!-- Duplicate Bootstrap JS (commented, not deleted)
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
    -->

</body>

</html>