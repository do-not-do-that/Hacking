#include <stdio.h>

void bubble();

int main(){
	
	int arr[6];
	int i;
	printf("입력하세요!\n");
	for(i=0;i<6;i++){
		scanf("%d",&arr[i]);
	}
	
	bubble(arr);
	
	return 0;
} 

void bubble (int* p[]){
	int num=6;
	int i,j;
	int tmp;
	for(i=0;i<num-1;i++){
		for(j=0;j<num-i-1;j++){
			
			if(p[j]> p[j+1]){
				tmp=p[j];
				p[j]=p[j+1];
				p[j+1]=tmp;
			}
		}
	}
	for(i=0;i<num;i++){
		printf("%d",p[i]);
	}
}
