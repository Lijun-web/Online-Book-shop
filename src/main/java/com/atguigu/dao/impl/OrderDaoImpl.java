package com.atguigu.dao.impl;

import com.atguigu.dao.OrderDao;
import com.atguigu.pojo.Book;
import com.atguigu.pojo.Order;
import com.atguigu.pojo.OrderItem;

import java.util.List;

public class OrderDaoImpl extends BaseDao implements OrderDao {
    @Override
    public int saveOrder(Order order) {
        String sql = "insert into t_order(order_id, create_time, price, status,user_id) values(?,?,?,?,?)";
        return update(sql, order.getOrderId(), order.getCreateTime(), order.getPrice(), order.getStatus(), order.getUserId());
    }


    @Override
    public List<Order> showOrders(Integer userId) {
        String sql = "select `order_id` orderId, `create_time` createTime, `price` , `status` , `user_id` userId from t_order where user_id = ?";
        return queryForList(Order.class,sql,userId);
    }

    @Override
    public List<OrderItem> showDetails(String orderId) {
        String sql = "select `name`, `count`, `price` , `total_price` totalPrice, `order_id` orderId from t_order_item where order_id = ?";
        return queryForList(OrderItem.class,sql,orderId);
    }

    @Override
    public List<Order> showOrdersM() {
        String sql = "select `order_id` orderId, `create_time` createTime, `price` , `status` , `user_id` userId from t_order";
        return queryForList(Order.class,sql);
    }
}
