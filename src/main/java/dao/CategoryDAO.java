/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.*;
import model.Category;
import util.DBUtil;

public class CategoryDAO {

    public List<Category> getAllCategories(){

        List<Category> list = new ArrayList<>();

        try{

            Connection con = DBUtil.getConnection();

            String sql = "SELECT * FROM categories";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                Category c = new Category();

                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));

                list.add(c);
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return list;
    }
}