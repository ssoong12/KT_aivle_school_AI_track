n, m = map(int, input().split())
land = [list(map(int, input().split())) for _ in range(n)]
max_value = 0

for i in range(n):
    for j in range(m):
        if j + 3 < m:
            # 가로로 4칸 선택
            value = land[i][j] + land[i][j+1] + land[i][j+2] + land[i][j+3]
            max_value = max(max_value, value)
        if i + 3 < n:
            # 세로로 4칸 선택
            value = land[i][j] + land[i+1][j] + land[i+2][j] + land[i+3][j]
            max_value = max(max_value, value)
        if j + 1 < m and i + 1 < n:
            # 가로로 2칸, 세로로 2칸 선택
            value = land[i][j] + land[i][j+1] + land[i+1][j] + land[i+1][j+1]
            max_value = max(max_value, value)
        if j + 2 < m and i + 1 < n:
            # 가로로 3칸, 세로로 2칸 선택
            value = land[i][j] + land[i][j+1] + land[i][j+2] + land[i+1][j+2]
            max_value = max(max_value, value)
        if j + 1 < m and i + 2 < n:
            # 가로로 2칸, 세로로 3칸 선택
            value = land[i][j] + land[i+1][j] + land[i+2][j] + land[i+2][j+1]
            max_value = max(max_value, value)
        if i + 1 < n and j - 1 >= 0 and j + 1 < m:
            # 대각선으로 2칸 선택
            value = land[i][j] + land[i+1][j-1] + land[i+1][j] + land[i+1][j+1]
            max_value = max(max_value, value)
        if j + 2 < m and i + 1 < n:
            # 가로로 3칸, 세로로 2칸 선택 (대각선)
            value = land[i][j] + land[i+1][j+2] + land[i+1][j+1] + land[i+1][j]
            max_value = max(max_value, value)

print(max_value)
