package com.example.xieyang.myapplication;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import com.example.xieyang.myapplication.results.LingqianResult;

/**
 * Created by xieyang on 11-13.
 */
public class LingqianActivity  extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.lingqian);

        Button btn = (Button) findViewById(R.id.btn_lin);

        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                int random=(int) (Math.random()*109+1);
                String result = LingqianResult.getResult(random);
                Intent intent = new Intent(LingqianActivity.this, ResultView.class);
                intent.putExtra("res",result);

                startActivity(intent);

            }
        });

    }
}
