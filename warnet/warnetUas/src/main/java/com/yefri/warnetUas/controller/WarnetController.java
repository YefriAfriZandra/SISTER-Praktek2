/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.yefri.warnetUas.controller;

import com.yefri.warnetUas.entity.Warnet;
import com.yefri.warnetUas.service.WarnetService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Admin
 */
@RestController
@RequestMapping("api/v1/warnet")
public class WarnetController {
    @Autowired
    public WarnetService warnetService;
    
    @GetMapping
    public List<Warnet> getAll() {
        return warnetService.getAll();
    }
    
    @GetMapping(path = "{id}")
    public Warnet getWarnetById(@PathVariable("id") Long id){
        return warnetService.getWarnetById(id);
    }
    
    @PostMapping
    public void insert(@RequestBody Warnet warnet) {
        warnetService.insert(warnet);
    }
    
    @DeleteMapping(path = "{id}")
    public void delete(@PathVariable("id") Long id){
        warnetService.delete(id);
    }

}
