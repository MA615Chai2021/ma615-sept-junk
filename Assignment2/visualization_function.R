
plot2.1 <- function(df_1){
  plot.income<-
    ggplot(df_1, aes(x=year, y=value, color = continent)) + 
    geom_smooth(method="lm", se=FALSE)+
    geom_point()+
    scale_color_manual(values = cb_palette) +
    xlab("Years 2001 - 2021") +
    ylab("Income per capita ($USD)") +
    ggtitle("Figure 1: Income per capita by continents from 2001 to 2021")
  
  return(plot.income)
}


plot2.2 <- function(df_2){
  plot.population<-
    ggplot(df_2, aes(x=year, y=value, color = continent)) + 
    geom_smooth(method="lm", se=FALSE)+
    geom_point()+
    scale_y_log10()+       #Adjust the difference between the Y-axis values
    scale_color_manual(values = cb_palette) +
    xlab("Years 2001 - 2021") +
    ylab("Log of Population Density") +
    ggtitle("Figure 2: Population Density by continents from 2001 to 2021")
  
  return(plot.population)
}
