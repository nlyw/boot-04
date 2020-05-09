package com.jy.controller.book;

import com.jy.model.book.Book;
import com.jy.service.book.BookService;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
public class BookContoller {

    @Autowired
    private BookService bookService;

    @RequestMapping("book/toList")
    String toBookListPage() {
        return "book/list";
    }

    @RequestMapping("book/list")
    @ResponseBody
    Map<String, Object> selectBookList(Book book) {
        Map<String, Object> map = bookService.selectBookList(book);
        return map;
    }

    @RequiresPermissions(value = {"/book/deleteAll"})
    @RequestMapping("book/deleteAll")
    @ResponseBody
    String deleteAllCheckedBook(Book book) {
        bookService.deleteAllCheckedBook(book);
        return "{}";
    }
}
