import java.util.Scanner;
import TVPKG.TVch; // TVch ��� public interface �����
import TVPKG.TVvol; //TVvol ��� public interface �����

public class TVMain {

   public static void main(String[] args) {
      SmartTv sm=new SmartTv(7, 10);//7�� ä�ι�ȣ, 10�� ������ �ʱⰪ
      Scanner sc=new Scanner(System.in);
      //���ڸ� �Է¹޾� ��¿��ÿ� ���� ����� ������ ���α׷��� �ۼ��Ͻÿ�.
      
      while(true) {
    	  System.out.println("1. �����ѱ� 2. ������ 3. �����ٿ� 4. ä�οø��� 5. ä�γ����� 6. ��������");
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