package demospringmvc.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class Mappernhanvien implements RowMapper<nhanvien>{
	public nhanvien mapRow(ResultSet rs, int rowNum) throws SQLException{
		nhanvien nhanvien = new nhanvien();
		nhanvien.setEmployeeID(rs.getInt("EmployeeID"));
		nhanvien.setName(rs.getString("Name"));
		nhanvien.setPosition(rs.getString("Position"));
		nhanvien.setPhoneNumber(rs.getInt("PhoneNumber"));
		nhanvien.setEmail(rs.getString("Email"));
		nhanvien.setSalary(rs.getFloat("Salary"));
		nhanvien.setStartDate(rs.getDate("StartDate"));
		return nhanvien;
	}
}
