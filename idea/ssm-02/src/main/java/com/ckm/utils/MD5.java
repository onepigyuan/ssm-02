package com.ckm.utils;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5 {
    /**
     * ʹ��md5���㷨���м���
     */
    public static String md5(String plainText) {
        byte[] secretBytes = null;
        try {
            secretBytes = MessageDigest.getInstance("md5").digest(
                    plainText.getBytes());
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("û��md5����㷨��");
        }
        String md5code = new BigInteger(1, secretBytes).toString(16);// 16��������
        // �����������δ��32λ����Ҫǰ�油0
        for (int i = 0; i < 32 - md5code.length(); i++) {
            md5code = "0" + md5code;
        }
        return md5code;
    }

    /**
     * ����ĵļ��ܽ��ܷ����������ǽ��ܣ�һ���Ǽ���
     * @param inStr
     * @return
     */
    public static String convertMD5(String inStr){

        char[] a = inStr.toCharArray();
        for (int i = 0; i < a.length; i++){
            a[i] = (char) (a[i] ^ 't');
        }
        String s = new String(a);
        return s;

    }



    public static void main(String[] args) {
        String s = md5("1234");
        System.out.println("MD5��"+s);
        System.out.println("MD5���ټ��ܣ�"+convertMD5(s));
        System.out.println("MD5���ܺ���ܣ�"+convertMD5(convertMD5(s)));
        String s2 = convertMD5("12345");
        System.out.println("����ļ��ܽ��ܷ���֮���ܣ�"+s2);
        System.out.println("����ļ��ܽ��ܷ���֮���ܣ�"+convertMD5(s2));
    }

}

