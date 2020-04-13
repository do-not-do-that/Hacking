import TVPKG.TVch;
import TVPKG.TVvol;
class SmartTv extends TVData implements TVvol,TVch //TVData클래스와 interface 상속
{

   //상속받은 인터페이스의 내용 구현
	SmartTv(){
	}
	SmartTv(int channel, int volume){
		super(channel,volume);
	}
	@Override
	public void chup() {
		channel+=1;
		System.out.println("현재 채널 : "+channel);
	}
	@Override
	public void chdown() {
		channel-=1;
		System.out.println("현재 채널 : "+channel);
	}
	@Override
	public void volup() {
		volume+=1;
		System.out.println("현재 음량 : "+volume);
		
	}
	@Override
	public void voldown() {
		volume-=1;
		System.out.println("현재 음량 : "+volume);
		
	}
	
}