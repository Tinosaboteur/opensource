package demospringmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import demospringmvc.Dao.goitapDao;
import demospringmvc.Dao.nhanvienDao;
import demospringmvc.Dao.thietbiDao;
import demospringmvc.Dao.lichtapDao;
import demospringmvc.Dao.chitietgoitapDao;
import demospringmvc.Dao.dangkiloptapDao;
import demospringmvc.Dao.khachhangDao;
import demospringmvc.Dao.userDao;
import demospringmvc.Dao.phukienDao;
import demospringmvc.Dao.danhgiaDao;

import demospringmvc.Entity.thietbi;
import demospringmvc.Entity.goitap;
import demospringmvc.Entity.lichtap;
import demospringmvc.Entity.nhanvien;
import demospringmvc.Entity.phukien;
import demospringmvc.Entity.chitietgoitap;
import demospringmvc.Entity.dangkiloptap;
import demospringmvc.Entity.khachhang;
import demospringmvc.Entity.user;
import demospringmvc.Entity.phukien;
import demospringmvc.Entity.danhgia;

@Service
public class HomeService  implements IHomeService{
	@Autowired
	 private danhgiaDao danhgiaDao;
	@Autowired
	private phukienDao phukienDao; 
	@Autowired
	 private goitapDao goitapDao;
	@Autowired
	private thietbiDao thietbiDao; 
	@Autowired
	private lichtapDao lichtapDao;
	@Autowired
	private nhanvienDao nhanvienDao;
	@Autowired
	private chitietgoitapDao chitietgoitapDao;
	@Autowired
	private dangkiloptapDao dangkiloptapDao;
	@Autowired
	private khachhangDao khachhangDao;
	@Autowired
	private userDao userDao;
	
	//danhgia
	public List<danhgia> GetDatadanhgia() {
		return danhgiaDao.GetDatadanhgia();
	}
	public danhgia adddanhgia(danhgia dg) {
        return danhgiaDao.adddanhgia(dg);
    }

    public danhgia updatedanhgia(danhgia dg) {
        return danhgiaDao.updatedanhgia(dg);
    }
	//phukien
	public List<phukien> GetDataphukien() {
		return phukienDao.GetDataphukien();
	}
	public phukien addphukien(phukien pk) {
        return phukienDao.addphukien(pk);
    }

    public phukien updatephukien(phukien pk) {
        return phukienDao.updatePhukien(pk);
    }

    public void deletephukien(int id) {
        phukienDao.deletePhukien(id);
    }

    public phukien findphukien(String name) {
        return phukienDao.findPhukien(name);
    }
	//goitap
	public List<goitap> GetDatagoitap() {
		return goitapDao.GetDatagoitap();
	}
	//user
		public List<user> GetDatauser() {
			return userDao.GetDatauser();
		}
		public user signIn(String username, String password) {
	        return userDao.signIn(username, password);
	    }

	    public user signUp(String username, String password, String role) {
	        return userDao.signUp(username, password, role);
	    }		
	//thietbi
	public List<thietbi> GetDatathietbi() {
		return thietbiDao.GetDatathietbi();
	}
	public thietbi addThietbi(thietbi tb) {
        return thietbiDao.addThietbi(tb);
    }

    public thietbi updateThietbi(thietbi tb) {
        return thietbiDao.updateThietbi(tb);
    }

    public void deleteThietbi(int id) {
        thietbiDao.deleteThietbi(id);
    }

    public thietbi findThietbi(String name) {
        return thietbiDao.findThietbi(name);
    }
	//lichtap
	public List<lichtap> GetDatalichtap() {
		return lichtapDao.GetDatalichtap();
	}
	//nhanvien
	public List<nhanvien> GetDatanhanvien() {
		return nhanvienDao.GetDatanhanvien();
	}
	public nhanvien addNhanvien(nhanvien nv) {
        return nhanvienDao.addNhanvien(nv);
    }

    public nhanvien updateNhanvien(nhanvien nv) {
        return nhanvienDao.updateNhanvien(nv);
    }

    public void deleteNhanvien(int id) {
        nhanvienDao.deleteNhanvien(id);
    }

    public List<nhanvien> findNhanvien(String name) {
        return nhanvienDao.findNhanvien(name);
    }
	//dangkiloptap
	public List<dangkiloptap> GetDatadangkiloptap() {
		return dangkiloptapDao.GetDatadangkiloptap();
	}
	public dangkiloptap addDangkiloptap(dangkiloptap dklt) {
        return dangkiloptapDao.addDangkiloptap(dklt);
    }

    public dangkiloptap updateDangkiloptap(dangkiloptap dklt) {
        return dangkiloptapDao.updateDangkiloptap(dklt);
    }

    public void deleteDangkiloptap(int id) {
    	dangkiloptapDao.deleteDangkiloptap(id);
    }

    public dangkiloptap findDangkiloptap(int id) {
        return dangkiloptapDao.findDangkiloptap(id);
    }

	//khachhang
	public List<khachhang> GetDatakhachhang() {
		return khachhangDao.GetDatakhachhang();
	}
	public khachhang addKhachhang(khachhang kh) {
        return khachhangDao.addKhachhang(kh);
    }

    public khachhang updateKhachhang(khachhang kh) {
        return khachhangDao.updateKhachhang(kh);
    }

    public khachhang findKhachhang(String name) {
        return khachhangDao.findKhachHangByName(name);
    }
	//chitietgoitap
	public List<chitietgoitap> GetDatachitietgoitap() {
		return chitietgoitapDao.GetDatachitietgoitap();
	}
	public chitietgoitap addChitietgoitap(chitietgoitap ctgt) {
        return chitietgoitapDao.addChitietgoitap(ctgt);
    }

    public chitietgoitap updateChitietgoitap(chitietgoitap ctgt) {
        return chitietgoitapDao.updateChitietgoitap(ctgt);
    }

    public chitietgoitap findChitietgoitap(int id) {
        return chitietgoitapDao.findChitietgoitap(id);
    }
    
    public List<chitietgoitap> findChitietgoitapByMonth(int month) {
    	return chitietgoitapDao.findChitietgoitapByMonth(month);
    }
}
