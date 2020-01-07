package com.kuang.controller;

import com.google.gson.Gson;
import com.kuang.pojo.Books;
import com.kuang.pojo.User;
import com.kuang.service.BookService;
import com.kuang.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/book")
public class BookController {

    @Autowired
    @Qualifier("BookServiceImpl")
    private BookService bookService;

    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;

    @RequestMapping("/allBook")
    public String list(Model model){
        List<Books> list=bookService.queryAllBook();
        model.addAttribute("list",list);
        return "admin/allBook";
    }

    @RequestMapping("/toAddBook")
    public String toAddBook(){
        return "admin/toAddBook";
    }

    @RequestMapping("addBook")
    public String addBook(Books books){
        bookService.addBook(books);
        return "redirect:/book/allBook";
    }
    @RequestMapping("toUpdateBook")
    public String toUpdateBook(int id,Model model){
        Books book=bookService.queryBookById(id);
        model.addAttribute("book",book);
        return "admin/toUpdateBook";
    }
    @RequestMapping("UpdateBook")
    public String UpdateBook(Books books){
        bookService.updateBook(books);
        return "redirect:/book/allBook";
    }
    @RequestMapping("del")
    public String del(int id){
        bookService.deleteBookById(id);
        return "redirect:/book/allBook";
    }

    @RequestMapping("query")
    public String query(Model model,String bookName){
        List<Books> list=bookService.queryBookByName(bookName);
        model.addAttribute("list",list);
        if(list.size()<1)
        model.addAttribute("msg","未查到");
        return "admin/allBook";
    }
    @RequestMapping("toLogin")
    public String toLogin(){
        return "login";
    }
    @RequestMapping("toRegister")
    public String toRegister(){
        return "register";
    }
    @RequestMapping(value = "search",produces="text/html;charset=UTF-8")
    @ResponseBody
    public String search_box(String bookname){
        List<Books> list=bookService.queryBookByName(bookname);
        Gson gson=new Gson();
        return gson.toJson(list);
    }
    @RequestMapping("login")
    public String login(User user, HttpSession httpSession){
        User user1=userService.queryUser(user);
        if(userService.queryUser(user)!=null){
            httpSession.setAttribute("user",user1.getId());
            if(user1.getId().equals("admin")){
                return "redirect:/book/allBook";
            }else{
                return "redirect:/userbook/user";
            }
        }else{
            return "login";
        }
    }
    @RequestMapping("register")
    public String register(User user){
        if(userService.queryUserById(user.getId())==null){
            userService.addUesr(user);
            return "login";
        }else{
            return "register";
        }
    }
    @RequestMapping(value = "ReId",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String ReId(String id){
        if(userService.queryUserById(id)==null){
            return "true";
        }else{
            return "false";
        }
    }
}
