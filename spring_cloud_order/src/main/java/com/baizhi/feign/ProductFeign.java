package com.baizhi.feign;

import com.baizhi.entity.OrderItem;
import com.baizhi.entity.ProductInfo;
import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@FeignClient(serviceId = "eureka-product")
public interface ProductFeign {
    @RequestMapping("product/findInfoById")
    ProductInfo findInfoById(@RequestParam("id") String id);

    @RequestMapping(value = "product/reduceCount", method = RequestMethod.POST)
    void reduceCount(List<OrderItem> items);
}
