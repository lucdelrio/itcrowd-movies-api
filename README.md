# Itcrowd-movies-api

[![Image of CircleCI](https://circleci.com/gh/lucdelrio/itcrowd-movies-api/tree/master.svg?style=svg)](https://circleci.com/gh/lucdelrio/itcrowd-movies-api)

Itcrowd movies is an API to query information about Movies and People involved, and the trusted users has the ability to update or create new records

## Outline

 - [API](#api)
 - [Available endpoints](#available-endpoints)
 - [Libraries](#libraries)
 - [Admin Documentation](#admin-documentation)

## API

Find Itcrowd-movies-api on:
* https://itcrowd-movies-api.herokuapp.com/api/v1

## Available endpoints

              POST       /api/v1/users/sign_in (user_session)
              GET        /api/v1/movies                              
              POST       /api/v1/movies
              GET        /api/v1/movies/:id
              PATCH      /api/v1/movies/:id
              PUT        /api/v1/movies/:id
              GET        /api/v1/people
              POST       /api/v1/people
              GET        /api/v1/people/:id
              PATCH      /api/v1/people/:id
              PUT        /api/v1/people/:id

## Libraries

This project is using several libraries and frameworks:

* gem 'active_model_serializers',
* gem 'activeadmin', for Admins to manage movies and people
* gem 'devise_token_auth', for Authentication
* gem 'pg', Postgresql database
* gem 'rails', Web framework
* gem 'rack-cors', for cross origin
* gem 'byebug', Ruby debugger to understand what is going on inside the program
* gem 'database_cleaner', database test cleaner for each test executed
* gem 'factory_bot_rails', fixtures replacement to models faster
* gem 'faker', for random data generation
* gem 'rspec-rails', testing tool
* gem 'rubocop', Ruby static code analyzer and code formatter for keeping the Ruby standards
* gem 'shoulda-matchers', Rspec complement, used for test model attributes
* gem 'simplecov', code coverage analysis tool. Simply integration and great features

## Admin Documentation

Go to [AdminDocumentation](docs/AdminDocumentation.md)
