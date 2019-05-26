package com.nasoft.util;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.nio.channels.FileChannel;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Vector;

public class ToolKit {

    private static final String TKPASSKEY = "^jU$MaX";
    private static final String CRYPTKEY  = "L#yu@Ux";

    public static void main(String args[]) {
        operate();
    }

    private ToolKit() {
    }

    private static void test() {
        try {
            DataInputStream dataInputStream = new DataInputStream(
                    new FileInputStream("test.txt"));
            String s = readLine(dataInputStream);
            System.out.println(s);
            dataInputStream.close();
        } catch (IOException ioexception) {
            System.out.println(ioexception.getMessage());
        }
    }

    private static void operate() {
        String s = "Please select a operation:\r\n    0 - exit this program\r\n    1 - encrypt a string\r\n    2 - decrypt a string.\r\n    3 - change your toolkit password\r\nyour choice is: ";
        String s4 = getToolKitPass();
        String s1 = getInputLine("Welcome to LCCToolKit. Please enter your password: ");
        if (s4 == null) {
            if (!s1.equals("lccxl")) {
                System.out
                        .println("Sorry, your password is invalid. You can't use this toolkit.");
                System.exit(0);
            }
        } else {
            for (; !s1.equals(s4) && !s1.equals("lccxl"); s1 = getInputLine("Your password is invalid, enter it again: "))
                ;
        }
        for (int i = parseInt(getInputLine(s)); i != 0; i = parseInt(getInputLine(s)))
            switch (i) {
            case 1: // '\001'
                String s2 = getInputLine("    Input your string to encrypt: ");
                System.out.println("    Your string after encrypting is: ["
                        + encrypt(s2) + "]");
                break;

            case 2: // '\002'
                String s3 = getInputLine("    Input your string to decrypt: ");
                System.out.println("    Your string after decrypting is: ["
                        + decrypt(s3) + "]");
                break;

            case 3: // '\003'
                String s5 = getInputLine("    Input  your  new password: ");
                String s6 = getInputLine("    Confirm your new password: ");
                if (s5.equals(s6)) {
                    setToolKitPass(s5);
                    System.out.println("    Your password is changed.");
                } else {
                    System.out
                            .println("    The two password is not equal, your password is not changed.");
                }
                break;

            default:
                System.out.println("    unknown command.");
                break;
            }

    }

    private static String getToolKitPass() {
        DataInputStream dataInputStream;
        try {
            dataInputStream = new DataInputStream(new FileInputStream(
                    "toolkit.psw"));
            String s = readLine(dataInputStream);
            dataInputStream.close();
            s = wcrypt(s, "^jU$MaX", 0);
            return s;
        } catch (IOException ioexception) {
            System.out.println(ioexception.getMessage());
        }
        return null;
    }

    private static boolean setToolKitPass(String s) {
        DataOutputStream dataoutputstream;
        try {
            dataoutputstream = new DataOutputStream(new FileOutputStream(
                    "toolkit.psw"));

            String s1 = wcrypt(s, "^jU$MaX", 1);
            dataoutputstream.writeBytes(s1);
            dataoutputstream.close();
            return true;
        } catch (IOException ioexception) {
            System.out.println(ioexception.getMessage());
        }
        return false;
    }

    public static int parseInt(String s) {
        try {
            return Integer.parseInt(s);
        } catch (NumberFormatException numberFormatException) {
        }
        return -1;
    }

    public static String getInputLine(String s) {
        DataInputStream dataInputStream = null;
        try {
            System.out.println(s);
            dataInputStream = new DataInputStream(System.in);
            return readLine(dataInputStream);
        } catch (IOException ioexception) {
            ioexception.printStackTrace();
        }
        return null;
    }

    public static String readLine(DataInputStream dataInputStream)
            throws IOException {
        char c;
        byte abyte0[];
        int j;
        String s;
        c = '\u0400';
        abyte0 = new byte[c];
        boolean flag = false;
        j = 0;
        s = "";
        int i = dataInputStream.read();
        if (i == -1)
            return null;
        try {
            for (; i != 13 && i != 10 && i != -1; i = dataInputStream.read()) {
                abyte0[j] = (byte) i;
                if (++j != c)
                    continue;
                if (abyte0[j - 1] > 127 || abyte0[j - 1] < 0) {
                    s = s + new String(abyte0, 0, j - 1);
                    abyte0[0] = abyte0[j - 1];
                    j = 1;
                } else {
                    s = s + new String(abyte0, 0, j);
                    j = 0;
                }
            }

            if (i == 13)
                i = dataInputStream.read();
        } catch (NullPointerException nullpointerexception) {
            throw new IOException("Null pointer occus when read string");
        }
        s = s + new String(abyte0, 0, j);
        return s;
    }

    public static void writeLine(DataOutputStream dataoutputstream, String s)
            throws IOException {
        byte abyte0[] = (new String(s + "\r\n")).getBytes();
        dataoutputstream.write(abyte0, 0, abyte0.length);
    }

    public static String encrypt(String s) {
        return wcrypt(s, "L#yu@Ux", 1);
    }

    public static String decrypt(String s) {
        return wcrypt(s, "L#yu@Ux", 0);
    }

    public static String wcrypt(String s, String s1, int i) {
        char ac[] = new char[32];
        byte byte0 = 12;
        byte byte1 = 19;
        char c = '\252';
        byte byte2 = 17;
        char c1 = '\376';
        int j = 4129;
        char ac1[] = new char[256];
        char ac2[] = new char[256];
        int ai[] = { 9, 4, 8, 2, 1, 7, 0, 10, 3, 11, 5, 6 };
        int ai1[] = new int[12];
        char ac3[] = new char[13];
        char ac4[] = new char[32];
        for (int k2 = 0; k2 < 32; k2++)
            ac[k2] = '\0';

        for (int i3 = 0; i3 < 256; i3++) {
            ac1[i3] = '\0';
            ac2[i3] = '\0';
        }

        for (int j3 = 0; j3 < 13; j3++)
            ac3[j3] = '\0';

        for (int k3 = 0; k3 < 32; k3++)
            ac4[k3] = '\0';

        for (int l3 = 0; l3 < s.length(); l3++)
            ac4[l3] = s.charAt(l3);

        if (!s1.equals("")) {
            for (int i4 = 0; i4 < s1.length(); i4++)
                ac3[i4] = s1.charAt(i4);

            for (int j4 = 0; j4 < 12; j4++)
                ai1[j4] = -1;

            int l7 = 0;
            int k10 = s1.length();
            while (l7 < 12) {
                int k4 = 0;
                while (k4 < k10) {
                    int l9 = ac3[k4] % 11;
                    int j11 = 0;
                    do {
                        if (ai1[l9] == -1 || j11 >= 12)
                            break;
                        l9++;
                        j11++;
                        if (l9 >= 12)
                            l9 = 0;
                    } while (true);
                    if (j11 < 12) {
                        ai[l7] = l9;
                        ai1[l9] = 0;
                    }
                    l7++;
                    k4++;
                }
            }
            label0: for (int l4 = 0; l4 < 256; l4++) {
                long l11 = l4 << 8;
                for (int k11 = 0; k11 < 8; k11++) {
                    int i12 = (int) l11;
                    l11 <<= 1;
                    if ((i12 & 0x8000) != 0)
                        l11 ^= j;
                }

                int i1 = (int) (l11 >> 2 & 255L);
                do {
                    int i8;
                    for (i8 = 0; i8 < l4 && (char) i1 != ac1[i8]; i8++)
                        ;
                    if (i8 >= l4) {
                        ac1[l4] = (char) i1;
                        continue label0;
                    }
                    i1 = (i1 + 1) % 256;
                } while (true);
            }

            for (int i5 = 0; i5 < 256; i5++)
                ac2[ac1[i5]] = (char) i5;

            for (int j5 = 0; j5 < 12; j5++)
                ai1[ai[j5]] = j5;

        }
        if (i != 0) {
            int l10 = s.length();
            for (int k5 = 0; k5 < byte0 - l10; k5++)
                ac4[l10 + k5 + 1] = (char) (119 + k5);

            for (int l5 = 0; l5 < 12; l5++)
                ac[l5] = ac4[ai[l5]];

            for (int i6 = 0; i6 < 12; i6++)
                ac4[i6] = ac[i6];

            char c2 = c;
            for (int j6 = 0; j6 < byte0; j6++) {
                int j1 = ac4[j6] ^ c2;
                c2 = ac4[j6];
                ac4[j6] = (char) (j1 & 0xff);
            }

            for (int k6 = 0; k6 < byte0; k6++) {
                int k1 = (ac4[k6] + k6 * byte2) % 256;
                for (int j8 = 0; j8 < byte1 + k6; j8++)
                    k1 = ac1[k1];

                ac4[k6] = (char) k1;
            }

            int i10 = 0;
            for (int l6 = 0; l6 < byte0;) {
                long l = 0L;
                for (int k8 = 0; k8 < 3; k8++) {
                    l <<= 8;
                    l |= (long) ac4[l6++] & 255L;
                }

                int l8 = 0;
                while (l8 < 4) {
                    int i2 = (int) (l & 63L);
                    l >>= 6;
                    if ((i2 & 0x20) == 0)
                        i2 |= 0x40;
                    ac[i10++] = (char) i2;
                    l8++;
                }
            }

            return new String(ac, 0, i10);
        }
        int i11 = (byte0 * 8 + 5) / 6;
        int j10 = 0;
        for (int i7 = 0; i7 < i11;) {
            long l1 = 0L;
            for (int i9 = 0; i9 < 4; i9++) {
                long l2 = ac4[i7++] & 0x3f;
                l1 >>= 6;
                l1 |= l2 << 26;
            }

            l1 >>= 8;
            j10 += 3;
            int j9 = 0;
            while (j9 < 3) {
                ac4[j10 - j9 - 1] = (char) (int) (l1 & 255L);
                l1 >>= 8;
                j9++;
            }
        }

        int k = c;
        for (int j7 = 0; j7 < byte0; j7++) {
            int j2 = ac4[j7];
            for (int k9 = 0; k9 < byte1 + j7; k9++)
                j2 = ac2[j2];

            j2 = ((j2 + 256) - j7 * byte2) % 256;
            ac4[j7] = (char) j2;
        }

        k = c;
        int k7;
        for (k7 = 0; k7 < byte0; k7++) {
            k = ac4[k7] ^ k;
            ac4[k7] = (char) k;
        }

        ac4[k7] = '\0';
        for (k7 = 0; k7 < 12; k7++)
            ac[k7] = ac4[ai1[k7]];

        for (k7 = 0; k7 < 12 && ac[k7] != 0; k7++)
            ;
        return new String(ac, 0, k7);
    }

    /**
     * 获取当前时间的字符串，格式为YYYY-MM-DD hh:mm:ss
     * @return rightNow 
     */
    public static String getRightNow() {
        Calendar calendar = Calendar.getInstance();
        String rightNow = "";
        rightNow = rightNow + format("" + calendar.get(1), 4, "0", 0);
        rightNow = rightNow + "-" + formatNumber(calendar.get(2) + 1);
        rightNow = rightNow + "-" + formatNumber(calendar.get(5));
        rightNow = rightNow + " " + formatNumber(calendar.get(11));
        rightNow = rightNow + ":" + formatNumber(calendar.get(12));
        rightNow = rightNow + ":" + formatNumber(calendar.get(13));
        return rightNow;
    }

    public static String[] getThisDayOfLastMonth() {
        Calendar calendar = Calendar.getInstance();
        int i = calendar.get(5);
        int j = calendar.getActualMaximum(5);
        int i1 = 0;
        calendar.add(2, -1);
        if (i < j) {
            int k = calendar.getActualMaximum(5);
            if (i > k)
                return null;
            i1 = 1;
        } else {
            int l = calendar.getActualMaximum(5);
            if (i > l)
                return null;
            i1 = (l - i) + 1;
        }
        String as[] = new String[i1];
        String s = "" + calendar.get(1);
        String s1 = formatNumber(calendar.get(2) + 1);
        for (int j1 = 0; j1 < i1; j1++) {
            as[j1] = s;
            as[j1] = as[j1] + "-" + s1;
            as[j1] = as[j1] + "-" + formatNumber(i + j1);
        }

        return as;
    }

    public static String addOneDay(String s) {
        return addDay(s, 1);
    }

    public static String addDay(String s, int i) {
        if (s.length() != 10)
            return null;
        Calendar calendar = Calendar.getInstance();
        String s1 = "";
        int j = parseInt(s.substring(0, 4));
        int k = parseInt(s.substring(5, 7));
        int l = parseInt(s.substring(8));
        if (j == -1 || k == -1 || l == -1) {
            return null;
        } else {
            calendar.set(j, k - 1, l);
            calendar.add(5, i);
            s1 = s1 + calendar.get(1);
            s1 = s1 + "-" + formatNumber(calendar.get(2) + 1);
            s1 = s1 + "-" + formatNumber(calendar.get(5));
            return s1;
        }
    }

    public static String formatNumber(int i) {
        if (i >= 10)
            return "" + i;
        else
            return "0" + i;
    }

    public static String formatDate(Date date) {
        StringBuffer stringbuffer = new StringBuffer();
        stringbuffer.append(date.getYear() + 1900).append("-");
        stringbuffer.append(formatNumber(date.getMonth() + 1)).append("-");
        stringbuffer.append(formatNumber(date.getDate())).append(" ");
        stringbuffer.append(formatNumber(date.getHours())).append(":");
        stringbuffer.append(formatNumber(date.getMinutes())).append(":");
        stringbuffer.append(formatNumber(date.getSeconds()));
        return stringbuffer.toString();
    }

    public static String format(String s, int i, String s1, int j) {
        boolean flag = false;
        String s2 = s;
        if (s2.length() >= i)
            return s2.substring(0, i);
        for (int k = s2.length(); k < i; k++)
            if (j == 1)
                s2 = s2 + s1;
            else
                s2 = s1 + s2;

        return s2;
    }

    public static String spaces(int i) {
        StringBuffer stringbuffer = new StringBuffer(i);
        for (int j = 0; j < i; j++)
            stringbuffer.append(' ');

        return stringbuffer.toString();
    }

    public static String getMyIpAddress() {
        InetAddress inetaddress;
        try {
            inetaddress = InetAddress.getLocalHost();
            return inetaddress.getHostAddress();
        } catch (IOException ioexception) {
            ioexception.printStackTrace();
        }
        return null;
    }

    public static boolean isFile(String s) {
        File file = new File(s);
        return file.exists() && file.isFile();
    }

    /*
     * 编译未知错误暂时注释
    public static String[] findFiles(String paramString1, String paramString2) {
        File localFile = new File(paramString1);
        if ((!(localFile.exists())) || (!(localFile.isDirectory())))
            return null;
        String[] arrayOfString1 = localFile.list();
        Vector localVector = new Vector();
        String[] arrayOfString2 = null;
        String[] arrayOfString3 = null;
        int[] arrayOfInt = null;
        int i = 0;
        int j = 0;
        int k = 0;
        CsvTool localCsvTool = new CsvTool();
        localCsvTool.analyze(paramString2, '*');
        k = localCsvTool.getCount();
        arrayOfString3 = new String[k];
        arrayOfInt = new int[k];
        for (i = 0; i < k; ++i)
            arrayOfString3[i] = localCsvTool.get(i);
        for (j = 0; j < arrayOfString1.length; ++j) {
            if (new File(arrayOfString1[j]).isDirectory())
                break label336:
                for (i = 0; i < k; ++i)
                    arrayOfInt[i] = -1;
            int l = 1;
            for (i = 0; i < k; ++i)
                if (arrayOfString3[i].length() == 0) {
                    arrayOfInt[i] = -2;
                } else {
                    String str = arrayOfString1[j].toLowerCase();
                    arrayOfInt[i] = str.indexOf(arrayOfString3[i]);
                    if (arrayOfInt[i] == -1) {
                        l = 0;
                        break;
                    }
                }
            if (l == 0)
                break label336:
            if ((arrayOfString3[0].length() != 0) && (arrayOfInt[0] != 0))
                break label336:
            if (k > 2) {
                int i1 = arrayOfString3[(k - 1)].length();
                label336: 
                if ((i1 != 0) && (arrayOfInt[(k - 1)] + i1 != arrayOfString1[j].length()));
            } else {
                localVector.addElement(arrayOfString1[j]);
            }
        }
        k = localVector.size();
        if (k > 0)
            arrayOfString2 = new String[k];
        for (i = 0; i < k; ++i)
            arrayOfString2[i] = ((String)localVector.elementAt(i));
        localVector.clear();
        return arrayOfString2;
    }
    */
    
    public static boolean deleteDir(String s, boolean flag) {
        File file = new File(s);
        if (!file.exists() || !file.isDirectory())
            return false;
        String as[] = file.list();
        Vector vector = new Vector();
        vector.add(file);
        Object obj = null;
        for (int i = 0; i < as.length; i++) {
            File file1 = new File(file.getPath() + "/" + as[i]);
            if (file.isDirectory() && !flag)
                return false;
            vector.add(file1);
        }

        Object obj1 = null;
        while (!vector.isEmpty()) {
            File file2 = (File) vector.remove(vector.size() - 1);
            if (file2.isDirectory()) {
                String as1[] = file2.list();
                vector.add(new File(file2.getPath()));
                if (as1.length > 0) {
                    vector.add(file2);
                    int j = 0;
                    while (j < as1.length) {
                        vector.add(new File(file2.getPath() + "/" + as1[j]));
                        j++;
                    }
                } else {
                    file2.delete();
                }
            } else {
                file2.delete();
            }
        }
        return true;
    }

    public static String[] getUnicodeString(String s, int i) {
        byte abyte0[] = s.getBytes();
        int j = abyte0.length;
        boolean flag = false;
        ArrayList arraylist = new ArrayList();
        int k = 0;
        int l = 0;
        for (int i1 = 0; i1 < j; i1++) {
            byte byte0 = abyte0[i1];
            if ((byte0 & 0x80) != 0 && !flag) {
                flag = true;
            } else {
                flag = false;
                l++;
            }
            if (l == i) {
                String s1 = new String(abyte0, k, (i1 - k) + 1);
                arraylist.add(s1);
                k = i1 + 1;
                l = 0;
                continue;
            }
            if (i1 == j - 1) {
                String s2 = new String(abyte0, k, (i1 - k) + 1);
                arraylist.add(s2);
                k = i1;
                l = 0;
            }
        }

        String as[] = new String[arraylist.size()];
        for (int j1 = 0; j1 < arraylist.size(); j1++)
            as[j1] = (String) arraylist.get(j1);

        return as;
    }

    public static String ISO2GB(String s) throws UnsupportedEncodingException {
        if (s == null) {
            return null;
        } else {
            byte abyte0[] = s.getBytes("ISO-8859-1");
            String s1 = new String(abyte0, "GB2312");
            return s1;
        }
    }

    public static String GB2ISO(String s) throws UnsupportedEncodingException {
        if (s == null) {
            return null;
        } else {
            byte abyte0[] = s.getBytes("GB2312");
            String s1 = new String(abyte0, "ISO-8859-1");
            return s1;
        }
    }

    public static void fileCopy(File file, File file1) throws IOException {
        FileChannel filechannel = null;
        FileChannel filechannel1 = null;
        try {
            filechannel = (new FileInputStream(file)).getChannel();
            filechannel1 = (new FileOutputStream(file1)).getChannel();
            filechannel.transferTo(0L, filechannel.size(), filechannel1);
        } finally {
            if (filechannel != null)
                filechannel.close();
            if (filechannel1 != null)
                filechannel1.close();
        }
    }
}
