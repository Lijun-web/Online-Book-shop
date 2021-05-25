package com.atguigu.test;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

public class UserServletTest {

    public void login(){
        System.out.println("这是login（）方法调用了");
    }

    public void regist(){
        System.out.println("这是regist（）方法调用了");
    }

    public static void main(String[] args) {
        String action = "login";
        try {
            Method declaredMethod = UserServletTest.class.getDeclaredMethod(action);

            declaredMethod.invoke(new UserServletTest());

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
