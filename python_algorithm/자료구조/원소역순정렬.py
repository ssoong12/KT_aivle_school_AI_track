# Q) 리스트를 사용자로부터 입력받아서 역순으로 정렬하여 원소를 출력하여라

def reverse_list(a):
  n = len(a)
  for i in range(n // 2):
    a[i], a[n-i-1] = a[n-i-1], a[i]

# # 빈 배열 생성    
# a = []
# # 띄어쓰기로 구분된 여러 개 숫자 입력값을 리스트에 넣고 싶은 경우 map()을 이용한다. (문자는 list()만) 
# aList = list(map(input('배열에 뭐 들어갈지 하나씩 입력해봐 끝낼땐 end 치고').split()))
# a.append(aList) # 빈 배열에 입력한 원소 넣어주기
# reverse_list(a)
# print(a)

print('리스트 역순으로 출력해볼게')
num = int(input('원소의 수를 입력'))
x = [None] * num # 원소 수가 num인 리스트를 생성

for i in range(num):
  x[i] = int(input(f'x[{i}]값을 입력하시라요: '))
  
reverse_list(x)

print(f'리스트를 역순으로 출력한다')
for i, value in enumerate(x):
  print(f'x[{i}] = {value}')