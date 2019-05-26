package com.nasoft.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;

import javax.imageio.ImageIO;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

public class FontImage
{

	 /**图片格式：JPG*/
	 private static final String PICTRUE_FORMATE_JPG = "jpg";

	
	  /* 获取字符长度，一个汉字作为 1 个字符, 一个英文字母作为 0.5 个字符
	  * @param text
	  * @return 字符长度，如：text="中国",返回 2；text="test",返回 2；text="中国ABC",返回 4.**/

	 public static int getLength(String text) {
	     int textLength = text.length();
	     int length = textLength;
	     for (int i = 0; i < textLength; i++) {
	         if (String.valueOf(text.charAt(i)).getBytes().length > 1) {
	             length++;
	         }
	     }
	     return (length % 2 == 0) ? length / 2 : length / 2 + 1;
	 }

	
	 public static void pressText(String pressText,String targetFile, String sourceImg,
             String fontName, int fontStyle, Color color, int fontSize, int x,
             int y) {
         try {
        	   
             File _file = new File(sourceImg);
             
             FileOutputStream out = new FileOutputStream(targetFile);
             JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
             
             InputStream is=new FileInputStream(_file);
             BufferedImage bi=ImageIO.read(is);
             Image src=(Image)bi;
//             Image src = ImageIO.read(_file);
             int wideth = src.getWidth(null);
             int height = src.getHeight(null);
             BufferedImage image = new BufferedImage(wideth, height,
                     BufferedImage.TYPE_INT_RGB);
             Graphics g = image.createGraphics();
             g.drawImage(src, 0, 0, wideth, height, null);
             // String s="www.qhd.com.cn";
             g.setColor(Color.BLACK);
             g.setFont(new Font(fontName, fontStyle, fontSize));
 
            g.drawString(pressText, wideth - fontSize - x, height - fontSize
                     / 2 - y);
             g.dispose();
//             FileOutputStream out = new FileOutputStream(targetImg);
//             JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
             encoder.encode(image);
             out.close();

         } catch (Exception e) {
             System.out.println(e);
         }
     }
	 /**
	  * 
	  * @param pressText 图片打印文字数组
	  * @param targetFile 目标路径
	  * @param sourceImg 源文件
	  * @param fontName 字体类型 "宋体",
	  * @param fontStyle 字体类别 Font.BOLD, 
	  * @param color  Color.BLACK,
	  * @param fontSize 40
	  */
	 public static void pressTextGroup(String pressText[],String targetFile, String sourceImg,
             String fontName, int fontStyle, int fontSize,int offsetX[],int offsetY[]) {
         try {
        	   
             File _file = new File(sourceImg);
             
             FileOutputStream out = new FileOutputStream(targetFile);
             JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
             
             InputStream is=new FileInputStream(_file);
             BufferedImage bi=ImageIO.read(is);
             Image src=(Image)bi;
//             Image src = ImageIO.read(_file);
             int wideth = src.getWidth(null);
             int height = src.getHeight(null);
             BufferedImage image = new BufferedImage(wideth, height,
                     BufferedImage.TYPE_INT_RGB);
             Graphics g = image.createGraphics();
             g.drawImage(src, 0, 0, wideth, height, null);
             // String s="www.qhd.com.cn";
             g.setColor(Color.BLACK);
             g.setFont(new Font(fontName, fontStyle, fontSize));
             //与图片打印的字对应的x y坐标
             for(int i=0;i<pressText.length;i++){
            	//往图片上写字
            	 g.drawString(pressText[i], offsetX[i],offsetY[i]);
             }
             g.dispose();
//             FileOutputStream out = new FileOutputStream(targetImg);
//             JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
             encoder.encode(image);
             out.close();

         } catch (Exception e) {
        	 e.printStackTrace();
             System.out.println(e);
         }
     }
	 
	 public static void main(String[] args) throws IOException {
//		         pressImage("C://pic//jpg", "C://bb.jpg", 5000, 5000, 0f);
		 String sourceFilePath="C://Program Files//tomcat-7.0.59//webapps//NetAboutCar//static//images//cert.jpg";
//		 String sourceFilePath="C://Users//liqin//Desktop//cert.jpg";
		 Date date=new Date();
		 
		 String fileName="drvCert_42068319940624181X.jpg";
		 String targetFilePath="C://Program Files//tomcat-7.0.59//webapps//NetAboutCar//static//images//"+fileName;
//		 String targetFilePath="C://Users//liqin//Desktop//"+fileName;
		 String text[]={"XXX","北京市海淀区","北京市海淀区清华东路西口","2011年02月02日至2014年03月03日"};
		 int offsetX[]={215,215,215,165};
         int offsetY[]={230,250,285,355};
		 pressTextGroup(text ,targetFilePath,sourceFilePath, "宋体", Font.BOLD,13,offsetX,offsetY);
//		         resize("C://pic//4.jpg", 1000, 500, true);
		 
     }
}