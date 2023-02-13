# 네 정수의 최댓값을 구하는 함수를 작성하고, 값을 입력받아 최댓값을 출력하라
def max4(a, b, c, d):
  maximum = a
  if b > maximum:
    maximum = b
  if c > maximum:
    maximum = c
  if d > maximum:
    maximum = d
  return maximum # 최대값 반환

print(f'max4(156, 879, 14, 475) = {max4(156, 879, 14, 475)}')