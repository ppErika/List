package todo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DbTest {

	public static void main(String[] args) {
		Statement stmt = null;
		ResultSet rs = null;
		Connection conn = null;
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc://localhost:3306/todos", "root",  "cs1234");
		}
		catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
}
