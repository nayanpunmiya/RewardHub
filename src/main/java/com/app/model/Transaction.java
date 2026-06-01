package com.app.model;

import java.time.LocalDateTime;

public class Transaction {
    private String id;
    private String userId;
    private String merchant;
    private double amount;
    private double cashbackPercent;
    private double cashbackAmount;
    private LocalDateTime date;

    public Transaction(String id, String userId, String merchant, double amount, double cashbackPercent) {
        this.id = id;
        this.userId = userId;
        this.merchant = merchant;
        this.amount = amount;
        this.cashbackPercent = cashbackPercent;
        this.cashbackAmount = amount * (cashbackPercent / 100);
        this.date = LocalDateTime.now();
    }

    public String getId() { return id; }
    public String getUserId() { return userId; }
    public String getMerchant() { return merchant; }
    public double getAmount() { return amount; }
    public double getCashbackPercent() { return cashbackPercent; }
    public double getCashbackAmount() { return cashbackAmount; }
    public LocalDateTime getDate() { return date; }
}
