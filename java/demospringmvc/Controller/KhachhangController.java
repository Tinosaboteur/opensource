package demospringmvc.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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

import demospringmvc.Entity.khachhang;
import demospringmvc.service.HomeService;
import demospringmvc.service.IHomeService;

@Controller
public class KhachhangController {
	@Autowired
	HomeService HomeService;

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


}
