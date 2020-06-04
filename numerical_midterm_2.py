# Numerical Analysis Midterm Problem 2

import numpy as np
import math


def f1(x,y):

   z = (2*(x**2)) + (y**2) - (5*x*y) + (2*x) - (2*y) + 1
   return (z)

def f2(x,y):

   z = (y**2) - (2*x*y) + (y) - (3*x) + 1
   return (z)

def delf1delx(x,y):

   q = (4*x) - (5*y) + 2
   return (q)

def delf1dely(x,y):

   q = (2*y) - (5*x) - 2
   return (q)

def delf2delx(x,y):

   p = (-2*y) - 3
   return (p)

def delf2dely(x,y):

   p = (2*y) - (2*x) +1
   return (p)


if __name__ == '__main__':

   xn = np.array([-10,-10])  # (10j,10j)
   

   for n in range(10):
     
       x = xn[0]
       y = xn[1]

       a = delf1delx(x,y)
       b = delf1dely(x,y)
       c = delf2delx(x,y)
       d = delf2dely(x,y)

       J = np.array([[a,b],[c,d]])
       Jinv = np.linalg.inv(J)

       z1 = f1(xn[0],xn[1])
       z2 = f2(xn[0],xn[1])

       z = np.array([z1,z2])

       xn = xn - (np.matmul(Jinv,z))
      
       print(xn)
       

