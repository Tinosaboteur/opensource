package demospringmvc.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import demospringmvc.Entity.Mapperthietbi;
import demospringmvc.Entity.thietbi;

@Repository
public class thietbiDao {
	@Autowired
	public JdbcTemplate jdbcTemplate;
	
	public List<thietbi> GetDatathietbi(){
		List<thietbi> list = new ArrayList<thietbi>();
		String sql = "SELECT * FROM thietbi";
		list = jdbcTemplate.query(sql, new Mapperthietbi());
		return list;
	}
	public thietbi addThietbi(thietbi tb) {
        String sql = "INSERT INTO thietbi (Name, Description, Quantity, Status, Img) VALUES (?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, tb.getName(), tb.getDescription(), tb.getQuantity(), tb.getStatus(), tb.getImg());
        return tb;
    }

    public thietbi updateThietbi(thietbi tb) {
        String sql = "UPDATE thietbi SET Name = ?, Description = ?, Quantity = ?, Status = ?, Img = ? WHERE EquipmentID = ?";
        jdbcTemplate.update(sql, tb.getName(), tb.getDescription(), tb.getQuantity(), tb.getStatus(), tb.getImg(), tb.getEquipmentID());
        return tb;
    }

    public void deleteThietbi(int id) {
        String sql = "DELETE FROM thietbi WHERE EquipmentID = ?";
        jdbcTemplate.update(sql, id);
    }

    public thietbi findThietbi(String name) {
        String sql = "SELECT * FROM thietbi WHERE Name = ?";
        List<thietbi> tbs = jdbcTemplate.query(sql, new Mapperthietbi(), name);
        return tbs.isEmpty() ? null : tbs.get(0);
    }
}
