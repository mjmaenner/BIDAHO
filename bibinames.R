
realnums <- 0:15
bibis <- c("HO", "HA", "HE", "HI", "BO", "BA", "BE", "BI", "KO", "KA", "KE", "KI", "DO", "DA", "DE", "DI")
hexltr <- c("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f")

bibidf <- data.frame(realnums, bibis, hexltr)

say_hex <- function(nums){
  he <- as.character(as.hexmode(nums))
  len <- nchar(he)
  bibiname <- character(length = 0)
  for(i in 1:len){
    hexletter<-substr(he,i,i)
    bibisound <- as.character(bibidf[bibidf$hexltr==hexletter,]$bibis)
    bibiname <- paste0(bibiname, bibisound)
  }
  return(bibiname)
  }

say_hex(2000)

install.packages("broman")
library(broman)
say_nums <- function(bibisound){
  len <- (nchar(bibisound)-2)/2
  hexer <- character(length=0)
  for(i in 0:len){
    bibiword <- substr(bibisound,(i*2)+1,(i*2)+2)
    bibihex <- as.character(bibidf[bibidf$bibis==bibiword,]$hexltr)
    hexer <- paste0(hexer,bibihex)
  }
  print(hexer)
  return(hex2dec(hexer))
}

say_nums("BIDAHO")
