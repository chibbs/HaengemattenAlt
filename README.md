# README

## Important: Line Endings ##
It seems, that CRLF line endings (Windows) cause problems with shebangs in ruby files. Please make sure you only commit LF line endings (let Git convert them).
See: https://git-scm.com/book/en/v2/Customizing-Git-Git-Configuration#Formatting-and-Whitespace and https://help.github.com/articles/dealing-with-line-endings/. There is also a .gitattributes settings file in place.

## Requirements ##
Ruby Version: 2.5.1
Rails Version >=5.2.1


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
  
  ***

## Installation

Below are the setups to run Ruby on Rails application on your system.

2. clone Git repository

   `git clone git@github.com:Sinnaj94/HaengemattenApp.git`

3. setup and run project

  * Install all dependencies
  
  `bundle install`
  
  * Create db and migrate schema
  
  ~~rake db:create~~
  ~~rake db:migrate~~
  
  `rails db:schema:load`
  
  * Now run your application
  
  `rails s`
