class TVData{  
   int channel, volume;//ä�ι�ȣ, ���� ��� ���� ����
   //�����ѱ�, ��������(�ݺ�������) �޼ҵ� ���� 
   
   TVData(){
	   
   }
   TVData(int channel, int volume) {
	   this.channel=channel; this.volume=volume;
   }
static void turnOn() {
	   System.out.println("�����");
   }
   static void turnOff() {
	   System.out.println("��������");
   }
   
}