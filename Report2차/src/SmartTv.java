import TVPKG.TVch;
import TVPKG.TVvol;
class SmartTv extends TVData implements TVvol,TVch //TVDataŬ������ interface ���
{

   //��ӹ��� �������̽��� ���� ����
	SmartTv(){
	}
	SmartTv(int channel, int volume){
		super(channel,volume);
	}
	@Override
	public void chup() {
		channel+=1;
		System.out.println("���� ä�� : "+channel);
	}
	@Override
	public void chdown() {
		channel-=1;
		System.out.println("���� ä�� : "+channel);
	}
	@Override
	public void volup() {
		volume+=1;
		System.out.println("���� ���� : "+volume);
		
	}
	@Override
	public void voldown() {
		volume-=1;
		System.out.println("���� ���� : "+volume);
		
	}
	
}