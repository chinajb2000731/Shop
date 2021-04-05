package com.toolers.shop.untils;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {

//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

    // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
    public static String app_id ="2021000117629951";

    // 商户私钥，您的PKCS8格式RSA2私钥
    /*merchant_private_key*/
    public static String merchant_private_key = "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCOVpEtMU5V9gA9vfG9GQw7iALfgxI430z0nV30XnpfQCbB0FNJjA12GWvpEY8X51lF52kQ5DhJU/lyqxfawezQeVSAYLPib3rveOJ/FLK7h8beNlC8jSppiqfBdZ8TiYPW1TRitZS2thzDIcGQv52utz0OVAxg0ZB4IZYnthCLVQDIlSUyVxOa7LDNOtoaMlVYSxGX0fIxRCkVOlxw1WzSUYESQxUMqO4xHXBVt8ov2+zxp+qh1s6RC+R3mhZdkmM0rP3DE2ZSkr6VfYNGdhGemT8vmkgs6NKUHnBUMfGUMHfRtPcTucVklAP8fngHoo3UZikLCuViidbl/ypHU4WzAgMBAAECggEAFptnOX9QStTkmunVQEx/JeFnW2qs9T16MovgBVUQKJq+zR+yascEyFInUoBIcup6wmCLznQBAJyGzRChnEwauc3bfvxc9cTxCKHxj2+RJ7nb+yUzU480QkkUdeShnG/F8dQxGtBuS0rHbLKq1LuqZrqRxvnQcXw3bu0etTX0kLx1oDqrw9GOPB6fph4nk9KCnBvPX83x/VTsBAaZtM+75ccbYa6dXBXj/7xnr6lzy+gzpXLY06Gi99Uo+m2fntmt/CxX6YOSPGcgXeBz3Z3unee4Z49+0vIbeRKN/vOotLKrRogRsdRENJmetrl7GS1jf2Lx+Xd94yECUVuuVPwLuQKBgQDQlQ6w24D+vQ/P2GygAE/yn38bKDmvVrB2DMllEiF7pE8MwLICXNXulLeIns7qu1maKZzWYTTrdZcKrTS/61EIskEZw0eHoxsPOF85+yYFoBcQm9rex38/L+H9a1uUu82q2H04ggwUDZ0tuXnokHFhC/6NIZ9i5X6zLVwn2XjmFQKBgQCuskaiBeOhrQW8OBNFJPle2GoXQQF0hu9BMCuRfbSKHiu+c09U+ayUlipzaEdmvQmA52nIwuunmkKu9TMKorkOnZ1MTmltAxpnvuJhpAEFL4QqnE8Uu35Sp8uiUIKN7SJXFsvFT3KRUkuty8fkIHxkRcyVYly+mxNRgaT1xXk2pwKBgCxhCpcmnPOWVl7qtXH1nw0IUor8rAlacIEth0wx513fP9J+zWEjT4FLsyEmaPAYnJ/oaq5SUGgoxNJIuAh9kOhAxQkuO3HoikFaxSgY/6YCweWOw6rS14giL/szdHDY5JGNLldvlBJQMzkfVYjd8sGrQ6XTmY35NlP5Orpf0xFhAoGAKJpG0GGOBoWwT46469ksHF8wSTdSn0K9WOlZNveAfpmEkT87sQRWmDJOq4QRFE/bZZpje8XR/6Ja3U8gDdjEKiF37cRLvIp8GKDE/OyhUBM7JKwvtSHeuldFfPQ5Y8M5uAQUWEee2SfHbx1t2Be00Zlnc1DpPWPNmaQIMxcylQECgYAC87u598EgwfFiKhhNqdZ9awFvhRaOh96jn5+FTiMeP4H7cttaxtgbyW4EwBPZDe9QlVasuoH59GDhCmrRPEr2UZ4MJy7lTqe0hywl9LphYMqwvMYkMITDqTUqmQGtGWB0NPe7hCBHVj2o6y2zs2+HYKKntNRy4UjVdIvGyVEtKQ==";
    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAngEITEMOEL5fZ/9DdHsYr1ycayoYHsksjLpyY8JKnbJbA4YLmd4U/LMUvAAhe1x3GkoE/N3OGphfHxwa2ro5HWUwTc5oGom3GmtBCjV+2Dc5Q4JGejjyS6Db5uUcHD1zM/otcP+dtmXhn6ySG7PzrboNfrgPZaakVnVmPJRzfvGqfAHbCB717A9Tp+qtbRLvM5d/k+fL8EgMDzjz9Hp9dF15Fg0qJdecPMeCPicpnPRJN7iAmL3lGCPt2YxgzOLd7bPctw1aYdAUVcgxjed/Cs2d9sxpAYLR9G+gjMDJkkOFMsy5Xv621Um0dbfyUlcgawbop5Dfyt7J0E6MW/mEuwIDAQAB";
    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "http://localhost:8088/index.jsp";

    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String return_url = "http://localhost:8088/index.jsp";

    // 签名方式
    public static String sign_type = "RSA2";

    // 字符编码格式
    public static String charset = "utf-8";

    // 支付宝网关
    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

    // 支付宝网关
    public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /**
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

