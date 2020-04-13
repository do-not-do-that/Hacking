class TVData{  
   int channel, volume;//채널번호, 볼륨 멤버 변수 선언
   //전원켜기, 전원끄기(반복문종료) 메소드 구현 
   
   TVData(){
	   
   }
   TVData(int channel, int volume) {
	   this.channel=channel; this.volume=volume;
   }
static void turnOn() {
	   System.out.println("방송중");
   }
   static void turnOff() {
	   System.out.println("전원종료");
   }
   
}