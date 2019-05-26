package com.nasoft.SSM.base;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;  
import java.io.FileInputStream;  
import java.io.FileOutputStream;  
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.ArrayList;  
import java.util.Enumeration;

import org.apache.commons.logging.Log;  
import org.apache.commons.logging.LogFactory;  
import org.apache.tools.zip.ZipEntry;  
import org.apache.tools.zip.ZipFile;  
import org.apache.tools.zip.ZipOutputStream;  


public class ZipUtils {
	
	 /*  public static void main(String[] args) {  
		    ZipUtils z = new ZipUtils();  
	        ArrayList<String> a = z.Ectract("C:\\opt\\images.zip", "C:\\opt\\aaaa\\"); // 返回解压缩出来的文件列表  
	        for(String s : a){  
	            System.out.println(s);  
	        }  
	    }  
	  
	    *//** 
	     * 解压缩 
	     * @param sZipPathFile 要解压的文件 
	     * @param sDestPath 解压到某文件夹 
	     * @return 
	     *//*  
	    @SuppressWarnings("unchecked")  
	    public static ArrayList Ectract(String sZipPathFile, String sDestPath) {  
	        ArrayList<String> allFileName = new ArrayList<String>();  
	        try {  
	            // 先指定压缩档的位置和档名，建立FileInputStream对象  
	            FileInputStream fins = new FileInputStream(sZipPathFile);  
	            // 将fins传入ZipInputStream中  
	            ZipInputStream zins = new ZipInputStream(fins);
	            ZipEntry ze = null;  
	            byte[] ch = new byte[256];  
	            while ((ze = zins.getNextEntry()) != null) {  
	                File zfile = new File(sDestPath + ze.getName());  
	                File fpath = new File(zfile.getParentFile().getPath());  
	                if (ze.isDirectory()) {  
	                    if (!zfile.exists())  
	                        zfile.mkdirs();  
	                    zins.closeEntry();  
	                } else {  
	                    if (!fpath.exists())  
	                        fpath.mkdirs();  
	                    FileOutputStream fouts = new FileOutputStream(zfile);  
	                    int i;  
	                    allFileName.add(zfile.getAbsolutePath());  
	                    while ((i = zins.read(ch)) != -1)  
	                        fouts.write(ch, 0, i);  
	                    zins.closeEntry();  
	                    fouts.close();  
	                }  
	            }  
	            fins.close();  
	            zins.close();  
	        } catch (Exception e) {  
	            System.err.println("Extract error:" + e.getMessage());  
	        }  
	        return allFileName;  
	    }  */
	    
	    public void unZip(String unZipFileName, String outputDirectory) throws Exception {  
	        // 创建输出文件夹对象  
	        File outDirFile = new File(outputDirectory);  
	        outDirFile.mkdirs();  
	        // 打开压缩文件文件夹  
	        ZipFile zipFile = new ZipFile(unZipFileName, "GBK");  
	        int i=1;
	        for (Enumeration entries = zipFile.getEntries(); entries.hasMoreElements();) {  
	            ZipEntry ze = (ZipEntry) entries.nextElement();  
	            File file = new File(outDirFile,"image"+i+ze.getName().substring(ze.getName().lastIndexOf(".")));  
	            if (ze.isDirectory()) {// 是目录，则创建之  
	                file.mkdirs();  
	            } else {  
	                File parent = file.getParentFile();  
	                if (parent != null && !parent.exists()) {  
	                    parent.mkdirs();  
	                }  
	                file.createNewFile();  
	                FileOutputStream fos = new FileOutputStream(file);  
	                InputStream is = zipFile.getInputStream(ze);  
	                this.inStream2outStream(is, fos);  
	                fos.close();  
	                is.close();  
	            }
	            i++;
	        }  
	        zipFile.close();  
	    }  
	    private void inStream2outStream(InputStream is, OutputStream os) throws IOException {  
	        BufferedInputStream bis = new BufferedInputStream(is);  
	        BufferedOutputStream bos = new BufferedOutputStream(os);  
	        int bytesRead = 0;  
	        for (byte[] buffer = new byte[1024]; ((bytesRead = bis.read(buffer, 0, 1024)) != -1);) {  
	            bos.write(buffer, 0, bytesRead); // 将流写入  
	        }  
	    }  
	    public static void main(String[] args) {  
	        try {  
	        	ZipUtils t = new ZipUtils();  
	            t.unZip("C:\\opt\\测试.zip", "C:\\opt\\aaaa\\");  
	        } catch (Exception e) {  
	            e.printStackTrace(System.out);  
	        }  
	    }  
	   
}
