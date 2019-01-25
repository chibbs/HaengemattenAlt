# README


## About ##

https://htw-imi-wt1-hammockapp2.herokuapp.com

This is a student work belonging to a web technology course at HTW Berlin. It is an alternative version of the web app found in repository https://github.com/Sinnaj94/HaengemattenApp.
We built a web app, that enables people to share knowledge about locations where one can put his/her hammock :-)
It is a Ruby on Rails project, which uses sqlite2 as a database (on heroku we switched to postgresql), Bootstrap 3 for the frontend and openstreetmap for map rendering.

Authors: Laura Woelbeling (+ Jannis Jahr & Max Menzel)

Berlin, January 2019

## Requirements ##
* Ruby Version: 2.5.1
* Rails Version >=5.2.1
* SQLite3
* ImageMagick
* (PostgreSQL in Production)

Make sure Ruby and Rails is installed on your system. 
  Fire command prompt and run command:
  
      ruby -v
      rails -v
      
  If you see Ruby and Rails version then you are good to start, otherwise setup Ruby On Rails (use [rvm](https://rvm.io/rvm/install) for managing different ruby versions -- see below)
  ***

  * install rvm, Ruby und Rails
  
        \curl -sSL https://get.rvm.io | bash -s stable
        rvm get master
        rvm install "ruby-2.5.1"
        
    * on cygwin you might need to make the cygwin installer accessible via the PATH variable
      via `PATH=/your/path:$PATH`
        
  * Use the newly installed Ruby:
   
        rvm use 2.5.1 
  
  * Check this worked correctly:

        ruby -v
        which ruby
  
  * install Bundler and Rails
  
        gem update --system
        gem install bundler
        gem install nokogiri -- --use-system-libraries
        gem install rails
	
    Hint: the above nokogiri command needs system libraries / cygwin (libxml2-dev, libxslt-dev, zlib, sqlite3, libcrypt-devel, libsqlite3-devel, libgmp-devel, make and others) in order to run. You can try just `gem install nokogiri` instead.

  * install Image Magick
  
    (depends on your platform)
    
    see http://im.snibgo.com/cygwin.htm for installation under Cygwin (Windows)
  
  * check Image Magick Installation
  
        convert --help

  * install PostgreSql (for deployment)
  
    (Installation depends on your platform.)
    
    Hint: For rails it is important that you have the devel libraries installed and pg_config can be found via your PATH. You may need to install libpq-devel or libpq-dev or similar. If pg_config cannot be found, you can then run 
      
        bundle config build.pg --with-pg-config=/Path/To/Your/pg_config 
     
     After that, `gem install pg` should give no errors.
  
  ***

## Installation

Below are the setups to run Ruby on Rails application on your system.

2. clone Git repository

   `git clone git@github.com:Sinnaj94/HaengemattenApp.git`

3. setup and run project

  * Install all dependencies
  
        bundle install
  
  * Create db and migrate schema
  
  ~~rake db:create~~
  ~~rake db:migrate~~
  
        rails db:schema:load
        rails db:seed
	
  (oder:)
  
        rake db:reset db:migrate db:seed
		
  * Now run your application
  
      `rails s`

## Important: Line Endings ##
It seems, that CRLF line endings (Windows) cause problems with shebangs in ruby files. Please make sure you only commit LF line endings (let Git convert them).
See: https://git-scm.com/book/en/v2/Customizing-Git-Git-Configuration#Formatting-and-Whitespace and https://help.github.com/articles/dealing-with-line-endings/. There is also a .gitattributes settings file in place.
