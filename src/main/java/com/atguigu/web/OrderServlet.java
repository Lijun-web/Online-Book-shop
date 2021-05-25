package com.atguigu.web;

import com.atguigu.pojo.Cart;
import com.atguigu.pojo.Order;
import com.atguigu.pojo.OrderItem;
import com.atguigu.pojo.User;
import com.atguigu.service.OrderService;
import com.atguigu.service.impl.OrderServiceImpl;
import com.atguigu.utils.JdbcUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class OrderServlet extends BaseServlet{

    OrderService orderService = new OrderServiceImpl();

    protected void showOrdersM(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //调用OrderService中的showOrders方法查询所有订单Orders
        List<Order> orders = orderService.showOrdersM();
        System.out.println(orders);
        //将Orders保存到request域中
        req.setAttribute("ordersM", orders);
        //请求转发到/pages/manager/order_manager.jsp页面
        req.getRequestDispatcher("/pages/manager/order_manager.jsp").forward(req,resp);

    }

    protected void showDetails(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //获取参数orderId
        String orderId = req.getParameter("orderId");
        //调用OrderService中的showDetails方法获取OrderItems
        List<OrderItem> orderItems = orderService.showDetails(orderId);
        //保存OrderItems到Request域中
        req.setAttribute("orderItems", orderItems);
        //转发到/pages/order/order_details.jsp页面
        req.getRequestDispatcher("/pages/order/order_details.jsp").forward(req,resp);
    }

    protected void showDetailsM(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //获取参数orderId
        String orderId = req.getParameter("orderId");
        //调用OrderService中的showDetails方法获取OrderItems
        List<OrderItem> orderItems = orderService.showDetails(orderId);
        //保存OrderItems到Request域中
        req.setAttribute("orderItems", orderItems);
        //转发到/pages/order/order_details.jsp页面
        req.getRequestDispatcher("/pages/order/order_details_manager.jsp").forward(req,resp);
    }

    protected void showOrders(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //从Session域中获取UserId信息
        User user = (User) req.getSession().getAttribute("user");
        Integer userId = user.getId();
        System.out.println(userId);
        //调用OrderService中的showOrders方法查询所有订单Orders
        List<Order> orders = orderService.showOrders(userId);
        System.out.println(orders);
        //将Orders保存到request域中
        req.setAttribute("orders", orders);
        //请求转发到/pages/order/order.jsp页面
        req.getRequestDispatcher("/pages/order/order.jsp").forward(req,resp);

    }


    protected void createOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //从Session域中获取Cart对象和UserId
        Cart cart = (Cart) req.getSession().getAttribute("cart");
        User user = (User) req.getSession().getAttribute("user");
        if(user != null){
            Integer userId = user.getId();
            //调用orderService.createOrder(cart,userId)生成订单
            String orderId = orderService.createOrder(cart,userId);
            req.getSession().setAttribute("orderId", orderId);
            //请求转发到/pages/cart/checkout.jsp页面
            resp.sendRedirect(req.getContextPath()+"/pages/cart/checkout.jsp");
        } else {
            req.getRequestDispatcher("/pages/user/login.jsp").forward(req,resp);
        }



    }

}
