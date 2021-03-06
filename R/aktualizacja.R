#' Aktualizacja
#'
#' Funkcja \code{aktualizacja} pobiera nowe posty i komentarze oraz liczbe
#' likow dla stron publicznych kandydatow na prezydenta w koncepcji opisane w 
#' \code{facebook_posty_komentarze_pobieranie} oraz \code{facebook_likes_pobieranie}, 
#' następnie aktualizuje ramki danych oraz aktualizuje raport z wynikami analizy
#' 
#'@author Martyna Spiewak
#'
#'@import
#' knitr
#' markdown
#' 
#'@examples
#' facebook_aktualizacja()

aktualizacja <- function(){
  
  # pobieramy posty, komentarze i lajki
  facebook_pobierz_wszystko()
  # zmieniamy format zapisu i podsumowujemy w jednej tabeli 
  facebook_like_dziennie()
  facebook_like_podsumuj()
  
  # aktualizujemy prezentacje i zapisujemy ja
  knit("Prezentacja\\Prezentacja.Rmd")
  output <- paste0("Prezentacja\\Prezentacja_", Sys.Date(), ".html")
  markdownToHTML("Prezentacja\\Prezentacja.md", output, encoding = "UTF-8")
}