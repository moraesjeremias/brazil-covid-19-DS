install.packages("ggplot2")
library(ggplot2)

covid_dataset = read.csv("data-raw/HIST_PAINEL_COVIDBR_26jun2020.csv")
class(covid_dataset)

# Region/States Subsets
# #Brazil
sub_region = subset(covid_dataset, regiao %in% c("Brasil"))

# # Rio de Janeiro
# # # Estado
sub_rj_state = subset(covid_dataset, estado %in% c("RJ") & municipio %in% c(""))

# # # Cidade
sub_rj_city = subset(covid_dataset, estado %in% c("RJ") & municipio %in% c("Rio de Janeiro"))

# Data Handling and Exploration
# Brazil's total occurrence cases 
  brazil_total_cases = max(sub_region$casosAcumulado)
  print(brazil_total_cases)
  
# Brazil's total death cases 
  brazil_total_deaths = max(sub_region$obitosAcumulado)
  print(brazil_total_deaths)
  
# Brazil's maximum lethality
  brazil_max_let = max((sub_region$obitosAcumulado/sub_region$casosAcumulado)*100, na.rm = TRUE)
  print(round(brazil_max_let, digits = 2))
  
  
# Rio de Janeiro (state) total occurrence cases 
  rj_state_total_cases = max(sub_rj_state$casosAcumulado)
  print(rj_state_total_cases)
  
# Rio de Janeiro (state) total death cases 
  rj_state_total_deaths = max(sub_rj_state$obitosAcumulado)
  print(rj_state_total_deaths)
  
# Rio de Janeiro (state) maximum lethality
  rj_state_max_let = max((sub_rj_state$obitosAcumulado/sub_rj_state$casosAcumulado)*100, na.rm = TRUE)
  print(round(rj_state_max_let, digits = 2))

  
  
# Rio de Janeiro (city) total occurrence cases 
  rj_city_total_cases = max(sub_rj_city$casosAcumulado)
  print(rj_city_total_cases)
  
# Rio de Janeiro (city) total death cases 
  rj_city_total_deaths = max(sub_rj_city$obitosAcumulado)
  print(rj_city_total_deaths)
  
# Rio de Janeiro (city) maximum lethality
  rj_city_max_let = max((sub_rj_city$obitosAcumulado/sub_rj_city$casosAcumulado)*100, na.rm = TRUE)
  print(round(rj_city_max_let, digits = 2))
  
# Rio de Janeiro (city) current lethality
  rj_city_current_let = tail((sub_rj_city$obitosAcumulado/sub_rj_city$casosAcumulado)*100, 1)
  print((round(rj_city_current_let, digits = 2)))
  
  
# Data Plotting 

# Brazil's total occurrence cases 

  ggplot(sub_region) + 
  geom_smooth(aes(x = data, y = casosAcumulado, group=regiao, colour=regiao), fill="#000000", size=1.5) + 
  ylab("Casos Acumulados") + 
  ylim(0,1500000) +
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
    
    
    
# Rio de Janeiro (state) total occurrence cases 

ggplot(sub_rj_state) + 
  geom_smooth(aes(x = data, y = casosAcumulado, group=estado, colour=estado), size=1.5) + 
  ylab("Casos Acumulados") + 
  ylim(0,120000) +
  xlab("Data de Notificação") + 
  scale_x_discrete(guide = guide_axis(check.overlap = TRUE)) +
  ggtitle("Casos acumulados de COVID-19 no estado do RJ por data de notificação") + 
  theme(plot.title = element_text(hjust = 0.5), axis.text.x =element_text(angle = 45, hjust = 1) )

# Rio de Janeiro (state) total death cases 

ggplot(sub_rj_state) + 
  geom_smooth(aes(x = data, y = obitosAcumulado, group=estado, colour=estado), size=1.5) + 
  ylab("Óbitos acumulados") + 
  ylim(0,10000) +
  xlab("Data de Notificação") + 
  scale_x_discrete(guide = guide_axis(check.overlap = TRUE)) +
  ggtitle("Óbitos acumulados de COVID-19 no estado do RJ por data de notificação") + 
  theme(plot.title = element_text(hjust = 0.5), axis.text.x =element_text(angle = 45, hjust = 1) )

# Rio de Janeiro (state) death rate cases

ggplot(sub_rj_state) + 
  geom_smooth(aes(x = data, y = ((obitosAcumulado/casosAcumulado)*100), group=estado, colour=estado), size=1.5) + 
  ylab("Taxa de Letalidade (%)") + 
  ylim(0,12) +
  xlab("Data de Notificação") + 
  scale_x_discrete(guide = guide_axis(check.overlap = TRUE)) +
  ggtitle("Taxa de Letalidade de COVID-19 no estado do RJ por data de notificação") + 
  theme(plot.title = element_text(hjust = 0.5), axis.text.x =element_text(angle = 45, hjust = 1) )




# Rio de Janeiro (city) total occurrence cases 

ggplot(sub_rj_city) + 
  geom_smooth(aes(x = data, y = casosAcumulado, group=municipio, colour=municipio), size=1.5) + 
  ylab("Casos Acumulados") + 
  ylim(0,60000) +
  xlab("Data de Notificação") + 
  scale_x_discrete(guide = guide_axis(check.overlap = TRUE)) +
  ggtitle("Casos acumulados de COVID-19 no município do RJ por data de notificação") + 
  theme(plot.title = element_text(hjust = 0.5), axis.text.x =element_text(angle = 45, hjust = 1) )

# Rio de Janeiro (city) total death cases 

ggplot(sub_rj_city) + 
  geom_smooth(aes(x = data, y = obitosAcumulado, group=municipio, colour=municipio), size=1.5) + 
  ylab("Óbitos acumulados") + 
  ylim(0,7500) +
  xlab("Data de Notificação") + 
  scale_x_discrete(guide = guide_axis(check.overlap = TRUE)) +
  ggtitle("Óbitos acumulados de COVID-19 no município do RJ por data de notificação") + 
  theme(plot.title = element_text(hjust = 0.5), axis.text.x =element_text(angle = 45, hjust = 1) )

# Rio de Janeiro (city) death rate cases

ggplot(sub_rj_city) + 
  geom_smooth(aes(x = data, y = ((obitosAcumulado/casosAcumulado)*100), group=municipio, colour=municipio), size=1.5) + 
  ylab("Taxa de Letalidade (%)") + 
  ylim(0,15) +
  xlab("Data de Notificação") + 
  scale_x_discrete(guide = guide_axis(check.overlap = TRUE)) +
  ggtitle("Taxa de Letalidade de COVID-19 no município do RJ por data de notificação") + 
  theme(plot.title = element_text(hjust = 0.5), axis.text.x =element_text(angle = 45, hjust = 1) )

