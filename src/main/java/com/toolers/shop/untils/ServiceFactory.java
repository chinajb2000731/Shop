package com.toolers.shop.untils;

public class ServiceFactory {

    //传递zs对象得到ls对象的过程
    public static  Object getService(Object service)
    {
        return  new TransactionInvocationHandler(service).getProxy();
    }
}
