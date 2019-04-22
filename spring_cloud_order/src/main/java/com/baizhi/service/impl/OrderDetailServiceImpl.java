package com.baizhi.service.impl;

import com.baizhi.dao.OrderDetailMapper;
import com.baizhi.entity.OrderDetail;
import com.baizhi.service.OrderDetailService;
import com.netflix.discovery.converters.Auto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class OrderDetailServiceImpl implements OrderDetailService {

    @Autowired
    private OrderDetailMapper orderDetailMapper;

    @Override
    public void add(OrderDetail orderDetail) {
        orderDetailMapper.insert(orderDetail);
    }
}
