library(glue)
`%>%` <- magrittr::`%>%`

### --- for brms estimates --- ###

report_brm <- function(x, variable) {
  # check whether it's a model or a results object
  if (class(x) != 'data.frame') {
    effects <- brms::fixef(x) %>%
    as.data.frame()
  } else {
    effects <- x
  }

  result <- glue(
    "$\\beta$ = {papaja::printnum(effects[variable, 'Estimate'])}",
    " ({papaja::printnum(effects[variable, 'Est.Error'])}),",
    " CrI 95% [{papaja::printnum(effects[variable, 'Q2.5'])}, {papaja::printnum(effects[variable, 'Q97.5'])}],",
    " OR = {papaja::printnum(exp(effects[variable, 'Estimate']))}"
  )

  return(result)
}
