library(tercen)
library(dplyr)

options("tercen.workflowId" = "132ff39e2530caca083900267b00283f")
options("tercen.stepId"     = "f4e8f210-bbde-4703-8a2f-7379e5736eec")

getOption("tercen.workflowId")
getOption("tercen.stepId")

lagpad <- function(y, k) {
  st <- ifelse((1+k) > 0, 1+k, 1)
  en <- length(y) + k
  lagged <- y[st:en]
  if(k < 0) lagged <- c(rep(NA, abs(k)), lagged)
  return(lagged)
}

(ctx = tercenCtx())
k <- 1
if(!is.null(ctx$op.value("k"))) k <- as.integer(ctx$op.value("k"))

ctx %>% 
  select(.y, .ci, .ri) %>% 
  group_by(.ri) %>% arrange(.ci) %>%
  mutate(lagged = lagpad(.y, k = 1)) %>%
  ctx$addNamespace() %>%
  ctx$save()
