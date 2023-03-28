# 소수인지 아닌지 판별하는 함수
def is_prime(num):
  # num이 2보다 작으면 소수가 아니므로 False 반환
  if num < 2:
    return False
  # 그 외의 경우(2부터 num의 제곱근까지)
  for i in range(2, int(num ** 0.5) + 1):
    # num을 나누고 나누어 떨어지면 소수가 아니므로 False 반환
    if num % i == 0:
      return False
  # 만약 모든 수에 대해서 나누어 떨어지지 않으면 소수이므로 True 반환
  return True

# num의 소인수를 구하는 함수
def get_prime_factors(num):
  factors = []
  # 2부터 num까지 모든 수에 대해 
  for i in range(2, num + 1):
    # is_prime 함수 호출해서 소수 판별 후 
    if is_prime(i) and num % i == 0:
      # num을 나누어 떨어지게 하는 소수 factors 리스트에 추가
      factors.append(i)
  return factors

# a를 임력받아 get_prime_factors() 함수 호출하여 a의 소인수를 구하는 함수
def get_numbers(a):
  factors = get_prime_factors(a)
  # factors 리스트의 저장된 소수 개수가 2보다 작으면
  if len(factors) < 2:
    # a를 두 소수의 곱으로 나타낼 수 없으므로 IMPOSSIBLE 반환
    return "IMPOSSIBLE"
  # factors 리스트의 모든 소수에 대해
  for factor in factors:
    # 다른 소수와 곱했을 때 a가 되는 경우를 찾음
    if not is_prime(a // factor):
      continue
      # 먼저 찾은 소수와 작은 소수를 곱한 경우를 출력하므로 factors 리스트 순회하며 찾은 첫 번째 쌍 출력
    return str(factor) + " " + str(a // factor)
  # 만약 어떤 소수와 곱했을 때도 a가 되지 않는 경우 IMPOSSIBLE 반환
  return "IMPOSSIBLE"

# 입력값 
a = int(input())

# 출력값
result1 = get_numbers(a)
print(result1)

result2 = get_numbers(44)
print(result2)