#include <stdio.h>

char buffer[128];

int intToAscii(unsigned long int number) 
{
   buffer[127]="\0";
   int i=126;
   do
      {
         // UDIV X2, X0, X1
         // MSUB X3, X2, X1, X0

         buffer[i]=(number%10) + '0';
         number=number/10; 
         i--;
      }
   while(number!=0);
   return buffer +i+1;
}
main() 
{
   printf(intToAscii(5));
   printf(intToAscii(8));
}

