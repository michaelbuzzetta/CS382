/*******************************************************************************
* Filename: binary.c
* Author: Michael Buzzetta
* Date: September 13, 2023
* Pledge: I pledge my honor that I have abided by the Stevens Honor System.
******************************************************************************/
//Recieved help from CA during office hours
//worked by myself, no partner
#include <stdio.h>
#include <stdlib.h>

void display(int8_t bit) 
{
    putchar(bit + 48);
}

void display_32(int32_t num) 
{
    for(int i=31; i>=0; i--)
    {
        if(num>>i&1==1)
        {
            display(1);
        }
        else
        {
            display(0);
        }
    }
}

int main(int argc, char const *argv[]) 
{
    display_32(382);
    return 0;
}