#include "UnrolledLL.h"

//recieved help from CA Lennon Okun during office hours

/**
 * Constructor for a node in the unrolled linked list.
 * This should create a node with the given block siz.
 * @param size Size of the list
 * @param blksize Size of each block
 */
uNode::uNode(uNode* prev, u_int64_t blksize) : blksize(blksize)
{
    /* Implement me! */

    // Allocate memory for data with block size
    datagrp = new int[blksize];
    next = nullptr;

    // If previous is null, set previous to current node
    if (prev == nullptr)
    {
        prev = this;
    }
    else 
    {
        prev->next = this;
    }
}

/**
 * Destructor for a node in the unrolled linked list.
 * This should deallocate all memory associated with the uNode.
 */
uNode::~uNode()
{
    delete[] datagrp;
}

/**
 * Constructor for the unrolled linked list.
 * This should create a linked list of uNodes.
 * @param size Size of the list
 * @param blksize Size of each block
 */

UnrolledLL::UnrolledLL(u_int64_t size, u_int64_t blksize)
{
    /* Implement me!*/
    head = nullptr;

    // Calcs the # of nodes needed in the linked list
    int size1 = (size + blksize - 1) / blksize;
    uNode* prev = nullptr;

    for (int i = 0; i < size1; i++)
    {
        uNode* track = new uNode(prev, blksize);

        // If head is the null pointer, set it to the current node
        if (head == nullptr)
        {
            head = track;
        }

        // Set the previous node to the current node
        prev = track;
    }
}

/**
 * Destructor for the unrolled linked list.
 * This should deallocate all memory associated with the unrolled linked list.
 */
UnrolledLL::~UnrolledLL()
{
    uNode* current = head;
    uNode* next;
    // Iterate through the LL and delete/deallocate the current node
    while (current != nullptr)
    {
        next = current->next;
        delete current;
        current = next;
    }

    // Sets the head as null pointer
    head = nullptr;
}

/**
 * Iterate through the unrolled linked list.
 * Simply iterate through the unrolled linked list and access each element.
 */
void UnrolledLL::iterate_ullist()
{
    /* Implement me! */
    uNode* curr = head;
    int track=0;

    // Iterates through and access each element in the data
    while (curr != nullptr)
    {
       
        for (int i = 0; i < curr->blksize; ++i)
        {
            track+=curr->datagrp[i];
        }
        curr = curr->next;
    }
}