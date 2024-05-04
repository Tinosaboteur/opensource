package demospringmvc.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import demospringmvc.Entity.khachhang;
import demospringmvc.service.IHomeService;

@Controller
public class KhachhangController {
	@Autowired
    private IHomeService homeService;

    @RequestMapping(value = "/khachhang/add", method = RequestMethod.POST)
    public ModelAndView addKhachhang(@ModelAttribute("khachhang") khachhang kh) {
        homeService.addKhachhang(kh);
        return new ModelAndView("redirect:/khachhang");
    }

    @RequestMapping(value = "/khachhang/update", method = RequestMethod.POST)
    public ModelAndView updateKhachhang(@ModelAttribute("khachhang") khachhang kh) {
        homeService.updateKhachhang(kh);
        return new ModelAndView("redirect:/khachhang");
    }


}
