// this is a program that will take an input argument, a number
// and return hello world printed that many times
// helloworldnum.c
// made by Shawn Farnham on 10-7-2024

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]){ 
  if (argc != 2){
    printf("please make sure this is called as follows: \n");
    printf("  \"programName\" #   where # is a positive int\n");
    return 1;
  } 
  int n = atoi(argv[1]);
  printf("printing Hello World %d times!\n", n);
  for (int i = 0; i<n; i++){
    printf("Hello World\n");
  } 
  return 0;
}
