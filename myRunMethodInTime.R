# 安装
# > install.packages("R.utils")
# 返回
# Installing package into ‘C:/Users/liango/Documents/R/win-library/3.2’
# (as ‘lib’ is unspecified)
# also installing the dependencies ‘R.oo’, ‘R.methodsS3’
# 
# trying URL 'https://mran.revolutionanalytics.com/snapshot/2015-11-30/bin/windows/contrib/3.2/R.oo_1.19.0.zip'
# Content type 'application/zip' length 770451 bytes (752 KB)
# downloaded 752 KB
# 
# trying URL 'https://mran.revolutionanalytics.com/snapshot/2015-11-30/bin/windows/contrib/3.2/R.methodsS3_1.7.0.zip'
# Content type 'application/zip' length 56529 bytes (55 KB)
# downloaded 55 KB
# 
# trying URL 'https://mran.revolutionanalytics.com/snapshot/2015-11-30/bin/windows/contrib/3.2/R.utils_2.1.0.zip'
# Content type 'application/zip' length 971280 bytes (948 KB)
# downloaded 948 KB
# 
# package ‘R.oo’ successfully unpacked and MD5 sums checked
# package ‘R.methodsS3’ successfully unpacked and MD5 sums checked
# package ‘R.utils’ successfully unpacked and MD5 sums checked
# 
# The downloaded binary packages are in
# 	C:\Users\liango\AppData\Local\Temp\RtmpcVZyZ1\downloaded_packages
# > 
 require(R.utils)
 
#test
evalWithTimeout(Sys.sleep(10), timeout = 1)

#test
# - - - - - - - - - - - - - - - - - - - - - - - - -[-------------------------]
# Function that takes "a long" time to run[功能，以“长”的运行时间]
# - - - - - - - - - - - - - - - - - - - - - - - - -[-------------------------]
foo <- function() {
  print("Tic");
  for (kk in 1:100) {
    print(kk);
    Sys.sleep(0.1);
  }
  print("Tac");
}

# - - - - - - - - - - - - - - - - - - - - - - - - -[-------------------------]
# Evaluate code, if it takes too long, generate[评估代码，如果时间过长，产生]
# a timeout by throwing a TimeoutException.[一个超时抛出一个TimeoutException。]
# - - - - - - - - - - - - - - - - - - - - - - - - -[-------------------------]
res <- NULL;
tryCatch({
    res <- evalWithTimeout({ foo(); }, timeout=1.08);
  }, 
  TimeoutException = function(ex) {
    cat("Timeout. Skipping.\n");
  })