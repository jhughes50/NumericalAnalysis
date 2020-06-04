# Numerical Analysis Midterm 1 Problem 1

# Part A

import math
import numpy as np
import matplotlib.pyplot as plt


def build_matrix(h,yn):

   A = 3.58502082
   B = 2.16529366
   
   a = np.array([[2*h,h,0,0],[h,(2*(h+h)),h,0],[0,h,(2*(h+h)),h],[0,0,h,(2*(h+h))]])
   b = np.array([(3*((yn[1]-yn[0])/h)) - 3*A, (3*((yn[2]-yn[1])/h))-(3*((yn[1]-yn[0])/h)), (3*((yn[3]-yn[2])/h))-(3*((yn[2]-yn[1])/h)), 3*B - (3*((yn[3]-yn[2])/h))])

   return(a,b)

def calculate(q,xn,aj,bj,cj,dj):

   # calculating S(0.25) and f(0.25)
   # q statnd for one-quarter, ie 0.25
   sq = aj[1] + (bj[1]*(q-xn[1])) + (cj[1]*(q-xn[1])*(q-xn[1])) + (dj[1]*(pow((q-xn[1]),3)))
   fq = (q * math.cos(q)) - (2*(q**2)) + (3*q) -1 

   # calculating S'(0.25) and f'(0.25) 
   # NOTE: S' is denoted by sp and f' by fp
   spq = bj[1] + (2*cj[1]*(q-xn[1])) + ((3*dj[1])* (pow((q-xn[1]),3)))
   fpq = (-q * math.sin(q)) + (math.cos(q)) - (4*q) + 3

   error = abs(sq - fq)
   error_prime = abs(spq - fpq)

   print ('\naj: ', aj)
   print ('\nbj: ', bj)
   print ('\ncj: ', cj)
   print ('\ndj: ', dj, '\n')

   print ('\nS(0.25) = ', sq)
   print ('f(0.25) = ', fq)

   print ('\nSp(0.25) = ', spq)
   print ('Fp(0.25) = ', fpq)

   print ('\nError f(0.25): ', error)
   print ('Error fp(0.25): ', error_prime, '\n')


n = 3
xn = [0.1,0.2,0.3,0.4]
yn = [-0.62049958,-0.28398668,0.00660095,0.24842440]
   
aj = [-0.62049958,-0.28398668,0.00660095,0.24842440]
bj = []
  
h = 0.1
a,b = build_matrix(h,yn)

cj = np.linalg.solve(a,b)
dj = [] 
sj = []
fx = []

for i in range(n):
   bj.append( ((1/h)*(aj[i+1]-aj[i])) - ((h/3)*(2*cj[i]+cj[i+1])) )

for k in range(n):
   dj.append( (cj[k+1] - cj[k]) / (3*h) )

for j in range(n):
   xj = np.linspace(xn[j],xn[j+1],50)
    
   for l in range(len(xj)):
      sj.append( aj[j] + (bj[j]*(xj[l]-xn[j])) + (cj[j]*(xj[l]-xn[j])*(xj[l]-xn[j])) + (dj[j]*(pow((xj[l]-xn[j]),3))) )
      fx.append( (xj[l] * math.cos(xj[l])) - (2*(xj[l]**2)) + (3*xj[l]) -1 )

   plt.plot(xj,sj,'b')
   plt.plot(xj,fx,'r--')

   fx.clear()
   sj.clear()

calculate(0.25,xn,aj,bj,cj,dj)

plt.show()


