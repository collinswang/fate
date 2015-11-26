package com.example.xieyang.myapplication;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.PersistableBundle;
import android.widget.TextView;

/**
 * Created by xieyang on 11-13.
 */
public class ResultView extends Activity {


    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.result);

        Intent intent = getIntent();
        String str = intent.getStringExtra("res");

        TextView txt = (TextView) findViewById(R.id.res);
        txt.setText(str);

    }
}
