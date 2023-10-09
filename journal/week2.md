# Terraform Beginner Bootcamp 2023 - Week 2

## Working with Ruby

### Bundler

Bundler is a package manager fo ruby. It is the promary way to install Ruby packages (known as gems) for ruby.

#### Install Gems

You need to create Gemfile and define your gems in that file.

```rb
# frozen_string_literal: true

source "https://rubygems.org"

gem 'sinatra'
gem 'rake'
gem 'pry'
gem 'puma'
gem 'activerecord'
```

Then you need to run the `bundle install` command. 

This will install the gems on the system globally (unlik nodejs which install packages in place in a folder called node_modules)
A Gemfile.locl will be created to lock down the gem versions used in this project.

### Executing ruby scrupts in the context of bundler

We have to use `bundle exec` to tell future ruby scripts to use the gems we installed. This is the way we set the context.

#### Sinatra

Sinatra is a micro web-framework for ruby to build web-apps.

Its great for mock or development servers or for very simple projects.

You can create a web-server in a single file

source https://sinatrarb.com/

## Terratowns Mock Server

### Running the web server

We ca run the web server by executing the following commnads:

```rb
bundle install
bundle exec ruby server.rb
```

All of the code for our server is stored in the `server.rb` file.