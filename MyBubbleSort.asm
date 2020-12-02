; outline of bubble sort program
ldc 0x1000 
a2sp 
adj -1 
ldc 11 
stl 0 
ldc array
call sort
HALT 
; 
; Areg= return address 
; Breg= address of elements 
; SP+0= number of elements sort
; int* sort(int* in,int count)
;{
;   int x;
;   int y;
;   int temp;
;   for(x=0;x < count-1;x++)
;   {
;       for(y=1;y<count-x;y++)
;       {
;           if(((in+y))>((in+y-1)))
;           {
;               temp=(*(in+y-1));
;               ((in+y-1))=((in+y));
;               (*(in+y))=temp;
;           }
;       }
;   }
;   exit:return;
;} 
sort: adj -1
stl 0
;save return address
stl 2
;save address of elements
adj -3
ldc 0
stl 0
;save temp
ldc 1
stl 1
;save y
ldc 0
stl 2
;save x
loop_out: ldl 4
;load count
ldl 2
;load x
sub
;count - x
ldc 1
sub
;count-1-x
brz done
ldc 1
stl 1
;y = 1
loop_in: ldl 4
;load count
ldl 2
;load x
sub
;count - x
ldl 1
;load y 
sub 
;count - x -y
brz addx
ldl 5
;load address of elements
ldl 1
ldc 1
sub
ldl 5
add
stl 6
ldl 1
ldl 5
add
stl 7
ldl 7
ldnl 0
ldl 6
ldnl 0
sub
;array[y-1]-array[y]
brlz swap
br addy
swap: 
ldl 6
;load address of elements
ldnl 0
;array[y-1]
stl 0
;temp = array[y-1]
ldl 7
ldnl 0
;array[y]
ldl 6
stnl 0
;array[y-1] = array[y]
ldl 0
;load temp
ldl 7
stnl 0
;array[y] = temp
;increment
addy: ldc 1
ldl 1
;load y
add
;y++
stl 1
;save y++
br loop_in
addx: ldc 1
ldl 2
;load x 
add
;x++
stl 2
ldc 1
ldl 5
add
;array++
br loop_out
done: ldl 3
;load return address
adj 5
;sp = array
return
;ok, 
array: data 9 
data 8 
data 7 
data 6 
data 5 
data 4 
data 3 
data 2
data 1 
data 0
data 0