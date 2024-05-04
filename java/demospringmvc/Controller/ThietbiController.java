package demospringmvc.Controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import demospringmvc.Entity.thietbi;
import demospringmvc.service.IHomeService;

@Controller
public class ThietbiController {
    @Autowired
    private IHomeService homeService;

 // API để thêm một thiết bị mới
    @PostMapping("/thietbi/add")
    public thietbi addThietbi(@RequestBody thietbi tb) {
        return homeService.addThietbi(tb);
    }

    // API để cập nhật thông tin của một thiết bị
    @PutMapping("/thietbi/update")
    public thietbi updateThietbi(@RequestBody thietbi tb) {
        return homeService.updateThietbi(tb);
    }

    // API để xóa một thiết bị
    @DeleteMapping("/thietbi/delete/{equipmentID}")
    public String deleteThietbi(@PathVariable int equipmentID) {
        homeService.deleteThietbi(equipmentID);
        return "Thiết bị đã được xóa thành công";
    }

    // API để tìm một thiết bị theo tên từ trang quản trị
    @GetMapping("/admin/thietbi/find")
    public thietbi findThietbiAdmin(@RequestParam("name") String name) {
        return homeService.findThietbi(name);
    }

    // API để tìm một thiết bị theo tên từ trang người dùng
    @GetMapping("/user/thietbi/find")
    public thietbi findThietbiUser(@RequestParam("name") String name) {
        return homeService.findThietbi(name);
    }

}
