# 미니 실습 3
# Q) 아래 리스트에서 검색값을 찾으려고 한다. 선형 검색 While문을 사용하는 경우와,
# 보초법을 사용하는 경우에 각각에 if 조건문이 몇 번 실행되지는 수를 세어 출력하라.

# a = [2, 5, 1, 3, 9, 6, 7] 
# 검색값 : 7

# 선형 검색 - 일반
# for문으로 작성한 선형 검색 알고리즘
def seq_search_for(a, key):
  i = 0
  lena = len(a)
  count = 0
  while True:
    count += 1
    if i == lena:
      return count
    count += 1
    if a[i] == key:
      return count
    i += 1
    
# 선형 검색 - 보초법
def seq_search_sentinel(b, key):
  # 보초법, 보초 추가
  a = b.copy()
  a.append(key)
  count = 0
  i = 0
  while True:
    count += 1
    if a[i] == key:
      break
    i += 1
    
  return count

# 입력 구문
a = [2, 5, 1, 3, 9, 6, 7]
index1 = seq_search_for(a, 7) # if 조건문 14번 실행 > key 값이 아닌 경우도 포함해서 세기 때문
index2 = seq_search_sentinel(a, 7) # if 조건문 7번 실행 > 추가된 보초(n-1)의 값이 key값이면 실패하는 걸 반환하는 로직이라서 조건문 절반으로 절감 

print (index1, index2)