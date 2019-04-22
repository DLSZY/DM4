package com.baizhi.controller;

import com.baizhi.entity.*;
import com.baizhi.feign.ProductFeign;
import com.baizhi.service.OrderDetailService;
import com.baizhi.service.OrderMasterService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.util.*;

@RestController
@RequestMapping("order")
public class OrderController {
    @Autowired
    private OrderMasterService orderMasterService;
    @Autowired
    private ProductFeign productFeign;
    @Autowired
    private OrderDetailService orderDetailService;

    @RequestMapping("create")
    public Map<String,Object> create(String name, String phone, String address, String openid, @RequestBody List<OrderItem> items){

        String orderId = UUID.randomUUID().toString();
        Map<String,Object> map = new HashMap<>();
        Map<String,String> data = new HashMap<>();
        data.put("orderId",orderId);
        map.put("data",data);
        try {
            orderMasterService.add(orderId,name,phone,address,openid,items);
            map.put("code",1);
            map.put("msg","成功");
            productFeign.reduceCount(items);
        } catch (Exception e) {
            map.put("code",0);
            map.put("msg","失败");
        }
        return map;
    }
}
