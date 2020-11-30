//package com.example.zsh_demo;
//
//import android.content.Context;
//import android.view.Gravity;
//import android.view.View;
//
//import com.dovar.dtoast.DToast;
//
//class ToastUtil {
//
//    /**
//     * 通过setView()设置自定义的Toast布局
//     */
//    public static void showCustom(Context mContext, String msg) {
//        if (mContext == null || msg == null) return;
//        DToast.make(mContext.getApplicationContext())
//                .setView(View.inflate(mContext.getApplicationContext(), R.layout.toast, null))
//                .setText(R.id.tv_content, msg)
//                .setGravity(Gravity.BOTTOM | Gravity.CENTER, 0, UIUtils.dp2px(100))
//                .setDuration(DToast.DURATION_SHORT)
//                .show();
//    }
//
//    public static void showCustom(String msg) {
//        if (msg == null) return;
//        DToast.make(XZLApplication.getContext())
//                .setView(View.inflate(XZLApplication.getContext(), R.layout.toast, null))
//                .setText(R.id.tv_content, msg)
//                .setGravity(Gravity.BOTTOM | Gravity.CENTER, 0, UIUtils.dp2px(100))
//                .setDuration(DToast.DURATION_SHORT)
//                .show();
//    }
//
//    public static void showCustomLong(String msg) {
//        if (msg == null) return;
//        DToast.make(XZLApplication.getContext())
//                .setView(View.inflate(XZLApplication.getContext(), R.layout.toast, null))
//                .setText(R.id.tv_content, msg)
//                .setGravity(Gravity.BOTTOM | Gravity.CENTER, 0, UIUtils.dp2px(100))
//                .setDuration(DToast.DURATION_LONG)
//                .show();
//    }
//
//
//    //退出APP时调用
//    public static void cancelAll() {
//        DToast.cancel();
//    }
//}
