package com.eva.classsystem.utils;

import com.eva.classsystem.pojo.SimsAttendNum;
import com.eva.classsystem.pojo.SimsAttendencyDetailInfo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class CourseCheck {

    /*
    public static List<Integer> check(List<SimsAttendencyDetailInfo> list) {
        HashMap<Date, Integer> hs = new HashMap<Date, Integer>();
        List<Integer> newList2 =new ArrayList<Integer>();

            for (SimsAttendencyDetailInfo date : list) {
                Integer count = 1;
                if (hs.get(date.getAttenddate())== null&&date.getStudentno()==null) {
                        count=0;
                }else if (hs.get(date.getAttenddate())== null&&date.getStudentno()!=null){
                    count=1;
                }else if(hs.get(date.getAttenddate())!=null&&date.getStudentno()!=null){
                    count = hs.get(date.getAttenddate()) + 1;
                }else if(hs.get(date.getAttenddate())!=null&&date.getStudentno()==null){
                    count = hs.get(date.getAttenddate());
                }
                hs.put(date.getAttenddate(), count);
            }
            for (Integer key : hs.values()) {

                newList2.add(key);

            }



        return newList2;
    }

    public static List<String> checkdate(List<SimsAttendencyDetailInfo> list) {
        HashMap<String, Integer> hs = new HashMap<String, Integer>();
        List<String> newList2 =new ArrayList<String>();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        for (SimsAttendencyDetailInfo date : list) {
            Integer count = 1;
            if (hs.get(date.getInputTime())== null&&date.getStudentno()==null) {
                count=0;
            }else if (hs.get(date.getInputTime())== null&&date.getStudentno()!=null){
                count=1;
            }else if(hs.get(date.getInputTime())!=null&&date.getStudentno()!=null){
                count = hs.get(date.getInputTime()) + 1;
            }else if(hs.get(date.getInputTime())!=null&&date.getStudentno()==null){
                count = hs.get(date.getInputTime());
            }
            hs.put(df.format(date.getInputTime()), count);
        }
        for (String key : hs.keySet()) {

            newList2.add(key);

        }



        return newList2;
    }


    public static List<String> checkxinqi(List<SimsAttendencyDetailInfo> list) {
        HashMap<Date, Integer> hs = new HashMap<Date, Integer>();
        List<Date> newList =new ArrayList<Date>();
        List<Date> newList2 =new ArrayList<Date>();
        List<String> newList3=new ArrayList<String>();
        for (int i = 0; i < list.size(); i++) {
            Date checkCourseclass = list.get(i).getAttenddate();

            newList.add(checkCourseclass);
        }
        for (Date date : newList) {
            SimpleDateFormat sdf =  new SimpleDateFormat( "yyyy-MM-dd" );
            String str = sdf.format(date);
            newList3.add(dateToWeek(str));
        }


        return newList3;
    }

     */
    public static List<String> checkxinqi2(List<SimsAttendNum> list){
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
        List<String> newList3=new ArrayList<String>();
        for (SimsAttendNum s:list){
            String ss=s.getAttendDate();
            newList3.add(dateToWeek(ss));
        }
        return newList3;
    }
    public static String dateToWeek(String datetime) {
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
        String[] weekDays = { "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六" };
        Calendar cal = Calendar.getInstance(); // 获得一个日历
        Date datet = null;
        try {
            datet = f.parse(datetime);
            cal.setTime(datet);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        int w = cal.get(Calendar.DAY_OF_WEEK) - 1; // 指示一个星期中的某天。
        if (w < 0)
            w = 0;
        return weekDays[w];
    }


    public static String suijiinvitecode() {
        String randomcode = "";
        // 用字符数组的方式随机
        String model = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        char[] m = model.toCharArray();
        for (int j = 0; j < 6; j++) {
            char c = m[(int) (Math.random() * 36)];
            // 保证六位随机数之间没有重复的
            if (randomcode.contains(String.valueOf(c))) {
                j--;
                continue;
            }
            randomcode = randomcode + c;
        }
        return randomcode;
    }

    public static Integer deleteBytime(Date date,String inputtime) throws ParseException {
        SimpleDateFormat df1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date fromDate2=df1.parse(inputtime);
        String date1=df1.format(date);
        Date toDate2 = df1.parse(date1);
        long from2 = fromDate2.getTime();
        long to2 = toDate2.getTime();
        int hours = (int) ((to2 - from2) / (1000 * 60 * 60));
        return hours;
    }
}
