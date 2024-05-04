package demospringmvc.Controller;

import java.util.List;

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
public class GiaodichController {
	@Autowired
    private IHomeService homeService;

    @RequestMapping(value = "/giaodich/find", method = RequestMethod.GET)
    public ModelAndView findChitietgoitapByMonth(@RequestParam("startDate") int startDate) {
    	List<chitietgoitap> ctgt = homeService.findChitietgoitapByMonth(startDate);
        ModelAndView mav = new ModelAndView("admin/giaodich/detail");
        mav.addObject("khachhang", homeService.GetDatakhachhang());
		mav.addObject("goitap", homeService.GetDatagoitap());
        mav.addObject("chitietgoitap", ctgt);
        return mav;
    }
}
