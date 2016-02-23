package com.springapp.mvc;

import com.springapp.mvc.entity.UserEntity;
import com.springapp.mvc.service.UserService;
import com.springapp.mvc.utils.HibernateSessionFactory;
import org.hibernate.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/")
public class MainController {
    @Resource(name = "userService")
    private UserService userService = new UserService();

    @RequestMapping(method = RequestMethod.GET)
    public String getUsers(@RequestParam(value = "page", required = false) Integer page,Model model) {
        if(page==null)
            page=0;

        List<UserEntity> users = userService.getAll(page);
        model.addAttribute("users", users);
        int startpage = (int) (page - 5 > 0?page - 5:1);
        int endpage = startpage + 10;
        model.addAttribute("startpage",startpage);
        model.addAttribute("endpage",endpage);



        return "userspage";
    }

    @RequestMapping(value = "add", method = RequestMethod.POST)
    public String add(@ModelAttribute("userAttribute") UserEntity user) {
        userService.add(user);
        return "addedpage";
    }

    @RequestMapping(value = "add", method = RequestMethod.GET)
    public String getAdd(Model model) {

        model.addAttribute("userAttribute", new UserEntity());
        return "addpage";
    }

    @RequestMapping(value = "edit", method = RequestMethod.GET)
    public String getEdit(@RequestParam(value = "id", required = true) Integer id,
                          Model model) {
        model.addAttribute("userAttribute", userService.get(id));
        return "editpage";
    }

   @RequestMapping(value = "find", method = RequestMethod.POST)
    public String getByName(
                            @RequestParam(value = "name", required = true) String name,
                          Model model) {
       List<UserEntity> users = userService.getByName(name);
       model.addAttribute("users", users);

        return "byNamePage";
    }

    @RequestMapping(value = "delete", method = RequestMethod.GET)
    public String delete(@RequestParam(value = "id", required = true) Integer id,
                         Model model) {

        userService.delete(id);
        model.addAttribute("id", id);
        return "deletedpage";
    }

    @RequestMapping(value = "edit", method = RequestMethod.POST)
    public String saveEdit(@ModelAttribute("userAttribute") UserEntity user,
                           @RequestParam(value = "id", required = true) Integer id,
                           Model model) {

        user.setId(id);

        userService.edit(user);
        model.addAttribute("id", id);
        return "editedpage";
    }



}