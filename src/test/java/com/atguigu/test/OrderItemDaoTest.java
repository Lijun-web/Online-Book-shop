package com.atguigu.test;

import com.atguigu.dao.OrderItemDao;
import com.atguigu.dao.impl.OrderItemDaoImpl;
import com.atguigu.pojo.OrderItem;
import org.junit.Test;

import java.math.BigDecimal;

import static org.junit.Assert.*;

public class OrderItemDaoTest {

    OrderItemDao orderItemDao = new OrderItemDaoImpl();

    @Test
    public void saveOrderItem() {
        orderItemDao.saveOrderItem(new OrderItem(null,"nihao",1,new BigDecimal(100),new BigDecimal(100),"a1245"));
    }
}