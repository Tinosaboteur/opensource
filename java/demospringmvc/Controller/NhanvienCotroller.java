package demospringmvc.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import demospringmvc.Entity.nhanvien;
import demospringmvc.service.IHomeService;

@Controller
public class NhanvienCotroller {
	@Autowired
    private IHomeService homeService;

    @RequestMapping(value = "/nhanvien/add", method = RequestMethod.POST)
    public ModelAndView addNhanvien(@ModelAttribute("nhanvien") nhanvien nv) {
        homeService.addNhanvien(nv);
        return new ModelAndView("redirect:/nhanvien");
    }

    @RequestMapping(value = "/nhanvien/update", method = RequestMethod.POST)
    public ModelAndView updateNhanvien(@ModelAttribute("nhanvien") nhanvien nv) {
        homeService.updateNhanvien(nv);
        return new ModelAndView("redirect:/nhanvien");
    }

    @RequestMapping(value = "/nhanvien/delete", method = RequestMethod.POST)
    public ModelAndView deleteNhanvien(@RequestParam("employeeID") int employeeID) {
        homeService.deleteNhanvien(employeeID);
        return new ModelAndView("redirect:/nhanvien");
    }

    @RequestMapping(value = "/nhanvien/find", method = RequestMethod.GET)
    public ModelAndView findNhanvien(@RequestParam("name") String name) {
    	List<nhanvien> nv = homeService.findNhanvien(name);
        ModelAndView mav = new ModelAndView("admin/nhanvien/detail");
        mav.addObject("nhanvien", nv);
        return mav;
    }
}
