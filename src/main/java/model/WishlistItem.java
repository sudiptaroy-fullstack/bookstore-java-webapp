/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import java.io.Serializable;
public class WishlistItem implements Serializable {

    private int bookId;
    private String title;
    private String author;
    private double price;
    private String image;

    public WishlistItem(int bookId, String title, String author, double price, String image) {
        this.bookId = bookId;
        this.title = title;
        this.author = author;
        this.price = price;
        this.image = image;
    }

    public int getBookId() { return bookId; }
    public String getTitle() { return title; }
    public String getAuthor() { return author; }
    public double getPrice() { return price; }
    public String getImage() { return image; }
}