install.packages("ggplot2")
library(ggplot2)

covid_dataset = read.csv("data-raw/HIST_PAINEL_COVIDBR_24jun2020.csv")
class(covid_dataset)

# Region/States Subsets
# #Brazil
sub_region = subset(covid_dataset, regiao %in% c("Brasil"))

# # Rio de Janeiro
sub_rj_state = subset(covid_dataset, estado %in% c("RJ") & municipio %in% c(""))

sub_rj_city = subset(covid_dataset, estado %in% c("RJ") & municipio %in% c("Rio de Janeiro"))
print(sub_rj)

# Brazil's total occurrence cases 

  ggplot(sub_region) + 
  geom_smooth(aes(x = data, y = casosAcumulado, group=regiao, colour=regiao), fill="#000000", size=1.5) + 
  ylab("Casos Acumulados") + 
  ylim(0,1200000) +
  xlab("Data de Notificação") + 
  scale_x_discrete(guide = guide_axis(check.overlap = TRUE)) +
  ggtitle("Casos acumulados de COVID-19 por data de notificação") + 
  theme(plot.title = element_text(hjust = 0.5), axis.text.x =element_text(angle = 45, hjust = 1) )
  
# Brazil's total death cases 
  
  ggplot(sub_region) + 
    geom_smooth(aes(x = data, y = obitosAcumulado, group=regiao, colour=regiao), size=1.5) + 
    ylab("Óbitos acumulados") + 
    ylim(0,60000) +
    xlab("Data de Notificação") + 
    scale_x_discrete(guide = guide_axis(check.overlap = TRUE)) +
    ggtitle("Óbitos acumulados de COVID-19 por data de notificação") + 
    theme(plot.title = element_text(hjust = 0.5), axis.text.x =element_text(angle = 45, hjust = 1) )

# Brazil's death rate cases

    ggplot(sub_region) + 
    geom_smooth(aes(x = data, y = ((obitosAcumulado/casosAcumulado)*100), group=regiao, colour=regiao), size=1.5) + 
    ylab("Taxa de Letalidade (%)") + 
    ylim(0,7.5) +
    xlab("Data de Notificação") + 
    scale_x_discrete(guide = guide_axis(check.overlap = TRUE)) +
    ggtitle("Taxa de Letalidade de COVID-19 por data de notificação") + 
    theme(plot.title = element_text(hjust = 0.5), axis.text.x =element_text(angle = 45, hjust = 1) )
    
    
    
# Rio de Janeiro total occurrence cases 

ggplot(sub_rj_state) + 
  geom_smooth(aes(x = data, y = casosAcumulado, group=estado, colour=estado), size=1.5) + 
  ylab("Casos Acumulados") + 
  ylim(0,120000) +
  xlab("Data de Notificação") + 
  scale_x_discrete(guide = guide_axis(check.overlap = TRUE)) +
  ggtitle("Casos acumulados de COVID-19 no RJ por data de notificação") + 
  theme(plot.title = element_text(hjust = 0.5), axis.text.x =element_text(angle = 45, hjust = 1) )

# Rio de Janeiro total death cases 

ggplot(sub_rj_state) + 
  geom_smooth(aes(x = data, y = obitosAcumulado, group=regiao, colour=regiao), size=1.5) + 
  ylab("Óbitos acumulados") + 
  ylim(0,10000) +
  xlab("Data de Notificação") + 
  scale_x_discrete(guide = guide_axis(check.overlap = TRUE)) +
  ggtitle("Óbitos acumulados de COVID-19 no RJ por data de notificação") + 
  theme(plot.title = element_text(hjust = 0.5), axis.text.x =element_text(angle = 45, hjust = 1) )

# Rio de Janeiro death rate cases

ggplot(sub_rj_state) + 
  geom_smooth(aes(x = data, y = ((obitosAcumulado/casosAcumulado)*100), group=regiao, colour=regiao), size=1.5) + 
  ylab("Taxa de Letalidade (%)") + 
  ylim(0,15) +
  xlab("Data de Notificação") + 
  scale_x_discrete(guide = guide_axis(check.overlap = TRUE)) +
  ggtitle("Taxa de Letalidade de COVID-19 no RJ por data de notificação") + 
  theme(plot.title = element_text(hjust = 0.5), axis.text.x =element_text(angle = 45, hjust = 1) )

