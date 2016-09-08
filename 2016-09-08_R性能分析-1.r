library('GUIProfiler')

temp<-tempdir()
# Definition of two functions
normal.solve <- function(A,b) {
  Output <- solve(crossprod(A), t(A)%*%b)
}

chol.solve <- function(A,b) {
  L <- chol(crossprod(A))
  Output1 <- backsolve(L, t(A)%*%b, transpose=TRUE)
  Output2 <- backsolve(L, Output1)
}

compareMethods <- function() {
  library(MASS)
  # Call the functions
  source(paste(temp,"/normal.solve.R",sep=""))
  source(paste(temp,"/chol.solve.R",sep=""))
  # Solving a big system of equations
  nrows <- 1000
  ncols <- 500
  A <- matrix(rnorm(nrows*ncols),nrows,ncols)
  b <- rnorm(nrows)
  # Testing different possibilities
  Sol1 <- qr.solve(A,b) # Using QR factorization
  Sol2 <- coefficients(lm.fit(A,b)) # lm.fit, based on QR but with some overhead
  Sol3 <- ginv(A) %*% b # Using the pseudoinverse based on SVD
  Sol4 <- normal.solve(A,b) # Using a function based on the normal equations.
  Sol5 <- chol.solve(A,b) # Using a function based on the Choleski factorization.
}

# Dump these functions to three different files

dump("normal.solve",file=paste(temp,"/normal.solve.R",sep=""))
dump("chol.solve",file=paste(temp,"/chol.solve.R",sep=""))
dump("compareMethods",file=paste(temp,"/compareMethods.R",sep=""))
source(paste(temp,"/compareMethods.R",sep=""))

# Profile the code

RRprofStart()
compareMethods()
RRprofStop()
# Uncomment to open the report
#RRprofReport()

RRprofReport(file.name = "RRprof.out", notepad.path =
               "d:/Program Files (x86)/Notepad++/notepad++.exe",reportname = "my_report")