from hashlib import md5

# Input
i = 'wtnhxymk'

# Password
p = ''

# Current hash & counter
h = ''
n = -1

for m in xrange(8):
    while True:
        n += 1
        h = md5(i + str(n)).hexdigest()
        if h[:5] == '00000':
            break

    print '[{0}] ({3}) -> {1} *) {2}'.format(m, h, h[5], n)
    p += h[5]

print '[ {0} ]'.format(p)
