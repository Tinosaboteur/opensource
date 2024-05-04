package demospringmvc.Controller;

import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import demospringmvc.Entity.chitietgoitap;
import demospringmvc.service.IHomeService;

@Controller
public class ChitietgoitapController {
	@Autowired
    private IHomeService homeService;

    @RequestMapping(value = "/chitietgoitap/add", method = RequestMethod.POST)
    public ModelAndView addChitietgoitap(@ModelAttribute("chitietgoitap") chitietgoitap ctgt) {
        homeService.addChitietgoitap(ctgt);
        return new ModelAndView("redirect:/chitietgoitap");
    }

    @RequestMapping(value = "/chitietgoitap/update", method = RequestMethod.POST)
    public ModelAndView updateChitietgoitap(@ModelAttribute("chitietgoitap") chitietgoitap ctgt) {
        homeService.updateChitietgoitap(ctgt);
        return new ModelAndView("redirect:/chitietgoitap");
    }

    @RequestMapping(value = "/chitietgoitap/find", method = RequestMethod.GET)
    public ModelAndView findChitietgoitap(@RequestParam("subscriptionID") int subscriptionID) {
    	chitietgoitap ctgt = homeService.findChitietgoitap(subscriptionID);
        ModelAndView mav = new ModelAndView("admin/chitietgoitap/detail");
        mav.addObject("khachhang", homeService.GetDatakhachhang());
		mav.addObject("goitap", homeService.GetDatagoitap());
        mav.addObject("chitietgoitap", ctgt);
        return mav;
    }

}
