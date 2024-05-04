package demospringmvc.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

public class Mapperdanhgia implements RowMapper<danhgia>{
	public danhgia mapRow(ResultSet rs, int rowNum) throws SQLException{
		danhgia danhgia = new danhgia();
		danhgia.setDanhgiaID(rs.getInt("danhgiaID"));
		danhgia.setDescription(rs.getString("Description"));
		danhgia.setCustomerID(rs.getInt("CustomerID"));
		return danhgia;
	}
}
