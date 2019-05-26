package com.nasoft.util;

import java.util.Arrays;
import java.util.List;

public class Solution {
    public int Sum_Solution(int n) {
        int sum=0;
        for (int i=1; i<=n; i++) {
            sum += i;
        }
        return sum;
    }

    public static void main (String[] args) {
        Solution solu = new Solution();
        System.out.println(solu.Sum_Solution(5));
       /* int[] a = {3,5,9,7,2};
        Arrays.sort(a); // 排序
        // 打印数组
        for (int item : a) 
            System.out.print(item + " ");
        System.out.println();
        // 二分查找
        int ind1 = Arrays.binarySearch(a, 2);
        int ind2 = Arrays.binarySearch(a, 4);
        int ind3 = Arrays.binarySearch(a, 1, 3, 5);
        System.out.println("2的查找位置：" + ind1);
        System.out.println("4的查找位置：" + ind2);
        System.out.println("5的查找位置：" + ind3);*/
        int[][] a1 = {{1,2,3}, {4,5,6}, {7,8,9}};
        int[] a = {1,2,3};
        for (int[] item : a1){
        	for (int item1 : item)
			System.out.print(item1 + ",");
        } 
            
        String b = "你";
        String c = "你";
        String d = new String("你");
        StringBuffer sb = new StringBuffer("你");
        StringBuffer sb1 = new StringBuffer("你");
        System.out.println(sb);
        System.out.println(b);
        System.out.println("b和c比较:"+b.equals(c));
        System.out.println("sb和d比较:"+sb.equals(d));
        System.out.println(sb1.equals(sb));
        System.out.println(b.contentEquals(sb));
        // 字符串
       /* String[] strArray = {"aa", "bc", "ab", "cd"};
        Arrays.sort(strArray);
        int ind4 = Arrays.binarySearch(strArray, "bc");
        System.out.println("'bc'的查找位置是：" + ind4);
        int[][] a3 = {{1,2,3}, {4,5,6}, {7,8,9}};
     // 遍历二维数组 for
     for (int i=0; i<a3.length; i++) {
         for (int j=0; j<a3[i].length; j++)
             if (j == a3[i].length-1)
                 System.out.print(a3[i][j]);
             else
                 System.out.print(a3[i][j] + ", ");
         System.out.println();
     }*/
        }
    }
