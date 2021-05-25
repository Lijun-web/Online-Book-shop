package com.atguigu.service;

import com.atguigu.pojo.Cart;
import com.atguigu.pojo.Order;
import com.atguigu.pojo.OrderItem;

import java.util.List;

public interface OrderService {

    public String createOrder(Cart cart, Integer userId);

    List<Order> showOrders(Integer userId);

    List<OrderItem> showDetails(String orderId);

    List<Order> showOrdersM();
}
