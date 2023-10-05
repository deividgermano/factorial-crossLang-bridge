#!/bin/python3

import sys
import subprocess
import time

def fact(n):
    n = int(n)
    if n <= 1:
     time.sleep(10)
     return 1
    else:
     p = subprocess.run("./factorial_java.sh %s" % (n - 1), shell=True, stdout=subprocess.PIPE)
     result = p.stdout.decode()
     return n * int(result)
print(fact(sys.argv[1]))