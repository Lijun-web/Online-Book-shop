package com.atguigu.dao;

import com.atguigu.pojo.Order;
import com.atguigu.pojo.OrderItem;

import java.util.List;

public interface OrderDao {

    public int saveOrder(Order order);

    List<Order> showOrders(Integer userId);

    List<OrderItem> showDetails(String orderId);

    List<Order> showOrdersM();
}
