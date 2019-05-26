package com.nasoft.util;
/**
 * List索引
 */
import java.util.ArrayList;
import java.util.List;
public class CollectionDemo2 {
    public static void main(String[] args) {
        String a="a", b="b", c="c", d="d", apple="apple";
        List<String> list = new ArrayList<String>();
        list.add(a);
        list.add(apple);
        list.add(b);
        list.add(apple);
        list.add(c);
        list.add(apple);
        list.add(d);
        System.out.println(list);
        System.out.println("apple第一次出现的索引位置是：" + list.indexOf(apple));
        System.out.println("apple最后一次出现的索引位置是：" + list.lastIndexOf(apple));
        System.out.println("b第一次出现的索引位置是：" + list.indexOf(b));
        System.out.println("b最后一次出现的索引位置是：" + list.lastIndexOf(b));
    }
}