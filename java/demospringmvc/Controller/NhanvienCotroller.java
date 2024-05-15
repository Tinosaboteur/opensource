package demospringmvc.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import demospringmvc.Entity.nhanvien;
import demospringmvc.service.HomeService;
import demospringmvc.service.IHomeService;

@Controller
public class NhanvienCotroller {
	@Autowired
	HomeService HomeService;

	//nhanvien
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
}
