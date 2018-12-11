# Input
with open('6.in', 'r') as infile:
    i = infile.read()

# Input as list
l = filter(lambda x: x != '', i.split("\n"))

# Row-column transposition
ls = [''.join(x) for x in zip(*l)]

# Descrambler for result sentence
s = ''.join([max([(x, m.count(x)) for x in set(m)], key=lambda y: y[1])[0] for m in ls])

print s
