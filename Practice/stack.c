#include <stdio.h>
#include <stdlib.h>

struct stack
{
    int size;
    int top;
    int *arr;
};

int isEmpty(struct stack *ptr)
{
    return ptr->top == -1;
}

int isFull(struct stack *ptr)
{
    return ptr->top == ptr->size - 1;
}

void push(struct stack *ptr, int val)
{
    if (isFull(ptr))
    {
        printf("Stack Overflow! Cannot push %d\n", val);
    }
    else
    {
        ptr->top++;
        ptr->arr[ptr->top] = val;
        printf("%d pushed to stack\n", val);
    }
}

int pop(struct stack *ptr)
{
    if (isEmpty(ptr))
    {
        printf("Stack Underflow! Cannot pop from empty stack\n");
        return -1;
    }
    else
    {
        int val = ptr->arr[ptr->top];
        ptr->top--;
        return val;
    }
}

void display(struct stack *ptr)
{
    if (isEmpty(ptr))
    {
        printf("Stack is empty\n");
    }
    else
    {
        printf("Stack elements are: ");
        for (int i = 0; i <= ptr->top; i++)
        {
            printf("%d ", ptr->arr[i]);
        }
        printf("\n");
    }
}

int main()
{
    struct stack *s = (struct stack *)malloc(sizeof(struct stack));
    if (s == NULL)
    {
        printf("Struct memory allocation failed\n");
        return -1;
    }

    s->size = 80;
    s->top = -1;
    s->arr = (int *)malloc(s->size * sizeof(int));
    if (s->arr == NULL)
    {
        printf("Array memory allocation failed\n");
        free(s);
        return -1;
    }

    push(s, 10);
    push(s, 20);
    push(s, 30);
    display(s);
    printf("%d popped from stack\n", pop(s));
    display(s);

    free(s->arr);
    free(s);

    return 0;
}
