package model;

public class Book {

    private int id;
    private String title;
    private String author;
    private double price;
    private String image;
    private double rating;
    private int categoryId;
    private int stock;

    // ✅ No-arg constructor (IMPORTANT for JSP / DAO)
    public Book() {
    }

    // ✅ Optional parameterized constructor
    public Book(int id, String title, String author, double price,
                String image, double rating, int categoryId, int stock) {
        this.id = id;
        this.title = title;
        this.author = author;
        this.price = price;
        this.image = image;
        this.rating = rating;
        this.categoryId = categoryId;
        this.stock = stock;
    }

    // ================= Getters & Setters =================

    public int getId() { 
        return id; 
    }
    public void setId(int id) { 
        this.id = id; 
    }

    public String getTitle() { 
        return title; 
    }
    public void setTitle(String title) { 
        this.title = title; 
    }

    public String getAuthor() { 
        return author; 
    }
    public void setAuthor(String author) { 
        this.author = author; 
    }

    public double getPrice() { 
        return price; 
    }
    public void setPrice(double price) { 
        this.price = price; 
    }

    public String getImage() { 
        return image; 
    }
    public void setImage(String image) { 
        this.image = image; 
    }

    public double getRating() { 
        return rating; 
    }
    public void setRating(double rating) { 
        this.rating = rating; 
    }

    public int getCategoryId() { 
        return categoryId; 
    }
    public void setCategoryId(int categoryId) { 
        this.categoryId = categoryId; 
    }

    /**
     *
     * @return
     */
    public int getStock() {
        return stock;
    }
    public void setStock(int stock) {
        this.stock = stock;
    }
}