package demospringmvc.Controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import demospringmvc.Entity.chitietgoitap;
import demospringmvc.service.HomeService;
import demospringmvc.service.IHomeService;

@Controller
public class ChitietgoitapController {
	@Autowired
	HomeService HomeService;

	// API để cung cấp dữ liệu cho chi tiết gói tập
		@RequestMapping(value = "/admin/chitietgoitap/data", method = RequestMethod.GET, produces = "application/json")
		@ResponseBody
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

}
