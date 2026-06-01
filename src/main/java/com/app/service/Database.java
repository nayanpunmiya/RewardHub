package com.app.service;

import com.app.model.User;
import com.app.model.Transaction;
import org.springframework.stereotype.Service;
import java.util.*;

@Service
public class Database {
    private Map<String, User> users = new HashMap<>();
    private Map<String, Transaction> transactions = new HashMap<>();
    private int userCounter = 1;
    private int transCounter = 1;

    public User createUser(String name, String email) {
        User user = new User("USER" + userCounter++, name, email);
        users.put(user.getId(), user);
        return user;
    }

    public User getUser(String userId) {
        return users.get(userId);
    }

    public List<User> getAllUsers() {
        return new ArrayList<>(users.values());
    }

    public void updateUser(String userId, String name, String email) {
        User user = users.get(userId);
        if (user != null) {
            user.setName(name);
            user.setEmail(email);
        }
    }

    public Transaction createTransaction(String userId, String merchant, double amount, double cashbackPercent) {
        User user = users.get(userId);
        if (user != null) {
            Transaction trans = new Transaction("TXN" + transCounter++, userId, merchant, amount, cashbackPercent);
            transactions.put(trans.getId(), trans);
            user.addCashback(trans.getCashbackAmount());
            return trans;
        }
        return null;
    }

    public List<Transaction> getUserTransactions(String userId) {
        List<Transaction> userTrans = new ArrayList<>();
        for (Transaction t : transactions.values()) {
            if (t.getUserId().equals(userId)) {
                userTrans.add(t);
            }
        }
        return userTrans;
    }

    public List<Transaction> getAllTransactions() {
        return new ArrayList<>(transactions.values());
    }
}
