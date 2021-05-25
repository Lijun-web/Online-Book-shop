package com.atguigu.test;

import com.atguigu.pojo.Cart;
import com.atguigu.pojo.CartItem;
import com.atguigu.service.OrderService;
import com.atguigu.service.impl.OrderServiceImpl;
import org.junit.Test;

import java.math.BigDecimal;

import static org.junit.Assert.*;

public class OrderServiceTest {

    OrderService orderService = new OrderServiceImpl();

    @Test
    public void createOrder() {
        Cart cart = new Cart();
        cart.addItem(new CartItem(1,"sa",1,new BigDecimal(100),new BigDecimal(100)));
        cart.addItem(new CartItem(1,"sa",1,new BigDecimal(100),new BigDecimal(100)));
        System.out.println(orderService.createOrder(cart, 1));
    }

    @Test
    public void showOders(){
        System.out.println(orderService.showOrders(1));
    }

    @Test
    public void showDetails(){
        System.out.println(orderService.showDetails("16100377920141"));
    }

    @Test
    public void showDetailsM(){
        System.out.println(orderService.showOrdersM());
    }
}