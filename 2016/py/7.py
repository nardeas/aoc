import re

# Long input
i = '''
'''

# Input as list of strings
l = filter(lambda x: x != '', i.split("\n"))

# Basically has abba function
def h(s):
    for i in range(len(s) - 3):
        if s[i] == s[i+3] and s[i+1] == s[i+2] and s[i] is not s[i+1]:
            return True
    return False

# Total count of valid strings
r = 0
t = 0

# Loop through strings
for s in l:

    # Get group a (should have abba)
    a = re.split("\[.*?\]", s)

    # Get [x]
    b = re.findall("\[(.*?)\]", s)

    # Check abba for each item in a and filter (should have abba)
    j = filter(bool, [h(x) for x in a])

    # Check abba for each item in b and filter (should not have abba)
    k = filter(bool, [not h(x) for x in b])

    # Increment result count if at least 1 abba in a and 0 abbas in b
    r = r + 1 if (len(j) and len(k) == len(b)) else r

# Print result
print r
