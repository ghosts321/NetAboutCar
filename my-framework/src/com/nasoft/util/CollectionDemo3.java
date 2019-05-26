package com.nasoft.util;
/**
 * set接口
 * 利用集合去除重复项
 */
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public class CollectionDemo3 {
    public static void main(String[] args) {
        List<String> list = new ArrayList<String>();
        list.add("apple");
        list.add("pear");
        list.add("banana");
        list.add("apple");
        Set<String> set = new HashSet<String>();
        set.addAll(list);
        Iterator<String> it = set.iterator();
        System.out.println("集合中的元素是：");
        while(it.hasNext()) {
            System.out.print(it.next() + "  ");
        }
    }
}