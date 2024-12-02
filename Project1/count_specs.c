#include <stdio.h>

unsigned long int count_specs(char* str)
{
    unsigned long int count=0;
    unsigned long int i=0;
    while(str[i]!='\0')
    {
        if(str[i]=='%'&&str[i+1]=='a')
        {
            count++;
        }
        i++;
    }

    return count;
}

int main()
{
    printf("%ld", count_specs("3fjds%a988h190jk1gh32189321h %a j21gh9285%1J3125%"));

    return 0;
}