hasLogFile <- function(){
 return(length(list.files(path = "test/", pattern = "test/*\\.(log)$", ignore.case=TRUE)) > 0)
}

hasKpiFile <- function(){
 return(list.files(path = "test/", pattern = "test/*\\.(csv|slog)$", ignore.case=TRUE)>0)
}

hasLogFile()
hasKpiFile()


# http://stackoverflow.com/questions/4876813/using-r-to-list-all-files-with-a-specified-extension