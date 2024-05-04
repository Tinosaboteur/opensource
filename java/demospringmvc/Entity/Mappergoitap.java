package demospringmvc.Entity;

import java.sql.ResultSet;

import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.metadata.TableMetaDataProvider;


public class Mappergoitap implements RowMapper<goitap>{
	public goitap mapRow(ResultSet rs, int rowNum) throws SQLException{
		goitap goitap = new goitap();
		
		goitap.setName(rs.getString("Name"));
		goitap.setDescription(rs.getString("Description"));
		goitap.setPrice(rs.getFloat("Price"));
		goitap.setImg(rs.getString("Img"));
		return goitap;
	}
}
