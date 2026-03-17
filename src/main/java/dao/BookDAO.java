package dao;

import model.Book;
import util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookDAO {

    // ================= MAP RESULTSET TO BOOK =================
    private Book mapBook(ResultSet rs) throws SQLException {

        Book b = new Book();

        b.setId(rs.getInt("id"));
        b.setTitle(rs.getString("title"));
        b.setAuthor(rs.getString("author"));
        b.setPrice(rs.getDouble("price"));
        b.setImage(rs.getString("image"));
        b.setRating(rs.getDouble("rating"));
        b.setCategoryId(rs.getInt("category_id"));
        b.setStock(rs.getInt("stock"));

        return b;
    }

    // ================= GET BOOK BY ID =================
    public Book getBookById(int id) {

        Book book = null;

        String sql = "SELECT * FROM books WHERE id = ?";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                book = mapBook(rs);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return book;
    }

    // ================= GET BOOKS BY CATEGORY =================
    public List<Book> getBooksByCategoryId(int categoryId) {

        List<Book> list = new ArrayList<>();

        String sql = "SELECT * FROM books WHERE category_id = ?";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, categoryId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(mapBook(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // ================= GET ALL BOOKS =================
    public List<Book> getAllBooks() {

        List<Book> list = new ArrayList<>();

        String sql = "SELECT * FROM books";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(mapBook(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    // ================= SEARCH BOOKS =================
    public List<Book> searchBooks(String keyword) {

    List<Book> list = new ArrayList<>();

    String sql = "SELECT * FROM books WHERE title LIKE ? OR author LIKE ?";

    try (Connection con = DBUtil.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setString(1, "%" + keyword + "%");
        ps.setString(2, "%" + keyword + "%");

        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            list.add(mapBook(rs));
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return list;
}
    // ================= BOOKS FOR CATEGORY =================
    
    public List<Book> getBooksByCategory(int categoryId) {

    List<Book> list = new ArrayList<>();

    try {

        Connection con = DBUtil.getConnection();

        String sql = "SELECT * FROM books WHERE category_id=?";

        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, categoryId);

        ResultSet rs = ps.executeQuery();

        while(rs.next()){

            Book b = new Book();

            b.setId(rs.getInt("id"));
            b.setTitle(rs.getString("title"));
            b.setAuthor(rs.getString("author"));
            b.setPrice(rs.getDouble("price"));
            b.setImage(rs.getString("image"));
            b.setStock(rs.getInt("stock"));

            list.add(b);
        }

    } catch(Exception e){
        e.printStackTrace();
    }

    return list;
}
   
}