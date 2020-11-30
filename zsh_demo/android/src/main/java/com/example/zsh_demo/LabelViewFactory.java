package com.example.zsh_demo;

import android.content.Context;
import android.provider.CalendarContract;
import android.view.View;
import android.view.ViewTreeObserver;
import android.widget.TextView;

import java.util.Map;

import io.flutter.Log;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

import android.graphics.Color;
import android.view.Gravity;

public class LabelViewFactory extends PlatformViewFactory {

    private final BinaryMessenger messenger;

    LabelViewFactory(BinaryMessenger messenger) {
        super(StandardMessageCodec.INSTANCE);  //StandardMessageCodec
        this.messenger = messenger;
    }

    @Override
    public PlatformView create(Context context, int viewId, Object args) {
        Map<String, Object> params = (Map<String, Object>) args;
        return new AndroidLabelView(context, messenger, viewId, params);
    }
}

class AndroidLabelView implements PlatformView {

    private TextView mAndroidTextView;

    AndroidLabelView(Context context, BinaryMessenger messenger, int viewId,  Map<String, Object> params){

        mAndroidTextView = new TextView(context);

        String text = (String) params.get("text");
        if (text != null) {
            text = "android端TextView 参数"+text;
        } else {
            text = "android端TextView";
        }
        mAndroidTextView.setTextSize(30);
        mAndroidTextView.setTextColor(Color.parseColor("#000000"));
        mAndroidTextView.setGravity(Gravity.CENTER);

        mAndroidTextView.setText(text);
    }


    @Override
    public View getView() {

        return mAndroidTextView;
    }

    @Override
    public void dispose() {

    }
}