################################################################################
# # Crypto: an R package for encrypting/decrypting text. | Marco Plebani
# # http://marcoplebani.com/crypto/
################################################################################
# library(devtools)
# install_github("marcoplebani85/crypto")


###############################################################################st.files(path = "test/", pattern = "test/*\\.(log|csv|slog)$", ignore.case=TRUE); :
*#
# https://rforge.net/doc/packages/PKI/PKI.crypt.html
# http://stackoverflow.com/questions/5806308/how-do-i-encrypt-data-in-r
################################################################################
# > install.packages("PKI")
# Installing package into ‘C:/Users/liango/Documents/R/win-library/3.2’
# (as ‘lib’ is unspecified)
# also installing the dependency ‘base64enc’
# 
# trying URL 'https://mran.revolutionanalytics.com/snapshot/2015-11-30/bin/windows/contrib/3.2/base64enc_0.1-3.zip'
# Content type 'application/zip' length 38232 bytes (37 KB)
# downloaded 37 KB
# 
# trying URL 'https://mran.revolutionanalytics.com/snapshot/2015-11-30/bin/windows/contrib/3.2/PKI_0.1-3.zip'
# Content type 'application/zip' length 1328033 bytes (1.3 MB)
# downloaded 1.3 MB
# 
# package ‘base64enc’ successfully unpacked and MD5 sums checked
# package ‘PKI’ successfully unpacked and MD5 sums checked
# 
# The downloaded binary packages are in
# C:\Users\liango\AppData\Local\Temp\Rtmp4ocST7\downloaded_packages
library(PKI)
key <- PKI.genRSAkey(2048)
x <- charToRaw("Hello, world!")
e <- PKI.encrypt(x, key)
y <- PKI.decrypt(e, key)
stopifnot(identical(x, y))
print(rawToChar(y))

## AES symmetric - use SHA256 to support arbitrarily long key strings
key <- PKI.digest(charToRaw("hello"), "SHA256")
ae <- PKI.encrypt(x, key, "aes256")
ae
ad <- PKI.decrypt(ae, key, "aes256")
stopifnot(identical(x, ad))
print(rawToChar(ad))
