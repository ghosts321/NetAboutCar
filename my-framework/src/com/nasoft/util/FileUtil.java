package com.nasoft.util;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class FileUtil {
	private static final Logger logger = LoggerFactory.getLogger(FileUtil.class);

	  public static File createDir(String dirPath)
	  {
	    File dir;
	    try
	    {
	      dir = new File(dirPath);
	      if (!dir.exists())
	        FileUtils.forceMkdir(dir);
	    }
	    catch (Exception e) {
	      logger.error("创建目录出错！", e);
	      throw new RuntimeException(e);
	    }
	    return dir;
	  }

	  public static File createFile(String filePath)
	  {
	    File file;
	    try
	    {
	      file = new File(filePath);
	      File parentDir = file.getParentFile();
	      if (!parentDir.exists())
	        FileUtils.forceMkdir(parentDir);
	    }
	    catch (Exception e) {
	      logger.error("创建文件出错！", e);
	      throw new RuntimeException(e);
	    }
	    return file;
	  }

	  public static void copyDir(String srcPath, String destPath)
	  {
	    try
	    {
	      File srcDir = new File(srcPath);
	      File destDir = new File(destPath);
	      if ((srcDir.exists()) && (srcDir.isDirectory()))
	        FileUtils.copyDirectoryToDirectory(srcDir, destDir);
	    }
	    catch (Exception e) {
	      logger.error("复制目录出错！", e);
	      throw new RuntimeException(e);
	    }
	  }

	  public static void copyFile(String srcPath, String destPath)
	  {
	    try
	    {
	      File srcFile = new File(srcPath);
	      File destDir = new File(destPath);
	      if ((srcFile.exists()) && (srcFile.isFile()))
	        FileUtils.copyFileToDirectory(srcFile, destDir);
	    }
	    catch (Exception e) {
	      logger.error("复制文件出错！", e);
	      throw new RuntimeException(e);
	    }
	  }

	  public static void deleteDir(String dirPath)
	  {
	    try
	    {
	      File dir = new File(dirPath);
	      if ((dir.exists()) && (dir.isDirectory()))
	        FileUtils.deleteDirectory(dir);
	    }
	    catch (Exception e) {
	      logger.error("删除目录出错！", e);
	      throw new RuntimeException(e);
	    }
	  }

	  public static void deleteFile(String filePath)
	  {
	    try
	    {
	      File file = new File(filePath);
	      if ((file.exists()) && (file.isFile()))
	        FileUtils.forceDelete(file);
	    }
	    catch (Exception e) {
	      logger.error("删除文件出错！", e);
	      throw new RuntimeException(e);
	    }
	  }

	  public static void renameFile(String srcPath, String destPath)
	  {
	    File srcFile = new File(srcPath);
	    if (srcFile.exists()) {
	      File newFile = new File(destPath);
	      boolean result = srcFile.renameTo(newFile);
	      if (!result)
	        throw new RuntimeException("重命名文件出错！" + newFile);
	    }
	  }

	  public static void writeFile(String filePath, String fileContent)
	  {
	    OutputStream os = null;
	    Writer w = null;
	    try {
	      createFile(filePath);
	      os = new BufferedOutputStream(new FileOutputStream(filePath));
	      w = new OutputStreamWriter(os, "UTF-8");
	      w.write(fileContent);
	      w.flush();
	    } catch (Exception e) {
	      logger.error("写入文件出错！", e);
	      throw new RuntimeException(e);
	    } finally {
	      try {
	        if (os != null) {
	          os.close();
	        }
	        if (w != null)
	          w.close();
	      }
	      catch (Exception e) {
	        logger.error("释放资源出错！", e);
	      }
	    }
	  }
	  
	  /**
		 * 将文件打包
		 * 
		 * @param baseDir
		 * @param fileNames
		 * @param zipName
		 */
		public static synchronized void zipFiles(String baseDir, String[] fileNames, String zipName)
		{
			byte[] buffer = new byte[1024];
			String strZipPath = baseDir + zipName;
			ZipOutputStream out = null;
			FileInputStream fis = null;
			try
			{
				out = new ZipOutputStream(new FileOutputStream(strZipPath));
				int fileCount = fileNames.length;
				File[] files = new File[fileCount];
				for (int i = 0; i < fileCount; i++)
				{
					files[i] = new File(baseDir + fileNames[i]);
				}
				for (int i = 0; i < files.length; i++)
				{
					try
					{
						fis = null;
						fis = new FileInputStream(files[i]);
						out.putNextEntry(new ZipEntry(files[i].getName()));
						int len;
						// 读入需要下载的文件的内容，打包到zip文件
						while ((len = fis.read(buffer)) > 0)
						{
							out.write(buffer, 0, len);
						}
						out.closeEntry();
					} catch (Exception e)
					{

					}
				}
			} catch (Exception e)
			{
				e.printStackTrace();
			} finally
			{
				closeInputStrem(fis);
				closeOutputStrem(out);
			}
		}

		public static void closeOutputStrem(OutputStream out)
		{
			if (out == null)
				return;
			try
			{
				out.flush();
				out.close();
			} catch (Exception e)
			{
				// TODO: Ignore it
			}
		}

		public static void closeInputStrem(InputStream in)
		{
			if (in == null)
				return;
			try
			{
				in.close();
			} catch (Exception e)
			{
				// TODO: Ignore it
			}
		}

		/**
		 * 
		 * 描述: 获取文件名 - 前缀 (已排除路径部分)
		 * 
		 * @param filename
		 * @return
		 */
		public static String getPrefix(final String filename)
		{
			/*
			 * 从文件名后开始找，找到第一个 . 的位置作为endIndex 含有斜杠或反斜杠，则startIndex为最后一个 斜杠或反斜杠的位置
			 */
			String result = null;
			int startIndex = 0;
			int endIndex = filename.lastIndexOf(FormatConstant.DOT_MARK);
			if (filename.contains(FormatConstant.SLASH))
			{
				// 含有斜杠
				startIndex = filename.lastIndexOf(FormatConstant.SLASH);
				// 下一个位置
				startIndex++;
			} else if (filename.contains(FormatConstant.BACK_SLASH))
			{
				// 含有反斜杠
				startIndex = filename.lastIndexOf(FormatConstant.BACK_SLASH);
				// 下一个位置
				startIndex++;
			}
			result = filename.substring(startIndex, endIndex);

			return result;
		}

		/**
		 * 
		 * 描述: 获取文件名 - 后缀
		 * 
		 * @param filename
		 * @return
		 */
		public static String getSuffix(final String filename)
		{
			/*
			 * 从文件名后开始找，找到第一个 . 的位置 +1 作为 startIndex
			 */
			String result = null;
			int startIndex = filename.lastIndexOf(FormatConstant.DOT_MARK) + 1;
			result = filename.substring(startIndex);

			return result;
		}

		/**
		 * 
		 * 描述: 给文件名加盖时间戳
		 * 
		 * @param filename
		 *            (支持 有后缀名、无后缀名)，文件名不能携带路径部分 没有后缀名，时间戳直接加盖在文件名后面，有时间戳则先拆开再拼接
		 * @return
		 */
		public static String coverTimestamp(final String filename)
		{
			String result = null;
			// 时间戳 yyyyMMddHHmmssSSS
			String tsString = DateUtil.getTsString();
			final int index = filename.lastIndexOf(FormatConstant.DOT_MARK);
			if (FormatConstant.NEGATIVE_ONE == index)
			{
				// 没有后缀名，直接用文件名盖上时间戳
				result = filename + tsString;
			} else
			{
				// 有后缀名
				final String prefix = filename.substring(FormatConstant.ZERO, index);
				final String suffix = filename.substring(index + 1);
				// 拼接 - 盖上时间戳
				result = prefix + tsString + FormatConstant.DOT_MARK + suffix;
			}

			return result;
		}

	  public static String getRealFileName(String fileName)
	  {
	    return FilenameUtils.getName(fileName);
	  }

	  public static boolean checkFileExists(String filePath)
	  {
	    return new File(filePath).exists();
	  }
}
