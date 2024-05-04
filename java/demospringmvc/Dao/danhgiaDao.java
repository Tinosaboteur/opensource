package demospringmvc.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import demospringmvc.Entity.Mapperdanhgia;
import demospringmvc.Entity.danhgia;

@Repository
public class danhgiaDao {

	@Autowired
	public JdbcTemplate jdbcTemplate;
	
	public List<danhgia> GetDatadanhgia(){
		List<danhgia> list = new ArrayList<danhgia>();
		String sql = "SELECT * FROM danhgia";
		list = jdbcTemplate.query(sql, new Mapperdanhgia());
		return list;
	}
	public danhgia adddanhgia(danhgia dg) {
        String sql = "INSERT INTO danhgia (Description, CustomerID) VALUES (?, ?)";
        jdbcTemplate.update(sql, dg.getDescription(), dg.getCustomerID());
        return dg;
    }

    public danhgia updatedanhgia(danhgia dg) {
        String sql = "UPDATE phukien SET Description = ?, CustomerID = ? WHERE danhgiaID = ?";
        jdbcTemplate.update(sql, dg.getDescription(), dg.getCustomerID());
        return dg;
    }


}
