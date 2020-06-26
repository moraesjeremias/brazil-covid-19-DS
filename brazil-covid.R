install.packages("ggplot2")
library(ggplot2)

covid_dataset = read.csv("HIST_PAINEL_COVIDBR_24jun2020.csv")

class(covid_dataset)
sub_region = subset(covid_dataset, regiao %in% c("Brasil")) 
print(sub_region)

# Brazil's total cases 

  ggplot(subset(covid_dataset, regiao %in% c("Brasil"))) + 
  geom_smooth(aes(x = data, y = casosAcumulado, group=regiao, colour=regiao), fill="#000000", size=1.5) + 
  ylab("Casos Acumulados") + 
  ylim(0,1200000) +
  xlab("Data de Notificação") + 
  scale_x_discrete(guide = guide_axis(check.overlap = TRUE)) +
  ggtitle("Casos acumulados de COVID-19 por data de notificação") + 
  theme(plot.title = element_text(hjust = 0.5), axis.text.x =element_text(angle = 45, hjust = 1) )
  

