package demospringmvc.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

public class Mapperphukien implements RowMapper<phukien>{
	public phukien mapRow(ResultSet rs, int rowNum) throws SQLException{
		phukien phukien = new phukien();
		phukien.setPhukienID(rs.getInt("PhukienID"));
		phukien.setName(rs.getString("Name"));
		phukien.setDescription(rs.getString("Description"));
		phukien.setQuantity(rs.getString("Quantity"));
		phukien.setStatus(rs.getString("Status"));
		phukien.setImg(rs.getString("Img"));
		phukien.setPrice(rs.getInt("Price"));
		return phukien;
	}
}

