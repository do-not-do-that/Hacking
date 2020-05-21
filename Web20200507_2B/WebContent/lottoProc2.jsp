<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>로또번호 구하기(처리)</h1>
<font size=6>
<%
   int startNumber = Integer.parseInt(request.getParameter("startNum"));
   int endNumber = Integer.parseInt(request.getParameter("endNum"));
   int count = Integer.parseInt(request.getParameter("count"));
   int [] lotto = new int[count];
   
   
   if(count> (endNumber-startNumber+1)){
      out.println("그게 말이 된다고 생각하냐?");
   }else{
      for(int i=0; i<lotto.length; i++){
         
         int num = (int)(Math.random()*(endNumber-startNumber+1)+startNumber);
         lotto[i] = num;
         for(int j=0; j<i; j++){
            if(lotto[j] == num){
               i--;
               break;
            }
         }
      }
      
      for(int i=0; i<lotto.length; i++){
         out.println(lotto[i]+" ");
      }
   }
%>
</font>