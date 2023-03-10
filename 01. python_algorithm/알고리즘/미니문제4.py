# area = int(input('직사각형의 넓이를 입력하세요.'))

# for i in range(1, area + 1):
#   if i * i > area: break
#   if area % i : continue
#   print(f'{i} x {area // i}')

# Q) 위의 코드는 두 변의 길이 순서를 고려하지 않고 가능한 조합만 표시되었다. 앞변과 뒷변의 길이를 고려하여 가능한 모든 경우가 표시되게 수정

# 출력 결과) 직사각형의 넓이를 입력하세요 : 32
# 1 x 32
# 2 x 16
# 4 x 8
# 8 x 4
# 16 x 2
# 32 x 1

area = int(input('직사각형의 넓이를 입력하세요.'))

for i in range(1, area + 1):
  if area % i : continue
  print(f'{i} x {area // i}')