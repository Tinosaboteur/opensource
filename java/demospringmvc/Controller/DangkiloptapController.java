package demospringmvc.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import demospringmvc.Entity.dangkiloptap;
import demospringmvc.service.IHomeService;

@Controller
public class DangkiloptapController {
	@Autowired
    private IHomeService homeService;

    @RequestMapping(value = "/dangkyloptap/add", method = RequestMethod.POST)
    public ModelAndView addDangkiloptap(@ModelAttribute("dangkyloptap") dangkiloptap dklt) {
        homeService.addDangkiloptap(dklt);
        return new ModelAndView("redirect:/dangkyloptap");
    }

    @RequestMapping(value = "/dangkyloptap/update", method = RequestMethod.POST)
    public ModelAndView updateDangkiloptap(@ModelAttribute("dangkyloptap") dangkiloptap dklt) {
        homeService.updateDangkiloptap(dklt);
        return new ModelAndView("redirect:/dangkyloptap");
    }

    @RequestMapping(value = "/dangkyloptap/delete", method = RequestMethod.POST)
    public ModelAndView deleteDangkiloptap(@RequestParam("registrationID") int registrationID) {
        homeService.deleteDangkiloptap(registrationID);
        return new ModelAndView("redirect:/dangkyloptap");
    }
    @RequestMapping(value = "/dangkyloptap/find", method = RequestMethod.GET)
    public ModelAndView findDangkiloptap(@RequestParam("registrationID") int registrationID) {
    	dangkiloptap dklt = homeService.findDangkiloptap(registrationID);
        ModelAndView mav = new ModelAndView("admin/dangkyloptap/detail");
        mav.addObject("khachhang", homeService.GetDatakhachhang());
		mav.addObject("lichtap", homeService.GetDatalichtap());
        mav.addObject("dangkiloptap", dklt);
        return mav;
    }
}
