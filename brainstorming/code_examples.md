# Pointers code examples

## Basics

Declaring a pointer variable:
```C
int *p;
```

Creating a pointer to a variable:
```C
int i = 5;
int *p = &i;
```

Accessing a value using a pointer:
```C
int i = 5;
int *p = &i;
printf("%d\n", *p);
```

Updating a value using a pointer:
```C
int i = 5;
int *p = &i;
*p += 3;
```

Pointing to a different variable:
```C
int i = 5;
int *p = &i;
int i2 = 6;
p = &i2;
```

Duplicating a pointer:
```C
int i = 5;
int *p = &i;
int *p2 = p;
```

## Double pointers
Creating a double pointer:
```C
int i = 5;
int *p = &i;
int **dp = &p;
```

Accessing a value using a double pointer:
```C
int i = 5;
int *p = &i;
int **dp = &p;
printf("%d\n", **dp);
```

Updating a value using a double pointer:
```C
int i = 5;
int *p = &i;
int **dp = &p;
**dp += 3;
```

Pointing to a different variable:
```C
int i = 5;
int *p = &i;
int **dp = &p;
int i2 = 6;
*dp = &i2;
```

Pointing to a different pointer:
```C
int i = 5;
int *p = &i;
int **dp = &p;
int i2 = 6;
int *p2 = &i2;
dp = &p2;
```

## Pointers as parameters

## Arrays and pointers
