package com.www.Util;

import org.springframework.stereotype.Component;

import java.text.DecimalFormat;

@Component
public class UtilClass {
    public String formatVND(double money) {
        DecimalFormat formatter = new DecimalFormat("###,###,###");
        return formatter.format(money)+" VND";
    }

}
