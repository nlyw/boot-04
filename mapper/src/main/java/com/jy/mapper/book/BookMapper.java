package com.jy.mapper.book;

import com.jy.model.book.Book;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface BookMapper {

    @Select(" select t_id bookID, " +
            " t_name bookName, " +
            " t_author bookAuthor, " +
            " t_type bookType, " +
            " t_price bookPrice, " +
            " t_desc bookDesc, " +
            " date_format(t_date, \"%Y-%m-%d\") bookDateStr" +
            " from t_books ")
    List<Book> selectBookList(Book book);

    @Delete(" <script>" +
            " delete from t_books" +
            " where t_id in" +
            " <foreach collection=\"bookIDS.split(',')\" item=\"item\" separator=\",\" open=\" (\" close=\")\">" +
            " #{item}" +
            " </foreach>" +
            " </script>")
    void deleteAllCheckedBook(Book book);
}
