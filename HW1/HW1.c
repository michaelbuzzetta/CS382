/*******************************************************************************
 * Name : HW1.c
 * Author : Michael Buzzetta
 * Date : September 22
 * Pledge : I pledge my honor that I have abided by the Stevens Honor System.
 ******************************************************************************/
 //Recieved help from CA and tutors
#include <stdio.h>
#include <string.h>
    /*
    Your name and honor code
    State the sorting algorithm you chose in task 3
    State if you want to be considered for bonus points in task 3
    */
    void copy_str(char* src, char* dst) 
    {
        /* Your code here */
        copy_function:
            if (*src!= '\0') {
                *dst = *src;
                src++;
                dst++;
                goto copy_function;
            }
            else 
            {
                *dst = '\0'; // Null-terminate dst
            }
    }
    int dot_prod(char* vec_a, char* vec_b, int length, int size_elem) 
    {
        /* Your code here
        Do not cast the vectors directly, such as
        int* va = (int*)vec_a;
        */

        int result = 0;
        int i = 0;

        dot_product_loop:
            if (i < length) 
            {
                int a = *(int*)(vec_a + i * size_elem);
                int b = *(int*)(vec_b + i * size_elem);

                result += (a) * (b);
                i++;
                goto dot_product_loop;
            }

        return result;
    }
    
    void sort_nib(int* arr, int length) 
    {
        int nibbles[16];
        int k = 0;
        loop1:
            if(k<16)
            {
                nibbles[k]=0;
                k++;
                goto loop1;
            }

        char* bytes = (char*)arr;
        int x = 0;
        loop2:
            if(x<length*sizeof(int))
            {
                char nib = (bytes[x]>>4)&0x0F;
                nibbles[nib]++;
                nib=bytes[x]&0xF;
                nibbles[nib]++;
                x++;
                goto loop2;
            }

        int i = 0;
        int y=0;
        loop3:
            if(y<length)
            {
                char* bytes = (char*) (arr + y);
                int m=7;
                loop4:
                    if(m>=0)
                    {
                        increment:
                            if(nibbles[i]!=0)
                            {
                                goto stop;
                            }
                            else
                            {
                                i++;
                            }
                            goto increment;

                        stop:

                        if(m % 2 == 1) 
                        {
                            bytes[m/2] = (bytes[m/2]&0xF)+(i<<4);
                            nibbles[i]--;
                        } 
                        else 
                        {
                            bytes[m/2]=(bytes[m/2]&0xF0)+(i);
                            nibbles[i]--;
                        }
                        m--;
                        goto loop4;
                    }
                y++;
                goto loop3;
            }
    }
    int main(int argc, char** argv) 
    {
        /**
        * Task 1
        */
        char str1[] = "382 is the best!";
        char str2[100] = {0};
        copy_str(str1,str2);
        puts(str1);
        puts(str2);
        /**
        * Task 2
        */
        int vec_a[3] = {12, 34, 10};
        int vec_b[3] = {10, 20, 30};
        int dot = dot_prod((char*)vec_a, (char*)vec_b, 3, sizeof(int));
        printf("%d\n",dot);
        /**
        * Task 3
        */
        int arr[3] = {0x12BFDA09, 0x9089CDBA, 0x56788910};
        sort_nib(arr, 3);
        for(int i = 0; i<3; i++) {
        printf("0x%08x ", arr[i]);
        }
        puts(" ");
        return 0;
    }