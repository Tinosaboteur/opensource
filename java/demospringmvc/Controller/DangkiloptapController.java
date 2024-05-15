package demospringmvc.Controller;

import java.util.HashMap;
import java.util.Map;

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

import demospringmvc.Entity.dangkiloptap;
import demospringmvc.service.HomeService;
import demospringmvc.service.IHomeService;

@Controller
public class DangkiloptapController {
	@Autowired
	HomeService HomeService;

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
}
