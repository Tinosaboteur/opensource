package demospringmvc.service;

import java.util.List;

import demospringmvc.Entity.goitap;
import demospringmvc.Entity.thietbi;
import demospringmvc.Entity.user;
import demospringmvc.Entity.lichtap;
import demospringmvc.Entity.nhanvien;
import demospringmvc.Entity.chitietgoitap;
import demospringmvc.Entity.dangkiloptap;
import demospringmvc.Entity.khachhang;
import demospringmvc.Entity.danhgia;
import demospringmvc.Entity.phukien;

public interface IHomeService {
	
	//danhgia
	public List<danhgia> GetDatadanhgia();
    public danhgia adddanhgia(danhgia dg);
    public danhgia updatedanhgia(danhgia dg);
	//phukien
	public List<phukien> GetDataphukien();
    public phukien addphukien(phukien pk);
    public phukien updatephukien(phukien pk);
    public void deletephukien(int id);
    public phukien findphukien(String name);
	//goitap
	public List<goitap> GetDatagoitap();
	//thietbi
	public List<thietbi> GetDatathietbi();
    public thietbi addThietbi(thietbi tb);
    public thietbi updateThietbi(thietbi tb);
    public void deleteThietbi(int id);
    public thietbi findThietbi(String name);
    //lichtap
	public List<lichtap> GetDatalichtap();
	//nhanvien
	public List<nhanvien> GetDatanhanvien();
    public nhanvien addNhanvien(nhanvien nv);
    public nhanvien updateNhanvien(nhanvien nv);
    public void deleteNhanvien(int id);
    public List<nhanvien> findNhanvien(String name);
	//chitietgoitap
	public List<chitietgoitap> GetDatachitietgoitap();
    public chitietgoitap addChitietgoitap(chitietgoitap ctgt);
    public chitietgoitap updateChitietgoitap(chitietgoitap ctgt);
    public chitietgoitap findChitietgoitap(int id);
    public List<chitietgoitap> findChitietgoitapByMonth(int month);
	//dangkiloptap
	public List<dangkiloptap> GetDatadangkiloptap();
    public dangkiloptap addDangkiloptap(dangkiloptap dklt);
    public dangkiloptap updateDangkiloptap(dangkiloptap dklt);
    public void deleteDangkiloptap(int id);
    public dangkiloptap findDangkiloptap(int id);
	
	//khachhang
	public List<khachhang> GetDatakhachhang();
    public khachhang addKhachhang(khachhang kh);
    public khachhang updateKhachhang(khachhang kh);
    public khachhang findKhachhang(String name);
	//user
	public List<user> GetDatauser();
    public user signIn(String username, String password);
    public user signUp(String username, String password, String role);


}
