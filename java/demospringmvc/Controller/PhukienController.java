package demospringmvc.Controller;

import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import demospringmvc.Entity.phukien;
import demospringmvc.service.IHomeService;

@Controller
public class PhukienController {
    @Autowired
    private IHomeService homeService;

    @RequestMapping(value = "/phukien/add", method = RequestMethod.POST)
    public ModelAndView addphukien(@ModelAttribute("phukien") phukien pk) {
        homeService.addphukien(pk);
        return new ModelAndView("redirect:/admin/phukien");
    }

    @RequestMapping(value = "/phukien/update", method = RequestMethod.POST)
    public ModelAndView updatephukien(@ModelAttribute("phukien") phukien pk) {
        homeService.updatephukien(pk);
        return new ModelAndView("redirect:/admin/phukien");
    }

    @RequestMapping(value = "/phukien/delete", method = RequestMethod.POST)
    public ModelAndView deletephukien(@RequestParam("phukienID") int phukienID) {
        homeService.deletephukien(phukienID);
        return new ModelAndView("redirect:/admin/phukien");
    }

    @GetMapping("/user/phukien/find")
    public phukien findphukienUser(@RequestParam("name") String name) {
        return homeService.findphukien(name);
    }
}
