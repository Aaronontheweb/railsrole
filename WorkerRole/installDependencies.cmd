REM Install the appropriate gems (Thin web server) we need to run production instances
call gem install eventmachine --pre --no-ri --no-rdoc >> log.txt 2>> err.txt
call gem install bundler thin --no-ri --no-rdoc >> log.txt 2>> err.txt

REM Install the gem dependencies for our web application itself
cd app
call bundle install >> log.txt 2>> err.txt
