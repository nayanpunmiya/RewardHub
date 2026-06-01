package com.app.controller;

import com.app.model.User;
import com.app.model.Transaction;
import com.app.service.Database;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.*;

@RestController
@RequestMapping("/api")
public class ApiController {
    @Autowired
    private Database db;

    @GetMapping("/health")
    public Map<String, String> health() {
        Map<String, String> response = new HashMap<>();
        response.put("status", "OK");
        response.put("message", "API is running");
        return response;
    }

    @PostMapping("/users")
    public User createUser(@RequestBody Map<String, String> body) {
        return db.createUser(body.get("name"), body.get("email"));
    }

    @GetMapping("/users/{userId}")
    public User getUser(@PathVariable String userId) {
        return db.getUser(userId);
    }

    @GetMapping("/users")
    public List<User> getAllUsers() {
        return db.getAllUsers();
    }

    @PutMapping("/users/{userId}")
    public User updateUser(@PathVariable String userId, @RequestBody Map<String, String> body) {
        db.updateUser(userId, body.get("name"), body.get("email"));
        return db.getUser(userId);
    }

    @PostMapping("/transactions")
    public Transaction createTransaction(@RequestBody Map<String, Object> body) {
        return db.createTransaction(
            (String) body.get("userId"),
            (String) body.get("merchant"),
            Double.parseDouble(body.get("amount").toString()),
            Double.parseDouble(body.get("cashbackPercent").toString())
        );
    }

    @GetMapping("/transactions/{userId}")
    public List<Transaction> getUserTransactions(@PathVariable String userId) {
        return db.getUserTransactions(userId);
    }

    @GetMapping("/transactions")
    public List<Transaction> getAllTransactions() {
        return db.getAllTransactions();
    }

    @GetMapping("/stats")
    public Map<String, Object> getStats() {
        Map<String, Object> stats = new HashMap<>();
        List<User> allUsers = db.getAllUsers();
        stats.put("totalUsers", allUsers.size());
        stats.put("totalTransactions", db.getAllTransactions().size());
        double totalCashback = allUsers.stream().mapToDouble(User::getCashbackEarned).sum();
        stats.put("totalCashbackDistributed", totalCashback);
        return stats;
    }
}
