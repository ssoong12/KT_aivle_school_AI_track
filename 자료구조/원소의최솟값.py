def min_of(a):
  minimum = a[0]
  for i in range(1, len(a)):
    if a[i] < minimum:
      minimum = a[i]
  return minimum

t = (5, 4, 12, 9.5, 31, 3.14, 1)
s = 'string'
a = ['DTS', 'AAC', 'FLAC']

print(f'{min_of(t)}')
print(f'{min_of(s)}')
print(f'{min_of(a)}')