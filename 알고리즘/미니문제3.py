# print('a부터 b까지 정수의 합을 구합니다.')
# a = int(input('정수 a를 입력하세요. :'))
# b = int(input('정수 b를 입력하세요. :'))

# if a > b:
#   a, b = b, a #튜플

# sum = 0

# for i in range(a, b+1):
#   if i < b:
#     print(f' {i} +', end='')
#   else:
#     print(f'{i} = ', end='')
#   sum += i

# print(sum)
# 위에 코드에서 for loop 안의 if문에서 앞부분 if는 반복 시에 대부분 시행되지만 else 부분은 맨 마지막에만 시행된다.
# 따라서 else 에 해당하는 부분을 반복 부분이 아니고 반복이 끝난 이후에 시행되도록 코드를 변경하라.

print('a부터 b까지 정수의 합을 구합니다.')
a = int(input('정수 a를 입력하세요. :'))
b = int(input('정수 b를 입력하세요. :'))

if a > b:
  a, b = b, a #튜플

sum = 0

for i in range(a, b):
  print(f'{i} + ', end='')  # else 가 없어짐!!
  sum += i

print(f'{b} = ', end='')
sum += b

print(sum)