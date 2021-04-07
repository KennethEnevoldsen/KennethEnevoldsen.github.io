
metrics_from_json = function(file){
  name = str_split(file, "/", simplify=T)
  name = str_match(file, "metrics\\/\\/(.*)\\.json")
  name = name[length(name)]
  
  metrics = jsonlite::fromJSON(file, flatten = TRUE)
  metrics = tibble(
    "Framework" = name,
    "Accuracy" = metrics$tag_acc,
    "Location" = metrics$ents_per_type$LOC$f,
    "Organization" = metrics$ents_per_type$ORG$f,
    "Person" = metrics$ents_per_type$PER$f,
    "Avg F1" = metrics$ents_f,
    "UAS" = metrics$dep_uas,
    "LAS" = metrics$dep_las,
    "Speed" = metrics$speed
  )
  return(metrics)
}


highlight_highest = function(kable_input, dataset, columns, underline_second=T){
  for (col in columns){
    idx = which(colnames(dataset) == col)
    highest = if_else(dataset[[col]] == max(dataset[[col]], na.rm=T), T, F, missing=F)
    
    if (underline_second){
      sorted = sort(dataset[[col]])
      second_highest = sorted[length(sorted)-1]
      second = if_else(dataset[[col]] == second_highest, T, F, missing=F)
      kable_input = column_spec(kable_input, idx, bold = highest, underline = second)      
    } else{
      kable_input = column_spec(kable_input, idx, bold = highest)
    }
  }
  return(kable_input)
}



columns = colnames(perf)[2:length(colnames(perf))]

highlight_highest = function(kable_input, dataset, columns, underline_second=T){
  for (col in columns){
    idx = which(colnames(dataset) == col)
    highest = if_else(dataset[[col]] == max(dataset[[col]], na.rm=T), T, F, missing=F)
    
    if (underline_second){
      sorted = sort(dataset[[col]])
      second_highest = sorted[length(sorted)-1]
      second = if_else(dataset[[col]] == second_highest, T, F, missing=F)
      kable_input = column_spec(kable_input, idx, bold = highest, underline = second)      
    } else{
      kable_input = column_spec(kable_input, idx, bold = highest)
    }
  }
  return(kable_input)
}



options(knitr.kable.NA = '')
cap = "Highest scores are in bold and second highest is underscored. No values indicate that the framwork does not have trained model"
# add note that these were on the test set  ()
perf %>%  
  kbl(., 
      align=c("l", rep("c", length(columns)))) %>%
  add_header_above(c(" " = 1, "POS" = 1, "NER"= 4, "Dependency Parsing" = 2)) %>% 
  highlight_highest(., perf, columns = columns) %>% 
  kable_material(c("hover", "condensed")) %>% 
  row_spec(7, bold = F, italic = F, background="beige")