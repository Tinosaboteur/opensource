package demospringmvc.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import demospringmvc.Entity.Mapperuser;
import demospringmvc.Entity.user;

@Repository
public class userDao {
	@Autowired
	public JdbcTemplate jdbcTemplate;
	
	public List<user> GetDatauser(){
		List<user> list = new ArrayList<user>();
		String sql = "SELECT * FROM user";
		list = jdbcTemplate.query(sql, new Mapperuser());
		return list;
	}
	public user signIn(String username, String password) {
        String sql = "SELECT * FROM user WHERE Username = ? AND Password = ?";
        List<user> users = jdbcTemplate.query(sql, new Mapperuser(), username, password);
        return users.isEmpty() ? null : users.get(0);
    }

	public user signUp(String username, String password, String role) {
	    String checkSql = "SELECT * FROM user WHERE Username = ?";
	    List<user> users = jdbcTemplate.query(checkSql, new Mapperuser(), username);

	    if (!users.isEmpty()) {
	        return null;
	    }
	    String sql = "INSERT INTO user (Username, Password, Role) VALUES (?, ?, ?)";
	    jdbcTemplate.update(sql, username, password, role);
	    return signIn(username, password);
	}

}
