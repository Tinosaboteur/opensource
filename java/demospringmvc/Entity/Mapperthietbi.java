package demospringmvc.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

public class Mapperthietbi implements RowMapper<thietbi>{
	public thietbi mapRow(ResultSet rs, int rowNum) throws SQLException{
		thietbi thietbi = new thietbi();
		thietbi.setEquipmentID(rs.getInt("EquipmentID"));
		thietbi.setName(rs.getString("Name"));
		thietbi.setDescription(rs.getString("Description"));
		thietbi.setQuantity(rs.getString("Quantity"));
		thietbi.setStatus(rs.getString("Status"));
		thietbi.setImg(rs.getString("Img"));
		return thietbi;
	}
}
