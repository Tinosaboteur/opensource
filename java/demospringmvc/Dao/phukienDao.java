package demospringmvc.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import demospringmvc.Entity.Mapperphukien;
import demospringmvc.Entity.phukien;

@Repository
public class phukienDao {

	@Autowired
	public JdbcTemplate jdbcTemplate;
	
	public List<phukien> GetDataphukien(){
		List<phukien> list = new ArrayList<phukien>();
		String sql = "SELECT * FROM phukien";
		list = jdbcTemplate.query(sql, new Mapperphukien());
		return list;
	}
	public phukien addphukien(phukien pk) {
        String sql = "INSERT INTO phukien (Name, Description, Quantity, Status, Img, Price) VALUES (?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, pk.getName(), pk.getDescription(), pk.getQuantity(), pk.getStatus(), pk.getImg(), pk.getPrice());
        return pk;
    }

    public phukien updatePhukien(phukien pk) {
        String sql = "UPDATE phukien SET Name = ?, Description = ?, Quantity = ?, Status = ?, Img = ?, Price = ? WHERE EquipmentID = ?";
        jdbcTemplate.update(sql, pk.getName(), pk.getDescription(), pk.getQuantity(), pk.getStatus(), pk.getImg(), pk.getPhukienID(), pk.getPrice());
        return pk;
    }

    public void deletePhukien(int id) {
        String sql = "DELETE FROM phukien WHERE EquipmentID = ?";
        jdbcTemplate.update(sql, id);
    }

    public phukien findPhukien(String name) {
        String sql = "SELECT * FROM phukien WHERE Name = ?";
        List<phukien> tbs = jdbcTemplate.query(sql, new Mapperphukien(), name);
        return tbs.isEmpty() ? null : tbs.get(0);
    }
}
