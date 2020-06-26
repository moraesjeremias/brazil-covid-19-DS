install.packages("ggplot2")
library(ggplot2)

covid_dataset = read.csv("HIST_PAINEL_COVIDBR_24jun2020.csv")

class(covid_dataset)


ggplot(data = covid_dataset) + 
  geom_point(aes(x = data, y = casosAcumulado), fill="#000000") + 
  ylab("Casos Acumulados") + 
  xlab("Data de Notificação") + 
  ggtitle("Casos acumulados de COVID-19 por data de notificação") + 
  theme(plot.title = element_text(hjust = 0.5), axis.text.x =element_text(angle = 45, hjust = 0.5) )
