package demospringmvc.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import demospringmvc.Entity.khachhang;
import demospringmvc.Entity.user;
import demospringmvc.service.IHomeService;
import jakarta.servlet.http.HttpSession;


@Controller
public class UserController {
    @Autowired
    private IHomeService homeService;

    @RequestMapping(value = "/dangnhap", method = RequestMethod.POST)
    public ModelAndView login(@RequestParam("username") String username, @RequestParam("password") String password, HttpSession session) {
        user user = homeService.signIn(username, password);
        if (user == null) {
            ModelAndView mav = new ModelAndView("login/login");
            mav.addObject("message", "Tên đăng nhập hoặc mật khẩu không đúng");
            return mav;
        } else {
            // Lưu Username vào phiên
            session.setAttribute("username", username);

            if ("user".equals(user.getRole())) {
                return new ModelAndView("redirect:/user/home");
            } else {
                return new ModelAndView("redirect:/admin/home");
            }
        }
    }

    @RequestMapping(value = "/dangky", method = RequestMethod.POST)
    public ModelAndView register(@RequestParam("username") String username, @RequestParam("password") String password) {
        user user = homeService.signUp(username, password, "user");
        if (user == null) {
            ModelAndView mav = new ModelAndView("login/signin");
            mav.addObject("message", "Tên đăng nhập đã tồn tại");
            return mav;
        } else {
            return new ModelAndView("redirect:/user/home");
        }
    }
}
