<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	body{
		background-color:orange;
	}
</style>
<h1>로또번호 구하기(처리)</h1>
<font size=6>
<%
	//보너스 번호 없음
	
	int [] lotto = new int[6];
	
	for(int i=0;i<lotto.length;i++){
		
		int num=(int)(Math.random()*6)+1; //0<=num<44 -> 1<=num<=45
		boolean isExist = false;
		for(int j=0;j<i;j++){
			if(lotto[j]==num){
				isExist=true;
				i--;
				break;
			}
		}
		
		if(!isExist){
			lotto[i]=num;
		}
		
	}
	for(int i=0;i<lotto.length;i++){
		out.println(lotto[i]);
	}
	
%>
</font>