library(RcppMeCab)
library(dplyr)

RmecabKo::install_mecab('c:/mecab')

test <- c("대한민국은 민주공화국이다. 대한민국의 주권은 국민에게 있고, 모든 권력은 국민으로부터 나온다.")
test %>% pos()

test %>% 
  pos(join = FALSE)

test %>% 
  RmecabKo::nouns()

test %>% 
  RmecabKo::token_words()

test %>% 
  RmecabKo::token_ngrams(n=2,
               div=c('nouns'))

test %>%
  pos() %>% 
  unlist() %>% 
  .[!str_ends(.,'(JX|SF|EC)')] %>%
  token_ngrams(n=2)

test %>% 
  pos(format='data.frame')

test %>% 
  posParallel(format='data.frame')
