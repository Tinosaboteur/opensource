package demospringmvc.Entity;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

public class Mapperuser implements RowMapper<user>{
	public user mapRow(ResultSet rs, int rowNum) throws SQLException{
		user user = new user();
		user.setUsername(rs.getString("Username"));
		user.setPassword(rs.getString("Password"));
		user.setRole(rs.getString("Role"));
		return user;
	}
}
