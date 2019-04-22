package com.baizhi.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.math.BigDecimal;
import java.util.Date;

@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class OrderDetail {
    private String detailId;

    private String orderId;

    private String productId;

    private String prodcutName;

    private BigDecimal productPrice;

    private String productIcon;

    private Integer productQuantity;

    private Date createTime;

    private Date updateTime;

}