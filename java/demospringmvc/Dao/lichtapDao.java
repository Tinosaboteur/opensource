package demospringmvc.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import demospringmvc.Entity.Mapperlichtap;
import demospringmvc.Entity.lichtap;

@Repository
public class lichtapDao {
	@Autowired
	public JdbcTemplate jdbcTemplate;
	
	public List<lichtap> GetDatalichtap(){
		List<lichtap> list = new ArrayList<lichtap>();
		String sql = "SELECT * FROM lichtap";
		list = jdbcTemplate.query(sql, new Mapperlichtap());
		return list;
	}
}
