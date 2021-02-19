package com.toolers.shop.untils;

import org.apache.ibatis.session.SqlSession;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

//动态代理
public class TransactionInvocationHandler implements InvocationHandler {


    private  Object target;
    public TransactionInvocationHandler(Object target)
    {
        this.target=target;
    }
    //代理类的业务方法
    //ls的表白方法

    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        SqlSession session=null;
        Object obj=null;
        try {


            session=SqlSessionUtil.getSqlSession();
            //处理业务逻辑
            //method.invoke;zs的表白方法
            obj=method.invoke(target,args);
            //处理业务；逻辑完毕后，提交事务
            session.commit();
        }catch (Exception e)
        {

            session.rollback();
            e.printStackTrace();
            //处理的是什么异常，继续往上抛什么异常
            throw e.getCause();
        }finally {
            SqlSessionUtil.myclose(session);
        }


        return obj;
    }
    //取得ls对象
    public Object getProxy()
    {
        return Proxy.newProxyInstance(target.getClass().getClassLoader(),target.getClass().getInterfaces(),this);
    }
}
