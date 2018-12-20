# README

## Requirements ##
Ruby Version: 2.5.1
Rails Version 5.2.1


## Installation
Below are the setups to run Ruby on Rails application on your system.

1. Make sure Ruby and Rails is installed on your system. Fire command prompt and run command:
```
    ruby -v
    rails -v
```
2. If you see Ruby and Rails version then you are good to start, otherwise setup Ruby On Rails (use [rvm](https://rvm.io/rvm/install) for managing different ruby versions)
  * install rvm, Ruby und Rails
  ``` 
  \curl -L https://get.rvm.io | bash -s stable --rails
  gem install rails ``` 
  * Display a list of all known rubies
  ```  
  rvm list known``` 
  * Use the newly installed Ruby:
  ```  
  rvm use 2.5.1 ``` 
  * Check this worked correctly:
  ```  
  ruby -v
  which ruby``` 
  * install bundler
  ```  
  gem install bundler ``` 

3. Once done, now clone respected git repository
```
    git clone git@github.com:Sinnaj94/HaengemattenApp.git
```
Install all dependencies
```
    bundle install
```
Create db and migrate schema
```
    rake db:create
    rake db:migrate
```
 Now run your application
```
    rails s
```



***
(This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
* )
