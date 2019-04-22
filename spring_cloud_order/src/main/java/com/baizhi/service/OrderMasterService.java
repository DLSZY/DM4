package com.baizhi.service;

import com.baizhi.entity.OrderItem;

import java.util.List;

public interface OrderMasterService {
    void add(String id,String name, String phone, String address, String openid,List<OrderItem> items);
}
