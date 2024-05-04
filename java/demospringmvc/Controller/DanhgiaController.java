package demospringmvc.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import demospringmvc.Entity.danhgia;
import demospringmvc.service.IHomeService;

@Controller
public class DanhgiaController {

    @Autowired
    private IHomeService homeService;

    @RequestMapping(value = "/danhgia/add", method = RequestMethod.POST)
    public ModelAndView adddanhgia(@ModelAttribute("danhgia") danhgia dg) {
        homeService.adddanhgia(dg);
        return new ModelAndView("redirect:/user/danhgia");
    }

    @RequestMapping(value = "/danhgia/update", method = RequestMethod.POST)
    public ModelAndView updatedanhgia(@ModelAttribute("danhgia") danhgia dg) {
        homeService.updatedanhgia(dg);
        return new ModelAndView("redirect:/user/danhgia");
    }

}
