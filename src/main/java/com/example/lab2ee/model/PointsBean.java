package com.example.lab2ee.model;

public class PointsBean {
    private double x;
    private double y;
    private double r;
    private boolean isInArea;
    private String currentTime;
    private long executionTime;

    public PointsBean() {
    }


    public double getX() {
        return x;
    }

    public double getY() {
        return y;
    }

    public void setX(double x) {
        this.x = x;
    }

    public void setY(double y) {
        this.y = y;
    }

    public void setR(double r) {
        this.r = r;
    }

    public void setInArea(boolean inArea) {
        isInArea = inArea;
    }

    public void setCurrentTime(String currentTime) {
        this.currentTime = currentTime;
    }

    public void setExecutionTime(long executionTime) {
        this.executionTime = executionTime;
    }

    public double getR() {
        return r;
    }

    public boolean isInArea() {
        return isInArea;
    }

    public String getCurrentTime() {
        return currentTime;
    }

    public long getExecutionTime() {
        return executionTime;
    }
}
