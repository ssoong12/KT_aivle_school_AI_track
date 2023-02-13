# 실습 3
# Q) 리스트와 검색할 값을 사용자로부터 입력받아서 검색 값이 있는 인덱스를 출력하라.
# 검색 방안은 어떤 방안을 사용하여도 괜찮음

# 기초 검색 알고리즘
def seq_search(a, key):
  i = 0
  
  while True:
    # 실패
    if i == len(a):
      return -1
    # 성공
    if a[i] == key:
      return i
    i += 1
    
# 입력 로직
print('리스트와 검색할 값을 입력받아 검색값이 있는 인덱스 출력할거임')
print('End 입력하면 원소 입력 종료함')
i = 0
x = []

while True:
  s = input(f'x[{i}]값을 입력하쇼 : ')
  if s == 'End':
    break
  x.append(int(s))
  i += 1
  
key = int(input('검색할 값을 입력하셍'))

index = seq_search(x, key)

print(f'검색값 {key}는 a[{index}]에 있다!')