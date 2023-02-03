# 실습 1
# Q) 2~1000 사이의 수 중에서 소수를 리스트에 입력하고 출력하여라.
# 소수(prime number)는 자신과 1 이외의 정수로 나누어 떨어지지 않는 정수이며, 2는 소수임

# 일반 방식
n = 1000

def isPrime(a):
  if(a<2):
    return False
  for i in range(2,a):
    if(a%i==0):
      return False
  return True

for i in range(n+1):
  if(isPrime(i)):
    print(i)
