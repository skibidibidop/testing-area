#include <stdio.h>
#define MAXCHAR 1000

int main(void) {
    char name[MAXCHAR];
  
  	printf("Enter name\n");
  	scanf("%s", &name[0]);
  	printf("Hello %s\n", name);
  
  	return 0;
}