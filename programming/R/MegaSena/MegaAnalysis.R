#Sys.setlocale(locale="C") # http://stackoverflow.com/questions/3548090/facet-grid-problem-input-string-1-is-invalid-in-this-locale
#Sys.setlocale("LC_CTYPE", "portuguese")
mega <- read.csv('/Users/diegocavalca/Desktop/megasena.csv', 
               sep = ";", 
               encoding="UTF-8",
               stringsAsFactors=FALSE)

print(summary(mega))

boxplot(table(mega$Dezena_1)~mega$Dezena_1, col='purple')

# Historico
par(mfrow=c(2,3))
for (i in 1:6) {
  d <- paste("Dezena", i, sep="_")
  df = as.data.frame(table(mega[d]))
  names(df) = c("Dezena", "Frequencia")
  #attach(df)
  df <- df[order(-df$Frequencia),] 
  print(d)
  print(head(df))
  dataHist <- mega[!(is.na(mega[d])),d]
  hist(dataHist, 
       breaks=60, 
       xlab = "Dezena",
       xlim = c(1, 60),
       ylab = "Frequencia",
       axes = FALSE,
       main = paste("Histograma p/ ", d, sep=""))
  axis(1, at = seq(0, 60, by = 5), las=2)
  axis(2, at = seq(0, 60, by = 5), las=2)
  #curve(dnorm(dataHist$Dezena, mean=mean(Dezena), sd=sd(Dezena)), add=TRUE, col='darkblue', lwd=2) 
}

