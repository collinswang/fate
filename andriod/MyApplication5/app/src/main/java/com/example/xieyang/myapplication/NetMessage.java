package com.example.xieyang.myapplication;

import android.util.Log;

import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.HttpResponse;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.HttpParams;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URLEncoder;


import org.apache.http.util.EntityUtils;
import org.xmlpull.v1.XmlPullParser;

/**
 * Created by xieyang_ on 2015/11/16.
 */
public class NetMessage {



    public static void sendMsg(String msg) throws Exception {

        String url = "http://172.16.8.16:99/greeting.htm";



        HttpResponse httpResponse = null;

        String str = URLEncoder.encode(msg, "utf-8");
        url += "?msg=" + str;
        HttpGet httpGet = new HttpGet(url);
        httpResponse = new DefaultHttpClient().execute(httpGet);
        if (httpResponse.getStatusLine().getStatusCode() == 200)
        {

            String result = EntityUtils.toString(httpResponse
                    .getEntity());
            Log.v("nidaye", result);
        }

    }
}
