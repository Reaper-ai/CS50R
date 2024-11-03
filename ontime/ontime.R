rails <- read.csv("rail.csv")
buses<- read.csv("bus.csv")


route <- readline("Route: ")

if (route %in% unique(buses$route)){
  peak_r <- which(route == buses$route & buses$peak == "PEAK")
  n_peak <- buses$numerator[peak_r]
  d_peak <- buses$denominator[peak_r]

  fraction_p <- n_peak/d_peak
  mean_p  <- mean(fraction_p)
  percent_p <- round(mean_p *100)



  off_peak_r <- which(route == buses$route & buses$peak == "OFF_PEAK")
  t_offpeak_r <- length(off_peak_r)
  n_offpeak <- buses$numerator[off_peak_r]
  d_offpeak <- buses$denominator[off_peak_r]



  fraction_op <- n_offpeak/d_offpeak
  mean_op  <- mean(fraction_op)
  percent_op <- round(mean_op *100)


  cat("On time",paste0(percent_p,"%"),"of the time during peak hours.","\n")
  cat("On time",paste0(percent_op,"%"),"of the time during off peak hours.")


} else if (route %in% unique(rails$route)){
  peak_r <- which(route == rails$route & rails$peak == "PEAK")
  n_peak <- rails$numerator[peak_r]
  d_peak <- rails$denominator[peak_r]

  fraction_p <- n_peak/d_peak
  mean_p  <- mean(fraction_p)
  percent_p <- round(mean_p *100)



  off_peak_r <- which(route == rails$route & rails$peak == "OFF_PEAK")
  t_offpeak_r <- length(off_peak_r)
  n_offpeak <- rails$numerator[off_peak_r]
  d_offpeak <- rails$denominator[off_peak_r]



  fraction_op <- n_offpeak/d_offpeak
  mean_op  <- mean(fraction_op)
  percent_op <- round(mean_op *100)


  cat("On time",paste0(percent_p,"%"),"of the time during peak hours.","\n")
  cat("On time",paste0(percent_op,"%"),"of the time during off peak hours.")



} else {
  print("invalid route")
}