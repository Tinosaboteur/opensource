package demospringmvc.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import demospringmvc.Entity.Mappergoitap;
import demospringmvc.Entity.goitap;

@Repository
public class goitapDao {
	@Autowired
	public JdbcTemplate jdbcTemplate;
	
	public List<goitap> GetDatagoitap(){
		List<goitap> list = new ArrayList<goitap>();
		String sql = "SELECT * FROM goitap";
		list = jdbcTemplate.query(sql, new Mappergoitap());
		return list;
	}
}
