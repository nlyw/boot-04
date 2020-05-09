package com.jy.service.book;

import com.jy.model.book.Book;

import java.util.Map;

public interface BookService {
    Map<String,Object> selectBookList(Book book);

    void deleteAllCheckedBook(Book book);
}
