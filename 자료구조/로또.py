# Q1
def solution(lottos, win_nums):
  rank_rules = {6:1, 5:2, 4:3, 3:4, 2:5, 1:6, 0:6}
  undatemined = lottos.count(0)
  winning = 0
  for i in lottos:
    if i in win_nums:
      winning += 1
  return [rank_rules[winning+undatemined], rank_rules[winning]]