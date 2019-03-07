<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%
	Statement stmt = null;
	ResultSet rs = null;
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/todos?serverTimezone=UTC", "root", "cs1234");
	
	stmt = conn.createStatement();
	if(stmt.execute("select * from todo")) {
		rs = stmt.getResultSet();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>wjlee's todos!!</title>
</head>
<body>
<div>
	<h1>wjlee's todos</h1>
	<hr>
<%
	while(rs.next()) {
		out.println(rs.getInt("id") + " : " + rs.getString("item") + "<br>");
	}
	rs.close();
	stmt.close();
	conn.close();

%>
	<hr>
	<form method="post" action="write.jsp">
		<input type="text" name="todo-item" />
		<input type="submit" value="�ۼ�" />
	</form>
	<form method="post" action="delete.jsp">
		<input type="submit" value="��λ���" />
	</form>
</div>
</body>
</html>