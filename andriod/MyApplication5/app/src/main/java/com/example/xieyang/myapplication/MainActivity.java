package com.example.xieyang.myapplication;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.Toast;

import com.example.xieyang.myapplication.view.CircleMenuLayout;
import com.example.xieyang.myapplication.view.LuckyPanView;


public class MainActivity extends Activity {

//    private LuckyPanView mLuckyPanView;
//    private ImageView mStartBtn;
//
//    @Override
//    protected void onCreate(Bundle savedInstanceState) {
//        super.onCreate(savedInstanceState);
//        setContentView(R.layout.activity_main);
//
//        mLuckyPanView = (LuckyPanView) findViewById(R.id.id_luckypan);
//        mStartBtn = (ImageView) findViewById(R.id.id_start_btn);
//
//        mStartBtn.setOnClickListener(new OnClickListener()
//        {
//            @Override
//            public void onClick(View v)
//            {
//                if (!mLuckyPanView.isStart())
//                {
//                    mStartBtn.setImageResource(R.drawable.stop);
//                    mLuckyPanView.luckyStart(1);
//                } else {
//                    if (!mLuckyPanView.isShouldEnd())  {
//                        mStartBtn.setImageResource(R.drawable.start);
//                        String str = mLuckyPanView.luckyEnd();
//
//                        Toast tst = Toast.makeText(MainActivity.this, "tell:you are " + str, Toast.LENGTH_SHORT);
//                        tst.show();
//                    }
//                }
//            }
//        });
//
//    }

    private CircleMenuLayout mCircleMenuLayout;

    private String[] mItemTexts = new String[] { "称骨算命 ", "求事业", "五行算命",
            "观音灵签", "求姻缘", "八字算命" };
    private int[] mItemImgs = new int[] { R.drawable.home_mbank_1_normal,
            R.drawable.home_mbank_2_normal, R.drawable.home_mbank_3_normal,
            R.drawable.home_mbank_4_normal, R.drawable.home_mbank_5_normal,
            R.drawable.home_mbank_6_normal };

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);

        //自已切换布局文件看效果
        setContentView(R.layout.activity_main);
//		setContentView(R.layout.activity_main);

        mCircleMenuLayout = (CircleMenuLayout) findViewById(R.id.id_menulayout);
        mCircleMenuLayout.setMenuItemIconsAndTexts(mItemImgs, mItemTexts);



        mCircleMenuLayout.setOnMenuItemClickListener(new CircleMenuLayout.OnMenuItemClickListener()
        {

            @Override
            public void itemClick(View view, int pos)
            {

                if(pos == 3) {
                    Intent intent = new Intent(MainActivity.this, LingqianActivity.class);
                    startActivity(intent);
                } else if(pos == 0) {
                    Intent intent = new Intent(MainActivity.this, ChengguActivity.class);
                    startActivity(intent);
                } else {
                    Toast.makeText(MainActivity.this, mItemTexts[pos] + ", 功能正在研发中，尽请期待。。。",
                            Toast.LENGTH_SHORT).show();

                }


            }

            @Override
            public void itemCenterClick(View view)
            {
//                Toast.makeText(MainActivity.this,
//                        "功能正在研发中，尽请期待。。。  ",
//                        Toast.LENGTH_SHORT).show();

                Intent intent = new Intent(MainActivity.this, BaziActivity.class);
                startActivity(intent);

            }
        });

    }

}
