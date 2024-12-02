#include <stdio.h>

unsigned long int result[256];

char* concat_array(unsigned long int* arr, unsigned long int len)
{
    int k = 0;
    for(int i=0; i<len; i++)
    {
        unsigned long int x=arr[i];
        char* ascii_x = itoascii(x);
        int j=0;
        while(ascii_x[j]!='\0')
        {
            result[k]=ascii_x[j];
            j++;
            k++;
        }
        result[k] = ' ';MO
        k++;
    }

    /*
    int i =0;
    while(i<len)
    {
       unsigned long int x=arr[i];
        char* ascii_x = itoascii(x);
        int j=0;
        while(ascii_x[j]!='\0')
        {
            result[k]=ascii_x[j];
            j++;
            k++;
        }
        result[k] = ' ';MO
        k++;
        i++; 
    }*/
    result[k] = '\0';
    return result;
}

main()
{
    unsigned long int arr[] = {10,20,30};
    char* ret = concat_array(arr, 3);
}