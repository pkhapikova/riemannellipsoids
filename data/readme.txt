Place to put data, which is .mat files containing t and y 
Format of title: lengths of axes, then lengths of w components (where w are components of L that contribute to swirl)

Batch 1: a=b and L = 0, change a
Batch 2: a = b = 0.75, and w1=w2=0. change w3
Batch 3: keep axes constant and a=b. let w1=w2=w3, and increase from 0.1 to 1 (it blows up when w >= 0.7)
Batch 4: a = b = 0.75, and w3=0. change w2 (or w1, equivalent)
