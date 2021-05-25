package com.atguigu.web;

import com.atguigu.pojo.Book;
import com.atguigu.pojo.Cart;
import com.atguigu.pojo.CartItem;
import com.atguigu.service.BookService;
import com.atguigu.service.impl.BookServiceImpl;
import com.atguigu.utils.WebUtils;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class CartServlet extends BaseServlet{

    private BookService bookService = new BookServiceImpl();

    /**
     * 修改商品数量信息
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void updateCount(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取请求参数：商品编号和商品数量
        int id = WebUtils.parseInt(req.getParameter("id"), 0);
        int count = WebUtils.parseInt(req.getParameter("count"), 1);
        //获取Cart购物车对象
        Cart cart = (Cart) req.getSession().getAttribute("cart");
        if(cart != null){

            //调用cart.updateCount(id, count)更新商品项信息
            cart.updateCount(id, count);
            //重定向回原来页面
            resp.sendRedirect(req.getHeader("Referer"));
        }

    }

    /**
     * 清空购物车
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void clear(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取购物车对象
        Cart cart = (Cart) req.getSession().getAttribute("cart");
        if(cart != null){
            //调用cart.clear()方法清空购物车
            cart.clear();
            //重定向回原来页面
            resp.sendRedirect(req.getHeader("Referer"));
        }



    }

    /**
     * 删除商品项
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void deleteItem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取商品编号
        int id = WebUtils.parseInt(req.getParameter("id"),0);
        //获取购物车对象
        Cart cart = (Cart) req.getSession().getAttribute("cart");
        if(cart != null){
            //调用cart.delteItem删除商品项
            cart.deleteItem(id);
            //重定向回原来购物车展示页面
            resp.sendRedirect(req.getHeader("Referer"));
        }

    }

    /**
     * 加入购物车
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void addItem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //1 获取请求的参数：商品编号
        int id = WebUtils.parseInt(req.getParameter("id"),0);
        //2 调用bookService.queryBookById:Book得到图书的信息
        Book book = bookService.queryBookById(id);
        //3 把图书信息转换成为CartItem商品项信息
        CartItem cartItem = new CartItem(book.getId(),book.getName(),1,book.getPrice(),book.getPrice());
        //4 调用Cart.addItem(CartItem)添加商品
        Cart cart = (Cart) req.getSession().getAttribute("cart");
        if(cart == null){

            cart = new Cart();
            req.getSession().setAttribute("cart",cart);
        }
        cart.addItem(cartItem);
        //将最后一个添加商品项的名称保存到Session域中
        req.getSession().setAttribute("lastName",cartItem.getName());
        //5 重定向回原来商品列表页面
        resp.sendRedirect(req.getHeader("Referer"));

    }

    protected void ajaxAddItem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //1 获取请求的参数：商品编号
        int id = WebUtils.parseInt(req.getParameter("id"),0);
        //2 调用bookService.queryBookById:Book得到图书的信息
        Book book = bookService.queryBookById(id);
        //3 把图书信息转换成为CartItem商品项信息
        CartItem cartItem = new CartItem(book.getId(),book.getName(),1,book.getPrice(),book.getPrice());
        //4 调用Cart.addItem(CartItem)添加商品
        Cart cart = (Cart) req.getSession().getAttribute("cart");
        if(cart == null){

            cart = new Cart();
            req.getSession().setAttribute("cart",cart);
        }
        cart.addItem(cartItem);
        //将最后一个添加商品项的名称保存到Session域中
        req.getSession().setAttribute("lastName",cartItem.getName());
        //5 保存商品数和最后一件添加的商品名称
        Map<String,Object> resultMap = new HashMap<>();
        resultMap.put("totalCount", cart.getTotalCount());
        resultMap.put("lastName", cartItem.getName());

        Gson gson = new Gson();
        String json = gson.toJson(resultMap);

        resp.getWriter().write(json);

    }
}
