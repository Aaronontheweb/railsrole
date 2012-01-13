cd app
call gem install eventmachine --pre --no-ri --no-rdoc

start /w thin start -a %ADDRESS% -p %PORT% -e production