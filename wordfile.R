library(fs)

dir_ls('data-shell/molecules')


# find all pdb files

dir_ls('data-shell/molecules',regexp ="*.pdb")

# find ethane or methan

dir_ls('data-shell/molecules',regexp ="ethane|methane")


# find ethane or methan

thane = dir_ls('data-shell/molecules',regexp ="*(e|m)thane*") 

library(dplyr)
library(purrr)

thanefile = dir_ls('data-shell/molecules',regexp ="*pdb") 

# move on regex
  dir_ls('data-shell/molecules',regexp ="*(e|m)thane*") %>%
  map(~file_move(.,'data-shell/molecules/pdb'))
  
  # bulk rename
  
  dir_ls('data-shell/molecules/pdb',regexp="*pdf") %>% map(~file.rename(.,paste0(.,"_new.pdf")))
  
  
  # read first three lines
  
  dir_ls('data-shell/molecules',regexp="*pdb") %>% 
    map(~readLines(con=.,n=3))
        
        
    # sum of all word count
    
  library(tidyverse)
  
    dir_ls('data-shell/molecules',regexp="*pdb") %>% 
   map_df(~sum(str_count(readLines(.)))) %>% gather(var,value) %>% 
      mutate(var=str_replace_all(var,"(.+)/(.+)/",""))
    
    #count of animals
    
    read_lines('data-shell/data/animals.txt') %>% 
      str_replace_all("\\d{4}-\\d{2}-\\d{2},","") %>% as.tibble() %>% group_by(value) %>% count()
      
      
  
    #crosscheck regex
    writeLines("\\d{4}-\\d{2}-\\d{2},")
    
    
    



