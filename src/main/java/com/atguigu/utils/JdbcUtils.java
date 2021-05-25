package com.atguigu.utils;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.DruidDataSourceFactory;

import java.io.FileReader;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

public class JdbcUtils {

    private static DruidDataSource dataSource;
    private static ThreadLocal<Connection> conns = new ThreadLocal<>();

    static {




        try {
            Properties properties = new Properties();
            //读取 jdbc.properties属性配置文件
            InputStream inputStream = JdbcUtils.class.getClassLoader().getResourceAsStream("jdbc.properties");

            //从流中加载数据
            properties.load(inputStream);
            //创建数据库连接池
            dataSource = (DruidDataSource) DruidDataSourceFactory.createDataSource(properties);


        } catch (Exception e) {
            e.printStackTrace();
        }
    }




    /**
     * 获取数据库连接池中的连接
     * @return 如果返回null,说明获取连接失败，有值就是获取成功
     */
    public static Connection getConnection(){

        Connection conn = conns.get();

        if(conn == null){
            try {
                conn = dataSource.getConnection();
                conns.set(conn); //保存到ThreadLocal对象中
                conn.setAutoCommit(false);//设置为手动管理事务
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }

        return conn;

    }

    /**
     * 提交事务并关闭释放连接
     */
    public static void commitAndClose(){
        Connection connection = conns.get();
        if(connection != null){
            try {
                connection.commit();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                try {
                    connection.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
        }
        //一定要执行remove()操作
        conns.remove();

    }

    /**
     * 回滚事务并关闭释放连接
     */
    public static void rollbackAndClose(){

        Connection connection = conns.get();
        if(connection != null){
            try {
                connection.rollback();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                try {
                    connection.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
        }
        //一定要执行remove()操作
        conns.remove();

    }

//    public static void close(Connection conn){
//
//        if(conn != null){
//            try {
//                conn.close();
//            } catch (SQLException throwables) {
//                throwables.printStackTrace();
//            }
//        }

//    }
}
