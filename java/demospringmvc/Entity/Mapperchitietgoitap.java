package demospringmvc.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class Mapperchitietgoitap implements RowMapper<chitietgoitap>{
	public chitietgoitap mapRow(ResultSet rs, int rowNum) throws SQLException{
		chitietgoitap chitietgoitap = new chitietgoitap();
		chitietgoitap.setSubscriptionID(rs.getInt("SubscriptionID"));
		chitietgoitap.setCustomerID(rs.getString("CustomerID"));
		chitietgoitap.setPackageID(rs.getString("PackageID"));
		chitietgoitap.setStartDate(rs.getDate("StartDate"));
		chitietgoitap.setEndDate(rs.getDate("EndDate"));
		return chitietgoitap;
	}
}
