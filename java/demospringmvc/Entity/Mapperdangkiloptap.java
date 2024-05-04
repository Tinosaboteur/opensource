package demospringmvc.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class Mapperdangkiloptap implements RowMapper<dangkiloptap>{
	public dangkiloptap mapRow(ResultSet rs, int rowNum) throws SQLException{
		dangkiloptap dangkiloptap = new dangkiloptap();
		dangkiloptap.setRegistrationID(rs.getInt("RegistrationID"));
		dangkiloptap.setCustomerID(rs.getInt("CustomerID"));
		dangkiloptap.setScheduleID(rs.getInt("ScheduleID"));

		return dangkiloptap;
	}
}
