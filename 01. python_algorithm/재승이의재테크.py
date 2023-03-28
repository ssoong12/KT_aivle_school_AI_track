def find_max_days(n, k, prices):
    max_days = 0
    start = 0
    end = 0
    num_of_decreases = 0

    while end < n:
        if end > 0 and prices[end] < prices[end-1]:
            num_of_decreases += 1

        if num_of_decreases > k:
            if prices[start] < prices[start+1]:
                num_of_decreases -= 1
            start += 1

        end += 1

        if end - start > max_days and num_of_decreases <= k:
            max_days = end - start

    return max_days

n, k = map(int, input().split())
prices = list(map(int, input().split()))

max_days = find_max_days(n, k, prices)

# max_days의 값을 가지는 구간 중 가장 마지막 구간 찾기
start = -1
end = -1
num_of_decreases = 0
for i in range(n):
    if i > 0 and prices[i] < prices[i-1]:
        num_of_decreases += 1

    if num_of_decreases > k:
        if prices[start+1] < prices[start+2]:
            num_of_decreases -= 1
        start += 1

    if i - start > max_days and num_of_decreases <= k:
        max_days = i - start
        end = i

print(start+1, end+1)

