package demospringmvc.Dao;

import java.util.ArrayList;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import demospringmvc.Entity.Mapperdangkiloptap;
import demospringmvc.Entity.dangkiloptap;

@Repository
public class dangkiloptapDao {
	@Autowired
	public JdbcTemplate jdbcTemplate;
	
	public List<dangkiloptap> GetDatadangkiloptap(){
		List<dangkiloptap> list = new ArrayList<dangkiloptap>();
		String sql = "SELECT * FROM dangkiloptap";
		list = jdbcTemplate.query(sql, new Mapperdangkiloptap());
		return list;
	}
	 public void deleteDangkiloptap(int id) {
	        String sql = "DELETE FROM dangkiloptap WHERE RegistrationID = ?";
	        jdbcTemplate.update(sql, id);
	    }
	public dangkiloptap addDangkiloptap(dangkiloptap dklt) {
        String sql = "INSERT INTO dangkiloptap (CustomerID, ScheduleID) VALUES (?, ?)";
        jdbcTemplate.update(sql, dklt.getCustomerID(), dklt.getScheduleID());
        return dklt;
    }
    public dangkiloptap updateDangkiloptap(dangkiloptap dklt) {
        String sql = "UPDATE dangkiloptap SET CustomerID = ?, ScheduleID = ? WHERE RegistrationID = ?";
        jdbcTemplate.update(sql, dklt.getCustomerID(), dklt.getScheduleID(), dklt.getRegistrationID());
        return dklt;
    }

    public dangkiloptap findDangkiloptap(int id) {
        String sql = "SELECT * FROM dangkiloptap WHERE RegistrationID = ?";
        List<dangkiloptap> tbs = jdbcTemplate.query(sql, new Mapperdangkiloptap(), id);
        return tbs.isEmpty() ? null : tbs.get(0);
    }
}
