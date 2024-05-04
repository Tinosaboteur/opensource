package demospringmvc.Dao;

import java.util.ArrayList;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import demospringmvc.Entity.Mapperchitietgoitap;
import demospringmvc.Entity.chitietgoitap;

@Repository
public class chitietgoitapDao {
	@Autowired
	public JdbcTemplate jdbcTemplate;
	
	public List<chitietgoitap> GetDatachitietgoitap(){
		List<chitietgoitap> list = new ArrayList<chitietgoitap>();
		String sql = "SELECT * FROM chitietgoitap";
		list = jdbcTemplate.query(sql, new Mapperchitietgoitap());
		return list;
	}

	public chitietgoitap addChitietgoitap(chitietgoitap ctgt) {
        String sql = "INSERT INTO chitietgoitap (CustomerID, PackageID, StartDate, EndDate) VALUES (?, ?, ?, ?)";
        jdbcTemplate.update(sql, ctgt.getCustomerID(), ctgt.getPackageID(), ctgt.getStartDate(), ctgt.getEndDate());
        return ctgt;
    }
    public chitietgoitap updateChitietgoitap(chitietgoitap ctgt) {
        String sql = "UPDATE chitietgoitap SET CustomerID = ?, PackageID = ?, StartDate = ?, EndDate = ? WHERE SubscriptionID = ?";
        jdbcTemplate.update(sql, ctgt.getCustomerID(), ctgt.getPackageID(), ctgt.getStartDate(), ctgt.getEndDate(), ctgt.getSubscriptionID());
        return ctgt;
    }

    public chitietgoitap findChitietgoitap(int id) {
        String sql = "SELECT * FROM chitietgoitap WHERE SubscriptionID = ?";
        List<chitietgoitap> ctgts = jdbcTemplate.query(sql, new Mapperchitietgoitap(), id);
        return ctgts.isEmpty() ? null : ctgts.get(0);
    }
    
    public List<chitietgoitap> findChitietgoitapByMonth(int month) {
        String sql = "SELECT * FROM chitietgoitap WHERE MONTH(StartDate) = ?";
        List<chitietgoitap> ctgts = jdbcTemplate.query(sql, new Mapperchitietgoitap(), month);
        return ctgts;
    }

}
