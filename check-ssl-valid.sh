echo | openssl s_client -showcerts -servername *WEBSITE* -connect *WEBSITE*:443 2>/dev/null | openssl x509 -inform pem -noout -text | grep After
