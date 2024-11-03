tea <- data.frame( caffeine = c("Yes","No","Yes","No"),
                   flavor = c("Light","Light","Bold","Bold"),
                   rmd = c("You might like green tea","You might like chamomile tea","You might like black tea","You might like rooibos tea"))


flr <- readline("Flavor: ")
caf <- readline("Caffeine: ")


ifelse(flr %in% unique(tea$flavor)," ",print("Enter either 'Light' or 'Bold' for flavor"))
ifelse(caf %in% unique(tea$caffeine)," ",print("Enter either 'Yes' or 'No' for caffeine"))

ans <- tea$rmd[which(tea$caffeine == caf & tea$flavor == flr)]

ifelse(is.null(ans),print(), print(ans))