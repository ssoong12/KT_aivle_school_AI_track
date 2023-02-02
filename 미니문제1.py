# 다음은 A, B 두 수도 회사의 요금 체계이다.
# A : 1L 당 요금 100원,
# B : 50L 이하, 1L당 요금 150원, 50L 초과는 1L당 75원
# 두 수도 회사와 수도 사용량을 입력받아서 지불해야하는 수도 요금을 계산하는 waterPay()를 만들고, 수도 회사와 수도 사용량을 입력받아 요금을 출력하라.

def waterPay(company, liter):
  if company == 'a':
    payment = liter * 100
  elif company == 'b':
    if liter <= 50:
      payment = liter * 150
    elif liter > 50:
      payment = liter * 75
  return payment

print(f'''얼마를 내야 하냐면... {waterPay('b', 87)}원이야~ ''')