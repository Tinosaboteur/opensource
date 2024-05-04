package demospringmvc.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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

import demospringmvc.service.HomeService;
import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
	@Autowired
	HomeService HomeService;

	//admin
	//phukien
	@RequestMapping(value = "/admin/phukien", method = RequestMethod.GET)
	public String phukienAD() {
	    return "admin/phukien";
	}
	// API để cung cấp dữ liệu cho phụ kiện
	@RequestMapping(value = "/admin/phukien/data", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<phukien> phukienDataAD() {
	    return HomeService.GetDataphukien();
	}


	// API để thêm một phụ kiện mới
	@PostMapping("/admin/phukien/add")
	public phukien addPhukien(@RequestBody phukien pk) {
	    return HomeService.addphukien(pk);
	}

	// API để xóa một phụ kiện
	@DeleteMapping("/admin/phukien/delete/{id}")
	public String deletePhukien(@PathVariable int id) {
	    HomeService.deletephukien(id);
	    return "Phụ kiện đã được xóa thành công";
	}

	// API để cập nhật một phụ kiện
	@PutMapping("/admin/phukien/update")
	public phukien updatePhukien(@RequestBody phukien pk) {
	    return HomeService.updatephukien(pk);
	}

	// API để lấy chi tiết của một phụ kiện
	@GetMapping("/admin/phukien/detail/{name}")
	public phukien detailPhukien(@PathVariable String name) {
	    return HomeService.findphukien(name);
	}

	
	@RequestMapping(value = "/admin/trang-chu")
	public ModelAndView homead() {
		ModelAndView mv = new ModelAndView("admin/trang-chu");
		return mv;
	}
	
	//giaodich
	@RequestMapping(value = "/admin/giaodich", method = RequestMethod.GET)
	public String giaodichAD() {
	    return "admin/giaodich";
	}
	// API để cung cấp dữ liệu cho giao dịch
	@GetMapping("/giaodich/data")
	public Map<String, Object> giaodichData() {
	    Map<String, Object> data = new HashMap<>();
	    data.put("goitap", HomeService.GetDatagoitap());
	    data.put("khachhang", HomeService.GetDatakhachhang());
	    data.put("chitietgoitap", HomeService.GetDatachitietgoitap());
	    return data;
	}

	// API để lấy chi tiết của một giao dịch
	@GetMapping("/admin/giaodich/detail/{id}")
	public Map<String, Object> detailGiaodich(@PathVariable int id) {
	    Map<String, Object> data = new HashMap<>();
	    data.put("chitietgoitap", HomeService.GetDatachitietgoitap());
	    data.put("khachhang", HomeService.GetDatakhachhang());
	    data.put("goitap", HomeService.GetDatagoitap());
	    return data;
	}

	@RequestMapping(value = "/admin/nhanvien", method = RequestMethod.GET)
	public String nhanvienAD() {
	    return "admin/nhanvien";
	}
	// API để cung cấp dữ liệu cho nhân viên
	@RequestMapping(value = "/admin/nhanvien/data", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<nhanvien> nhanvienData() {
	    return HomeService.GetDatanhanvien();
	}

	
	// API để thêm một nhân viên mới
	@PostMapping("/admin/nhanvien/add")
	public nhanvien addNhanvien(@RequestBody nhanvien nv) {
	    return HomeService.addNhanvien(nv);
	}
	

	// API để xóa một nhân viên
	@DeleteMapping("/admin/nhanvien/delete/{id}")
	public String deleteNhanvien(@PathVariable int id) {
	    HomeService.deleteNhanvien(id);
	    return "Nhân viên đã được xóa thành công";
	}

	// API để cập nhật một nhân viên
	@PutMapping("/admin/nhanvien/update")
	public nhanvien updateNhanvien(@RequestBody nhanvien nv) {
	    return HomeService.updateNhanvien(nv);
	}
	
	
	//chitietgoitap
	@RequestMapping(value = "/admin/chitietgoitap", method = RequestMethod.GET)
	public String chitietgoitapAD() {
	    return "admin/chitietgoitap";
	}
	// API để cung cấp dữ liệu cho chi tiết gói tập
	@GetMapping("/chitietgoitap/data")
	public Map<String, Object> chitietgoitapData() {
	    Map<String, Object> data = new HashMap<>();
	    data.put("chitietgoitap", HomeService.GetDatachitietgoitap());
	    data.put("khachhang", HomeService.GetDatakhachhang());
	    data.put("goitap", HomeService.GetDatagoitap());
	    return data;
	}

	// API để thêm một chi tiết gói tập mới
	@PostMapping("/admin/chitietgoitap/add")
	public chitietgoitap addChitietgoitap(@RequestBody chitietgoitap ctgt) {
	    return HomeService.addChitietgoitap(ctgt);
	}

	// API để cập nhật một chi tiết gói tập
	@PutMapping("/admin/chitietgoitap/update")
	public chitietgoitap updateChitietgoitap(@RequestBody chitietgoitap ctgt) {
	    return HomeService.updateChitietgoitap(ctgt);
	}

	// API để lấy chi tiết của một chi tiết gói tập
	@GetMapping("/admin/chitietgoitap/detail/{id}")
	public chitietgoitap detailChitietgoitap(@PathVariable int id) {
	    return HomeService.findChitietgoitap(id);
	}
	
	//khachhang
	@RequestMapping(value = "/admin/khachhang", method = RequestMethod.GET)
	public String khachhangAD() {
	    return "admin/khachhang";
	}
	// API để cung cấp dữ liệu cho khách hàng
	@RequestMapping(value = "/admin/khachhang/data", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<khachhang> khachhangData() {
	    return HomeService.GetDatakhachhang();
	}

	// API để thêm một khách hàng mới
	@PostMapping("/admin/khachhang/add")
	public khachhang addKhachhang(@RequestBody khachhang kh) {
	    return HomeService.addKhachhang(kh);
	}

	// API để cập nhật một khách hàng
	@PutMapping("/admin/khachhang/update")
	public khachhang updateKhachhang(@RequestBody khachhang kh) {
	    return HomeService.updateKhachhang(kh);
	}

	// API để lấy chi tiết của một khách hàng
	@GetMapping("/admin/khachhang/detail/{name}")
	public khachhang detailKhachhang(@PathVariable String name) {
	    return HomeService.findKhachhang(name);
	}

	//thietbi
	@RequestMapping(value = "/admin/thietbi", method = RequestMethod.GET)
	public String thietbiAD() {
	    return "admin/thietbi";
	}
	// API để cung cấp dữ liệu cho thiết bị
	@RequestMapping(value = "/admin/thietbi/data", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<thietbi> thietbiDataAD() {
	    return HomeService.GetDatathietbi();
	}


	// API để thêm một thiết bị mới
	@PostMapping("/admin/thietbi/add")
	public thietbi addThietbi(@RequestBody thietbi tb) {
	    return HomeService.addThietbi(tb);
	}

	// API để xóa một thiết bị
	@DeleteMapping("/admin/thietbi/delete/{id}")
	public String deleteThietbi(@PathVariable int id) {
	    HomeService.deleteThietbi(id);
	    return "Thiết bị đã được xóa thành công";
	}

	// API để cập nhật một thiết bị
	@PutMapping("/admin/thietbi/update")
	public thietbi updateThietbi(@RequestBody thietbi tb) {
	    return HomeService.updateThietbi(tb);
	}

	// API để lấy chi tiết của một thiết bị
	@GetMapping("/admin/thietbi/detail/{name}")
	public thietbi detailThietbi(@PathVariable String name) {
	    return HomeService.findThietbi(name);
	}

	//dangkiloptap
	@RequestMapping(value = "/admin/dangkiloptap", method = RequestMethod.GET)
	public String dangkilptap() {
	    return "admin/dangkiloptap";
	}
	
	//API cung cấp data cho trang dangkiloptap
	@RequestMapping(value = "/admin/dangkiloptap/data", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public Map<String, Object> dangkiloptapData() {
	    Map<String, Object> data = new HashMap<>();
	    data.put("dangkiloptap", HomeService.GetDatadangkiloptap());
	    data.put("khachhang", HomeService.GetDatakhachhang());
	    data.put("lichtap", HomeService.GetDatalichtap());
	    return data;
	}

	

	// API để thêm một đăng ký lớp tập mới
	@PostMapping("/admin/dangkiloptap/add")
	public dangkiloptap addDangkiloptap(@RequestBody dangkiloptap dklt) {
	    return HomeService.addDangkiloptap(dklt);
	}

	// API để xóa một đăng ký lớp tập
	@DeleteMapping("/admin/dangkiloptap/delete/{id}")
	public String deleteDangkiloptap(@PathVariable int id) {
	    HomeService.deleteDangkiloptap(id);
	    return "Đăng ký lớp tập đã được xóa thành công";
	}

	// API để cập nhật một đăng ký lớp tập
	@PutMapping("/admin/dangkiloptap/update")
	public dangkiloptap updateDangkiloptap(@RequestBody dangkiloptap dklt) {
	    return HomeService.updateDangkiloptap(dklt);
	}



	
	//user
	
	//trangchu
	// API để cung cấp trang chủ
	@RequestMapping(value = "/user/home", method = RequestMethod.GET)
	public String home() {
	    return "user/home";
	}

	// API mới để cung cấp dữ liệu cho gói tập
	@RequestMapping(value = "/goitap/data", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<goitap> goitapData() {
	    return HomeService.GetDatagoitap();
	}

	// Hàm controller chỉ đơn giản là điều hướng tới trang gói tập
	@RequestMapping(value = "user/goitap", method = RequestMethod.GET)
	public String goitap() {
	    return "user/goitap";
	}

	
	// API mới để cung cấp dữ liệu
	@RequestMapping(value = "/user/thietbi/data", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<thietbi> thietbiData() {
	    return HomeService.GetDatathietbi();
	}

	// Hàm controller hiện tại chỉ đơn giản là điều hướng tới trang phụ kiện
	@RequestMapping(value = "/user/thietbi", method = RequestMethod.GET)
	public String thietbi() {
	    return "user/thietbi";
	}

	@RequestMapping(value = "/user/phukien", method = RequestMethod.GET)
	public String phukien() {
	    return "user/phukien";
	}
	// API mới để cung cấp dữ liệu cho phụ kiện
	@RequestMapping(value = "/user/phukien/data", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<phukien> phukienData() {
	    return HomeService.GetDataphukien();
	}

	@RequestMapping(value = "/user/lichtap", method = RequestMethod.GET)
	public String lichtap() {
	    return "user/lichtap";
	}
	// API để cung cấp dữ liệu cho lịch tập
	@RequestMapping(value = "/lichtap/data", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public Map<String, Object> lichtapData() {
	    Map<String, Object> data = new HashMap<>();
	    data.put("lichtap", HomeService.GetDatalichtap());
	    data.put("nhanvien", HomeService.GetDatanhanvien());
	    return data;
	}

	
	@RequestMapping(value = "/user/danhgia", method = RequestMethod.GET)
	public String danhgia() {
	    return "user/danhgia";
	}
	// API mới để cung cấp dữ liệu cho đánh giá
	@RequestMapping(value = "/user/danhgia/data", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public Map<String, Object> danhgiaData() {
	    Map<String, Object> data = new HashMap<>();
	    data.put("khachhang", HomeService.GetDatakhachhang());
	    data.put("danhgia", HomeService.GetDatadanhgia());
	    return data;
	}


	@PostMapping("/user/danhgia/add")
	public ResponseEntity<danhgia> addDanhGia(@RequestBody danhgia dg, HttpSession session) {
	    if (dg != null) {
	        // Lấy Username từ phiên
	        String username = (String) session.getAttribute("username");

	        // Tìm khách hàng có Name trùng với Username
	        khachhang khachHang = HomeService.findKhachhang(username);
	        if (khachHang != null) {
	            // Đặt CustomerID cho danhgia
	            dg.setCustomerID(khachHang.getCustomerID());

	            danhgia addedDanhGia = HomeService.adddanhgia(dg);
	            if (addedDanhGia != null) {
	                return new ResponseEntity<>(addedDanhGia, HttpStatus.CREATED);
	            } else {
	                return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
	            }
	        } else {
	            return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
	        }
	    } else {
	        return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
	    }
	}


	// API để cập nhật một đánh giá
	@PutMapping("/user/danhgia/update")
	public danhgia updateDanhGia(@RequestBody danhgia dg) {
	    return HomeService.updatedanhgia(dg);
	}

	//blog
	@RequestMapping(value = "/user/blog")
	public ModelAndView blog() {
	    ModelAndView mv = new ModelAndView("user/blog");
	    return mv;
	}
	//TDEE/BMR
	@RequestMapping(value = "/user/TDEE-BMR")
	public ModelAndView TB() {
	    ModelAndView mv = new ModelAndView("user/TDEE-BMR");
	    return mv;
	}
	//login
	@RequestMapping(value = {"/","/dangky"})
	public String dangky() {
		return "login/signin";
	}
	

	@RequestMapping(value = "/dangnhap")
	public String dangnhap() {
		return "login/login";
	}
	@GetMapping("/demospringmvc/add/header")
    public ModelAndView header() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("add/header");
        return modelAndView;
    }

    @GetMapping("/demospringmvc/add/footer")
    public ModelAndView footer() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("footer");
        return modelAndView;
    }
    //AI
    @RequestMapping(value = {"/AI"})
	public String AI() {
		return "NewFile";
	}
    
}
