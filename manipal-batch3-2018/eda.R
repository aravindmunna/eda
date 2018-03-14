
segmented_analysis = function(df){
  return (df)
}

crosstab_analysis = function(df){
  return (df)
}


# Correlation
correlation_analysis = function(df){
  cor_threshold = 0.75
  result = data.frame(Var1=character(), Var2=character(),
                      Correlation=numeric())
  
  num_cols = names(df)[sapply(df, is.numeric)]
  for (comb in combn(num_cols, 2, simplify = F)){
    df_subset = df %>% select_(comb[1], comb[2])
    df_subset = na.omit(df_subset)
    comb_cor = cor(df_subset[,comb[1]], df_subset[, comb[2]])
    
    if (abs(comb_cor)>cor_threshold){
      res_cur = list(Var1=as.character(comb[1]), Var2=as.character(comb[2]), Correlation=as.numeric(comb_cor))
      result$Var1 = as.character(result$Var1)
      result$Var2 = as.character(result$Var2)
      result = rbind(result, res_cur)
    }
  }
  result = result %>% mutate(abs_cor = abs(Correlation)) %>% arrange(-abs_cor) %>% select(-abs_cor)
  return(result)
}

get_numeric = function(df){
  return (names(which(sapply(df, is.numeric))))
}


eda = function(df){
  summary = list()
  summary$numeric = get_numeric(df)
  summary$category_freq = catgegorical_frequency(df)
  summary$correlation = correlation_analysis(df)
  summary$crossab = crosstab_analysis(df)
  summary$segmented = segmented_analysis(df)
  return (summary)
}