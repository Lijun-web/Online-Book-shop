package com.atguigu.test;

import com.atguigu.dao.OrderDao;
import com.atguigu.dao.impl.OrderDaoImpl;
import com.atguigu.pojo.Order;
import org.junit.Test;

import java.math.BigDecimal;
import java.util.Date;

import static org.junit.Assert.*;

public class OrderDaoTest {

    OrderDao orderDao = new OrderDaoImpl();

    @Test
    public void saveOrder() {
        orderDao.saveOrder(new Order("a1245",new Date(),new BigDecimal(100),0,1));
    }

    @Test
    public void showOrders(){
        System.out.println(orderDao.showOrders(1));
    }

    @Test
    public void showDetails(){
        System.out.println(orderDao.showDetails("16100377920141"));
    }

    @Test
    public void showOrdersM(){
        System.out.println(orderDao.showOrdersM());
    }
}