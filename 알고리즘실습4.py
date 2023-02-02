# Q) 사용자에게 정수를 입력 받아, root ** pwr 값이 사용자가 입력 한 정수와 같은
# 두 개의 정수 root 및 pwr을 찾아 출력하라 (단, 1 < pwr < 6 ). 그러한 정수 쌍이 없으면
# 결과가 없음을 출력하라.
# (root ** pwr은 root를 pwr 만큼 거듭제곱하였다는 뜻이다. 예를 들어 2**3 은 2의 세 제
# 곱이며 값은 8이다.)

# root ** pwr ( 1 < pwr < 6 )

number = int(input('숫자를 입력하세요 : '))
flag = 0

for root in range(1, number+1):
  for pwr in range(2, 6):
    if (root ** pwr) == number:
      print(f'{root}**{pwr} = {number}입니다')
      flag = 1
      
if flag == 0:
  print('해당하는 결과가 없습니다.')