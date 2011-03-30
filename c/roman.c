#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char* times(int number, char c) {
  int i;
  char* ret = calloc(sizeof(char),number);
  
  for(i = 0; i < number; i++){
    ret[i] = c;
  }

  return ret;
}

char* createString(char c1, char c2) {
  char* ret = calloc(sizeof(char),2);
  
  ret[0] = c1;
  ret[1] = c2;

  return ret;
}

char* joinCharToString(char c, char* str) {
  int i;
  int len = strlen(str);
  char* retStr = calloc(sizeof(char),len+1);
  retStr[0] = c;
  
  for(i=1;i<len+1;i++){
    retStr[i] = str[i-1];
  }

  return retStr;
}

char* timesMany(int number, char onesChar, char fivesChar, char tensChar) {
  char* str;
  char* retStr = NULL;

  switch(number) {
  case 0:
    return NULL;
  case 1:
  case 2:
  case 3:
    return times(number, onesChar);
  case 4:
    return createString(onesChar, fivesChar);
  case 5:
  case 6:
  case 7:
  case 8:
    str = times(number - 5, onesChar);
    if(str != NULL){
      retStr =  joinCharToString(fivesChar, str);
      free(str);
    }
    return retStr;
  case 9:
    return createString(onesChar, tensChar);
  default:
    return NULL;
  }  
}

char* append(char* dest, char* src) {
  if(dest != NULL && src != NULL){
    dest = strcat(realloc(dest,sizeof(char)*(strlen(dest)+strlen(src)+1)),src);
    free(src);
  }
  return dest;
}

int main(int argc, char *argv[]) {
  int number, thousands, hundreds, tens, ones;
  char* ret;
  char* tmpStr;
  
  if(argc < 2){
    printf("You have to supply a number to convert!\n");
    return 65;
  }
  
  number = atoi(argv[1]);

  thousands =  number / 1000;
  ret = times(thousands,'M');
  
  hundreds = number / 100 % 10;
  tmpStr = timesMany(hundreds,'C', 'D', 'M');
  ret = append(ret,tmpStr);

  tens = number / 10 % 10;
  tmpStr = timesMany(tens,'X', 'L', 'C');
  ret = append(ret,tmpStr);

  ones = number % 10;
  tmpStr = timesMany(ones,'I', 'V', 'X');
  ret = append(ret,tmpStr);

  printf("%s\n",ret);

  if( ret != NULL){
    free(ret);
  }

  return EXIT_SUCCESS;
}
