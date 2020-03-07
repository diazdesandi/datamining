x <- seq(-5,5,by=0.5)
cont <- 0
for(i in x)
{
  cont <- cont + 1
  if(i >= -1 && i <= 1)
  {
    cat("Valor numero:", cont,"")
    cat("Valor: ", i, " Se encuentra en [-1,1]")
  }
  else {
  }
}