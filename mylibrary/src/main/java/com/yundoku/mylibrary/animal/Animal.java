package com.yundoku.mylibrary.animal;

/**
 * Created by Widsom Zhang on 2017/4/8.
 */

public class Animal {
    private String name;
    private String category;
    private int age;

    public Animal() {
    }

    public Animal(String name) {
        this.name = name;
    }

    public Animal(String name, String category) {
        this.name = name;
        this.category = category;
    }

    public Animal(String name, String category, int age) {
        this.name = name;
        this.category = category;
        this.age = age;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getName() {

        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
