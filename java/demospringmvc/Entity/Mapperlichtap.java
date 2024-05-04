package demospringmvc.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.metadata.TableMetaDataProvider;
public class Mapperlichtap implements RowMapper<lichtap>{
	public lichtap mapRow(ResultSet rs, int rowNum) throws SQLException{
		lichtap lichtap = new lichtap();
		lichtap.setScheduleID(rs.getInt("ScheduleID"));
		lichtap.setClassName(rs.getString("ClassName"));
		lichtap.setDescription(rs.getString("Description"));
		lichtap.setDate(rs.getDate("Date"));
		lichtap.setStartTime(rs.getTime("StartTime"));
		lichtap.setEndTime(rs.getTime("EndTime"));
		lichtap.setEmployeeID(rs.getString("EmployeeID"));
		lichtap.setImg(rs.getString("Img"));
		return lichtap;
	}
}

