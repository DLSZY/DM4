package com.baizhi.service.impl;

import com.baizhi.dao.OrderMasterMapper;
import com.baizhi.entity.OrderDetail;
import com.baizhi.entity.OrderItem;
import com.baizhi.entity.OrderMaster;
import com.baizhi.entity.ProductInfo;
import com.baizhi.feign.ProductFeign;
import com.baizhi.service.OrderDetailService;
import com.baizhi.service.OrderMasterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class OrderMasterServiceImpl implements OrderMasterService {

    @Autowired
    private OrderMasterMapper orderMasterMapper;
    @Autowired
    private ProductFeign productFeign;
    @Autowired
    private OrderDetailService orderDetailService;


    @Override
    public void add(String id,String name, String phone, String address, String openid, List<OrderItem> items) {
        try {
            //添加订单信息
            OrderMaster orderMaster = new OrderMaster();
            orderMaster.setBuyerName(name);
            orderMaster.setBuyerIphone(phone);
            orderMaster.setBuyerAddress(address);
            orderMaster.setBuyerOpenid(openid);
            orderMaster.setOrderId(id);
            orderMaster.setOrderAmount(items.size());
            orderMaster.setOrderStatus(1);
            orderMaster.setPayStayus(1);
            orderMaster.setCreateTime(new Date());
            orderMasterMapper.insert(orderMaster);

            //添加订单详情
            for (OrderItem item : items) {
                ProductInfo productInfo = productFeign.findInfoById(item.getProductId());
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setDetailId(UUID.randomUUID().toString());
                orderDetail.setCreateTime(new Date());
                orderDetail.setOrderId(id);
                orderDetail.setProdcutName(productInfo.getProductName());
                orderDetail.setProductIcon(productInfo.getProductIcon());
                orderDetail.setProductId(item.getProductId());
                orderDetail.setProductPrice(productInfo.getProductPrice());
                orderDetail.setProductQuantity(item.getProductQuantity());
                orderDetail.setUpdateTime(new Date());
                orderDetailService.add(orderDetail);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
