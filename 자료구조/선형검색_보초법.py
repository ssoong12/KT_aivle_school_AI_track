# Q) 아래 리스트에서 검색값을 찾으려고 한다. 선형 검색 While문을 사용하는 경우와,
# 보초법을 사용하는 경우에 각각에 if 조건문이 몇 번 실행되지는 수를 세어 출력하라.

# a = [2, 5, 1, 3, 9, 6, 7] 
# 검색값 : 7

# 선형검색
def seq_search_sentinel(b, key):
  # 보초법. 보초 추가
  a = b.copy()
  a.append(key)
  
  i = 0
  while True:
    if a[i] == key:
      break
    i += 1
    
  return -1 if i == len(b) else i