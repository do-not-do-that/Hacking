#include <stdio.h>

int main(){
	
	int day;
	
	printf("1. ������\n2. ȭ����\n3. ������\n4. �����\n5. �ݿ���\n6. �����\n7. �Ͽ���\n"); 

	scanf("%d",&day);
	
	if(day==1 || day==3 || day == 5 || day ==7){
		printf("oh my god");
	}else{
		printf("enjoy");
	}
	
	
	return 0;
}
