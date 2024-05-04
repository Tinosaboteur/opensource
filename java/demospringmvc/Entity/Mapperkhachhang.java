package demospringmvc.Entity;

import java.sql.ResultSet;

import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class Mapperkhachhang implements RowMapper<khachhang>{
	public khachhang mapRow(ResultSet rs, int rowNum) throws SQLException{
		khachhang khachhang = new khachhang();
		khachhang.setCustomerID(rs.getInt("CustomerID"));
		khachhang.setName(rs.getString("Name"));
		khachhang.setAddress(rs.getString("Address"));
		khachhang.setPhoneNumber(rs.getInt("PhoneNumber"));
		khachhang.setEmail(rs.getString("Email"));
		khachhang.setDateOfBirth(rs.getDate("DateOfBirth"));
		khachhang.setGender(rs.getString("Gender"));
		khachhang.setJoinDate(rs.getDate("JoinDate"));

		return khachhang;
	}
}
