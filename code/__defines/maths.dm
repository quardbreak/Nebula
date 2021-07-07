#define RAND_F(LOW, HIGH) (rand()*(HIGH-LOW) + LOW)
#define ceil(x) (-round(-(x)))
#define CEILING(x, y) ( -round(-(x) / (y)) * (y) )
#define MULT_BY_RANDOM_COEF(VAR,LO,HI) VAR =  round((VAR * rand(LO * 100, HI * 100))/100, 0.1)

#define Round(x) (((x) >= 0) ? round((x)) : -round(-(x)))
#define Floor(x) (round(x))
#define Ceiling(x) (-round(-(x)))

#define EULER 2.7182818285
