x <- seq(-20,20, by=1)
y <- dnorm(x)
plot(x,y)
c <- 0
for(i in x)
{
    c <- c + 1
    print(c)
    if(i >= -1 && i <= 1)
    {
        print(i)
        print("Se encuentra en [-1,1]")
    }
    else {
        print(i)
        print("Fuera del intervalo")
    }
}
