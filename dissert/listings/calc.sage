var('d1 d2 x y z u v u1 v1 u2 v2 u3 v3 b a6 sqrtA6')

R.<d1, d2, x, y, z, u, v, u1, v1, u2, v2, u3, v2, b, a6, sqrtA6> = GF(2)[]

def U_V(x, y, z):
    tmp = d1 * x * y + d1^2 * (x + y) * z
    u = sqrtA6 * ((x + y) * z / tmp)
    v = sqrtA6 * (((b + 1) * x * z + b * y * z) / tmp + 1 + 1 / d1)
    return u, v

def Lambda_Theta(case):
    if case == 1:
        Lambda = (v2 + v1) / (u2 + u1)
    elif case == 2:
        Lambda = (u1^2 + v1) / u1
    Theta = v1 + Lambda * u1
    return Lambda, Theta

def g(case, (u, v)):
    Lambda, Theta = Lambda_Theta(case)
    return (v + Lambda * u + Theta) / (u + u3)

h_1 = g(1, U_V(x, y, z))
N_1, D_1 = h_1.numerator(), h_1.denominator()

h_2 = g(2, U_V(x, y, z))
N_2, D_2 = h_2.numerator(), h_1.denominator()

print(D_1 ==
      D_2 ==
      (u1 + u2) * (u3 * d1 * (d1*x*z + d1*y*z + x*y) + sqrtA6 * z * (x + y)))

print(N_1 ==
            z * (x + y) * d1^2 * (v1*u2 + u1*v2 + u1*sqrtA6 + u2*sqrtA6)
        +   sqrtA6 * (u1 + u2) * d1 * (x*y + x*z + y*z)
        +   y * x * d1 * (v1*u2 + u1*v2)
        +   sqrtA6 * (x*z*u1*b + y*z*u1*b + x*z*u2*b + y*z*u2*b + x*y*u1 +
            x*z*u1 + x*z*v1 + y*z*v1 + x*y*u2 + x*z*u2 + x*z*v2 + y*z*v2))

print(N_2 ==
            u1 * z * (x + y) * d1^2 * (u1^2 + sqrtA6)
        +   u1 * d1 * (x*y*u1^2 + x*y*sqrtA6 + x*z*sqrtA6 + y*z*sqrtA6)
        +   sqrtA6 * (x*z*u1^2 + y*z*u1^2 + x*z*u1*b + y*z*u1*b + x*y*u1 +
            x*z*u1 + x*z*v1 + y*z*v1))
