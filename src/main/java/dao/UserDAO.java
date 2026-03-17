/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.User;
import util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

    public boolean register(User user){

        String sql="INSERT INTO users(name,email,password) VALUES(?,?,?)";

        try(Connection con=DBUtil.getConnection();
            PreparedStatement ps=con.prepareStatement(sql)){

            ps.setString(1,user.getName());
            ps.setString(2,user.getEmail());
            ps.setString(3,user.getPassword());

            return ps.executeUpdate()>0;

        }catch(Exception e){
            e.printStackTrace();
        }

        return false;
    }

    public User login(String email,String password){

        String sql="SELECT * FROM users WHERE email=? AND password=?";

        try(Connection con=DBUtil.getConnection();
            PreparedStatement ps=con.prepareStatement(sql)){

            ps.setString(1,email);
            ps.setString(2,password);

            ResultSet rs=ps.executeQuery();

            if(rs.next()){

                User u=new User();

                u.setId(rs.getInt("id"));
                u.setName(rs.getString("name"));
                u.setEmail(rs.getString("email"));

                return u;
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return null;
    }
    public boolean emailExists(String email){

    boolean exists = false;

    try{

        Connection con = DBUtil.getConnection();

        String sql = "SELECT * FROM users WHERE email=?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1,email);

        ResultSet rs = ps.executeQuery();

        if(rs.next()){
            exists = true;
        }

    }catch(Exception e){
        e.printStackTrace();
    }

    return exists;
}
    public boolean registerUser(User user){

    boolean status = false;

    try{

        Connection con = DBUtil.getConnection();

        String sql = "INSERT INTO users(name,email,password) VALUES(?,?,?)";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, user.getName());
        ps.setString(2, user.getEmail());
        ps.setString(3, user.getPassword());

        int rows = ps.executeUpdate();

        if(rows > 0){
            status = true;
        }

    }catch(Exception e){
        e.printStackTrace();
    }

    return status;
}
}
