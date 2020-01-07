package com.kuang.controller;

import com.kuang.pojo.Books;
import com.kuang.pojo.UserBook;
import com.kuang.service.BookService;
import com.kuang.service.BookUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("userbook")
public class UserBookController {
    @Autowired
    @Qualifier("BookUserServiceImpl")
    private BookUserService bookUserService;
    @Autowired
    @Qualifier("BookServiceImpl")
    private BookService bookService;
    @RequestMapping("allBookUser")
    public String userallbook(Model model){
        model.addAttribute("userbooklist",bookUserService.queryAllUserBook());
        return "admin/allBookUser";
    }
    @RequestMapping("del")
    public String del(String id,int bookid,int bookcount){
        UserBook userBook=new UserBook(id,bookid,null,bookcount);
        bookService.updateBookCount(bookid,(bookcount)*(-1));
        bookUserService.deleteUserBook(userBook);
        return "redirect:/userbook/allBookUser";
    }
    @RequestMapping("user")
    public String user(Model model){
        List<Books> list=bookService.queryAllBook();
        model.addAttribute("list",list);
        return "user/user";
    }
    @RequestMapping("addUserBook")
    public String addUserBook(int bookid,String bookname,HttpServletRequest httpServletRequest){
        HttpSession session=httpServletRequest.getSession();
        UserBook userBook=new UserBook(session.getAttribute("user").toString(),bookid,bookname,1);
        if(bookUserService.queryAllUserBookByIdByName(userBook).size()>0){
            bookUserService.updateUserBook(userBook);
            bookService.updateBookCount(bookid,1);
        }else{
            bookUserService.addUserBook(userBook);
            bookService.updateBookCount(bookid,1);
        }
        return "redirect:/userbook/user";
    }
    @RequestMapping("userborrow")
    public String userborrow(Model model,HttpServletRequest httpServletRequest){
        List<UserBook> list=bookUserService.queryAllUserBookById(httpServletRequest.getSession().getAttribute("user").toString());
        model.addAttribute("userborrow",list);
        return "user/userborrow";
    }
}
