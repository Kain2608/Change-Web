package com.sportpj.sportpj.Model;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Entity
@Table(name = "rackets")
public class RacketModel extends ProductModel {

    private Integer stock;    
    private String weight;       
    private String gripSize;     
    private String tension;      
    private String balancePoint; 
    private String stiffness;    
    private String length;       

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public String getGripSize() {
        return gripSize;
    }

    public void setGripSize(String gripSize) {
        this.gripSize = gripSize;
    }

    public String getTension() {
        return tension;
    }

    public void setTension(String tension) {
        this.tension = tension;
    }

    public String getBalancePoint() {
        return balancePoint;
    }

    public void setBalancePoint(String balancePoint) {
        this.balancePoint = balancePoint;
    }

    public String getStiffness() {
        return stiffness;
    }

    public void setStiffness(String stiffness) {
        this.stiffness = stiffness;
    }

    public String getLength() {
        return length;
    }

    public void setLength(String length) {
        this.length = length;
    }
}