package com.app.model;

import java.time.LocalDateTime;

public class User {
    private String id;
    private String name;
    private String email;
    private double cashbackEarned;
    private LocalDateTime joinDate;

    public User(String id, String name, String email) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.cashbackEarned = 0;
        this.joinDate = LocalDateTime.now();
    }

    public String getId() { return id; }
    public String getName() { return name; }
    public String getEmail() { return email; }
    public double getCashbackEarned() { return cashbackEarned; }
    public LocalDateTime getJoinDate() { return joinDate; }
    
    public void addCashback(double amount) {
        this.cashbackEarned += amount;
    }

    public void setName(String name) { this.name = name; }
    public void setEmail(String email) { this.email = email; }
}
