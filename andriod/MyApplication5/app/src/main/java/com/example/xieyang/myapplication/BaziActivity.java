package com.example.xieyang.myapplication;

import android.app.DatePickerDialog;
import android.app.Dialog;
import android.app.TimePickerDialog;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.view.View;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.TimePicker;
import android.widget.Toast;

import com.example.xieyang.myapplication.entity.Birthday;
import com.example.xieyang.myapplication.util.ChengGuHelper;
import com.example.xieyang.myapplication.util.LunarCalendar;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.Calendar;

/**
 * Created by xieyang on 11-3.
 */
public class BaziActivity extends FragmentActivity {

    private EditText name;
    private EditText phone;
    private EditText dateBtn = null;
    private EditText timeBtn = null;

    private final static int DATE_DIALOG = 0;
    private final static int TIME_DIALOG = 1;
    private Calendar c = null;
    private Dialog dialog;




    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.bazi);

        Button btn1 = (Button) findViewById(R.id.btn1);

        name = (EditText) findViewById(R.id.name);
        phone = (EditText) findViewById(R.id.iphone);

        dateBtn = (EditText) findViewById(R.id.datetxt);
        timeBtn = (EditText) findViewById(R.id.timetxt);

        TextView showInfo = (TextView) findViewById(R.id.showToday);
        LunarCalendar lunarC = new LunarCalendar();

        showInfo.setText(lunarC.getTodayInfo());


        btn1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String strName = name.getText().toString();
                String strPhone = phone.getText().toString();
                String date = dateBtn.getText().toString();
                String time = timeBtn.getText().toString();
                String msg = "";
                if (!strName.equals("")) {
                    msg += "你的名字是:" + name;
                } else {
                    name.requestFocus();
                    Toast tst = Toast.makeText(BaziActivity.this, "请点击输入名字" + strPhone, Toast.LENGTH_SHORT);
                    tst.show();
                    return;
                }
                if (!date.contains("-")) {

                    dateBtn.requestFocus();
                    Toast tst = Toast.makeText(BaziActivity.this, "请点击选择日期" + strPhone, Toast.LENGTH_SHORT);
                    tst.show();

                    return;
                }

                if (!time.contains(":")) {

                    timeBtn.requestFocus();

                    Toast tst = Toast.makeText(BaziActivity.this, "请点击选择时间" + strPhone, Toast.LENGTH_SHORT);
                    tst.show();

                    return;
                }


                if (dialog != null) {
                    dialog.dismiss();
                }
                Intent intent = new Intent(BaziActivity.this, ResultView.class);

                String srcDate = date + " " + time;

                Birthday birth = new Birthday(srcDate);
                LunarCalendar lunarC = new LunarCalendar(birth);


                String str =  "出生农历时间 " + lunarC.chineseDateString ;
                str += "\n太阳历时间是:" + lunarC.get(Calendar.YEAR) + "/" + (1 + lunarC.get(Calendar.MONTH)) + "/" + lunarC.get(Calendar.DAY_OF_MONTH);
                str += "\n初始日期:" + srcDate + "!";

                str += "\n八字 " + lunarC.chineseYearName + " 年 " + lunarC.chineseMonthName + " 月 " + lunarC.chineseDayName + " 日 "  + lunarC.chineseHourName;


//                lunarC = new LunarCalendar();
//                 str += "\n\n\n" + lunarC.getTodayInfo();

                intent.putExtra("res", str);

                startActivity(intent);

            }
        });

        dateBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                c = Calendar.getInstance();
                dialog = new DatePickerDialog(
                        BaziActivity.this,
                        new DatePickerDialog.OnDateSetListener() {
                            public void onDateSet(DatePicker dp, int year, int month, int dayOfMonth) {
                                dateBtn.setText(year + "-" + (month + 1) + "-" + dayOfMonth);
                            }
                        },
                        c.get(Calendar.YEAR), // 传入年份
                        c.get(Calendar.MONTH), // 传入月份
                        c.get(Calendar.DAY_OF_MONTH) // 传入天数
                );
                dialog.show();
            }
        });

        timeBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                c = Calendar.getInstance();
                dialog = new TimePickerDialog(
                        BaziActivity.this,
                        new TimePickerDialog.OnTimeSetListener() {
                            public void onTimeSet(TimePicker view, int hourOfDay, int minute) {
                                timeBtn.setText(hourOfDay + ":" + minute);
                            }
                        },
                        c.get(Calendar.HOUR_OF_DAY),
                        c.get(Calendar.MINUTE),
                        false
                );
                dialog.show();
            }
        });

    }


//    public void showDatePickerDialog(View v) {
//        newFragment.show(getSupportFragmentManager(), "datePicker");
//    }

}

