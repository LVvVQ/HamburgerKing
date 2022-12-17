package com.hamburgerking.bean;

public class ResultInfo {
    private boolean flag; //后端返回结果正常为true，发生异常返回false
    private String msg;

    public ResultInfo() {
    }

    public ResultInfo(boolean flag, String msg) {
        this.flag = flag;
        this.msg = msg;
    }

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    @Override
    public String toString() {
        return "ResultInfo{" +
                "flag=" + flag +
                ", msg='" + msg + '\'' +
                '}';
    }
}
