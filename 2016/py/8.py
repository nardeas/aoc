# Long input
i = '''
'''

# Input as list
l = filter(lambda x: x != '', i.split("\n"))

# Screen buffer
z = list((["." for i in range(50)], )*6)

# Render to buffer with command
def r(s, z):

    # Split by whitespace
    y = s.split()

    # Arguments to command
    a = 0
    b = 0

    # Left shift list
    ls = lambda l, n: l[-n:] + l[:-n]

    # For rect command a simple substitution with "#" starting from 0x0
    # workds best
    if y[0] == "rect":
        a, b = [int(x) for x in y[1].split("x")]
        for n in xrange(b):
            z[n] = ["#" for t in range(a)] + z[n][a:]

    # For rotate commands we use ls
    elif y[0] == "rotate":
        a = int(y[2].split("=")[-1])
        b = int(y[-1])

        # Column rotate utilizing left shift after column-row transposition
        # and back
        if y[1] == "column":
            t = [list(x) for x in zip(*z)]
            t[a] = ls(t[a], b)
            z = [list(x) for x in zip(*t)]

        # Simple left shift for rows
        elif y[1] == "row":
            z[a] = ls(z[a], b)

    return z


# Loop through commands for final output buffer
for c in l: z = r(c, z)

# Output screen buffer
o = "\n".join(["".join(x) for x in z])

# Print output
print
print o

# How many pixels should be lit?
print "\nLit pixels: {0}".format(o.count("#"))
