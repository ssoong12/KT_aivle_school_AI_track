# 실습 1
# Q) 2~1000 사이의 수 중에서 소수를 리스트에 입력하고 출력하여라.
# 소수(prime number)는 자신과 1 이외의 정수로 나누어 떨어지지 않는 정수이며, 2는 소수임

# 일반 방식
# n = 1000

# def isPrime(a):
#   if(a<2):
#     return False
#   for i in range(2,a):
#     if(a%i==0):
#       return False
#   return True

# for i in range(n+1):
#   if(isPrime(i)):
#     print(i)

# 에라토스테네스의 체 방식
n = 1000
a = [False, False] + [True]*(n-1) 
# 0이랑 1은 소수에서 애초에 탈락시키고 시작. 그래서 [False, False] 
# 나머지는 우선 True로 하면서 쭉 탐색하고 소수 아니면 False로 바꾸는 것 [True]*(n-1) 
# n + 1만큼 True로 만든 리스트를 두고 0, 1은 소수가 아니니까 Fasle.
primes = []

for i in range(2, n+1): # 2부터 1000까지 for문 돌리기
  if a[i]:
    primes.append(i) # 2부터 순차적으로 순회하면서 일단 배열에 넣고 
    for j in range(2*i, n+1, i): # range(MIN, MAX, GAP)
      # 2가 소수고, 2의 배수는 소수가 아니다. 그래서 2*i로 모든 2의 배수를 거른다.
      # 2가 소수면 2의 배수는 다 소수가 아니니까 False로 만들고 그다음 True(소수)가 나오면 그 다음 소수의 배수를 다 False로 만드는 로직
      a[j] = False
print(primes)