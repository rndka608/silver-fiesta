package kr.or.ddit.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ResourceBundle;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;

import oracle.jdbc.pool.OracleDataSource;

public class ConnectionFactory {
	private static String url;
	private static String user;
	private static String password;
	private static String driverClassName;
	private static DataSource dataSource;
	static {
		try {
//			Class.forName("oracle.jdbc.driver.OracleDriver");//드라이버 클래스 로딩하는 단계
			ResourceBundle bundle = ResourceBundle.getBundle("kr.or.ddit.db.dbInfo");
			driverClassName = bundle.getString("driverClassName");
			url = bundle.getString("url");
			user = bundle.getString("user");
			password = bundle.getString("password");
//			DriverManagger(Simpe JDBC) 와 DataSource(Pooling) 의 차이
//			Simple JDBC 방식 : Connection 이 필요할때 그 즉시 생성.
//			Pooling 방식 : 미리 일정갯수의 Connection을 생성하고,
//						 Pool 을 통해 관리하다, 필요할때 배분해서 사용.
//			OracleDataSource oracleDS = new OracleDataSource();
//			oracleDS.setURL(url);
//			oracleDS.setUser(user);
//			oracleDS.setPassword(password);
//			dataSource = oracleDS;
			
//			// DBMS 에 종속되지 않는 폴링 시스템
			BasicDataSource basicDS = new BasicDataSource();
			basicDS.setDriverClassName(driverClassName);
			basicDS.setUrl(url);
			basicDS.setUsername(user);
			basicDS.setPassword(password);
			int initialSize = Integer.parseInt(bundle.getString("initialSize")); 
			int maxActive = Integer.parseInt(bundle.getString("maxActive"));
			long maxWait = Integer.parseInt(bundle.getString("maxWait"));
			basicDS.setInitialSize(initialSize);
			basicDS.setMaxActive(maxActive);
			basicDS.setMaxWait(maxWait);
			dataSource = basicDS;
		} catch (Exception e) {
			throw new RuntimeException(e);
		} 
	}
	
	public static Connection getConnection() throws SQLException {
//		Connection conn = DriverManager.getConnection(url, user, password);
		Connection conn = dataSource.getConnection(); 
		return conn;
	}
}
