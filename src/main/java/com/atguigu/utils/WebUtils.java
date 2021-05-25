package com.atguigu.utils;

import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

public class WebUtils {

    public static <T> T copyParamToBean(Map value, T bean){

        try {
            BeanUtils.populate(bean, value);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        return bean;

    }

    /**
     * 将字符串转换成为int类型的数据
     * @param strInt
     * @param defaultvalue
     * @return
     */
    public static int parseInt(String strInt, int defaultvalue){
        try {
            return Integer.parseInt(strInt);
        } catch (NumberFormatException e) {
           // e.printStackTrace();
        }

        return defaultvalue;
    }
}
