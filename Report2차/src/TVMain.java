import java.util.Scanner;
import TVPKG.TVch; // TVch 라는 public interface 만들기
import TVPKG.TVvol; //TVvol 라는 public interface 만들기

public class TVMain {

   public static void main(String[] args) {
      SmartTv sm=new SmartTv(7, 10);//7은 채널번호, 10은 볼륨의 초기값
      Scanner sc=new Scanner(System.in);
      //숫자를 입력받아 출력예시와 같이 결과가 나오는 프로그램을 작성하시오.
      
      while(true) {
    	  System.out.println("1. 전원켜기 2. 볼륨업 3. 볼륨다운 4. 채널올리기 5. 채널내리기 6. 전원끄기");
    	  int n=sc.nextInt();
    	  switch(n) {
    	  case 1:
    		  TVData.turnOn();
    		  break;
    	  case 2:
    		  sm.volup();
    		  break;
    	  case 3:
    		  sm.voldown();
    		  break;
    	  case 4:
    		  sm.chup();
    		  break;
    	  case 5:
    		  sm.chdown();
    		  break;
    	  }
    	  if(n==6) {
    		  TVData.turnOff();
    		  break;
    	  }
      
      }
      sc.close();
   }
}