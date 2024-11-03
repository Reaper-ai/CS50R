snacks <- data.frame(
  type <- c('chips','chips','chips','chips','rod' ,'rod' ,'chips','rod' ,'rod' ,'rod'),
  flavor <- c('sweet','creamy','sour','spicy','plain','sour','plain','sweet' ,'spicy','creamy'),
  rmd <- c('try lays red','try lays green','try lays dark green','try lays blue','try kurkure orange','try kurkure green','try lays	yellow','try kurkure	red','try kurkure	darkgreen','try kurkure	puff'))



flr <- readline("Flavor: ")
typ <- readline("Type: ")


ifelse(flr %in% unique(snacks$flavor)," ",print(paste("Choose from the following flavors: ",unique(snacks[2]))))
ifelse(type %in% unique(snacks$type)," ",print("Enter either 'chips' or 'rod' for type"))

ans <- snacks$rmd[which(snacks$type == typ & snacks$flavor == flr)]

ifelse(is.null(ans),print(),print(ans))