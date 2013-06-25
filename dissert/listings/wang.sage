var('d x y z')
R.<d, x, y, z> = GF(17^17, 'a')[]
S = R.quotient([x^2 * y + x * y^2 + d * x * y * z + z^3])

def add((x1, y1, z1), (x2, y2, z2)):
    x3 = S(x1 * x2 * (y1 * z2 - y2 * z1)^2)
    y3 = S(y1 * y2 * (x1 * z2 - x2 * z1)^2)
    z3 = S((x1 * z2 - x2 * z1) *
           (y1 * z2 - y2 * z1) *
           (x2 * y2 * z1^2 - x1 * y1 * z2^2))
    return (x3, y3, z3)

o, p = (1, -1, 0), (x, y, z)

for pair in cartesian_product_iterator([(o, p)] * 2):
    print "add{0}\t=\t{1}".format(pair, add(*pair))
