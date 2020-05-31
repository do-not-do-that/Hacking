#include <stdio.h>

int main(){
	
	int day;
	
	printf("1. 월요일\n2. 화요일\n3. 수요일\n4. 목요일\n5. 금요일\n6. 토요일\n7. 일요일\n"); 

	scanf("%d",&day);
	
	if(day==1 || day==3 || day == 5 || day ==7){
		printf("oh my god");
	}else{
		printf("enjoy");
	}
	
	
	return 0;
}
