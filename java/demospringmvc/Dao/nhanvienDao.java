package demospringmvc.Dao;

import java.util.ArrayList;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import demospringmvc.Entity.Mappernhanvien;
import demospringmvc.Entity.nhanvien;

@Repository
public class nhanvienDao {
	@Autowired
	public JdbcTemplate jdbcTemplate;
	
	public List<nhanvien> GetDatanhanvien(){
		List<nhanvien> list = new ArrayList<nhanvien>();
		String sql = "SELECT * FROM nhanvien";
		list = jdbcTemplate.query(sql, new Mappernhanvien());
		return list;
	}

	public nhanvien addNhanvien(nhanvien nv) {
        String sql = "INSERT INTO nhanvien (Name, Position, PhoneNumber, Email, Salary, StartDate) VALUES (?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, nv.getName(), nv.getPosition(), nv.getPhoneNumber(), nv.getEmail(), nv.getSalary(), nv.getStartDate());
        return nv;
    }
    public nhanvien updateNhanvien(nhanvien nv) {
        String sql = "UPDATE nhanvien SET Name = ?, Position = ?, PhoneNumber = ?, Email = ?, Salary = ?,StartDate = ?  WHERE EmployeeID = ?";
        jdbcTemplate.update(sql, nv.getName(), nv.getPosition(), nv.getPhoneNumber(), nv.getEmail(), nv.getSalary(), nv.getStartDate(), nv.getEmployeeID());
        return nv;
    }

    public void deleteNhanvien(int id) {
        String sql = "DELETE FROM nhanvien WHERE EmployeeID = ?";
        jdbcTemplate.update(sql, id);
    }

    public List<nhanvien> findNhanvien(String name) {
        String sql = "SELECT * FROM nhanvien WHERE name = ?";
        List<nhanvien> tbs = jdbcTemplate.query(sql, new Mappernhanvien(), name);
        return tbs;
    }
}

