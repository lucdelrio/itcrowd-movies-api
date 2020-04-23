# Itcrowd-movies-api

[![Image of CircleCI](https://circleci.com/gh/lucdelrio/itcrowd-movies-api/tree/master.svg?style=svg)](https://circleci.com/gh/lucdelrio/itcrowd-movies-api)

Itcrowd movies is an API to query information about Movies and People involved, and the trusted users has the ability to update or create new records

## Outline

 - [API](#api)
 - [Available endpoints](#available-endpoints)
    - [User Log in](#user-log-in)
    - [Movies](#movies)
    - [People](#people)
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

Endpoints for creation and edition must be acceded with authentication headers.

### User Log in
#### POST /users/sign_in
#### Description:
Here is an example for user log in, and response with tokens.

#### Body Parameters:
```json
{
          "email": "lucas@itcrowd.com",
          "password": "itcrowd"
}
```

### Movies

#### GET /movies
#### Description:
List all movies

#### Response body:
```json
[
    {
        "id": 1,
        "title": "Gladiator",
        "release_year": "MM",
        "casting": [
            {
                "id": 1,
                "first_name": "Russell",
                "last_name": "Crowe",
                "deleted_at": null,
                "created_at": "2020-04-23T05:56:35.322Z",
                "updated_at": "2020-04-23T05:56:35.322Z"
            }
        ],
        "directors": [],
        "producers": []
    },
    {
        "id": 2,
        "title": "Forest Gump",
        "release_year": "MCMXCIV",
        "casting": [
            {
                "id": 2,
                "first_name": "Tom",
                "last_name": "Hanks",
                "deleted_at": null,
                "created_at": "2020-04-23T05:56:35.381Z",
                "updated_at": "2020-04-23T05:56:35.381Z"
            }
        ],
        "directors": [
            {
                "id": 3,
                "first_name": "Robert",
                "last_name": "Zemeckis",
                "deleted_at": null,
                "created_at": "2020-04-23T05:56:35.386Z",
                "updated_at": "2020-04-23T05:56:35.386Z"
            }
        ],
        "producers": [
            {
                "id": 4,
                "first_name": "Steve",
                "last_name": "Tisch",
                "deleted_at": null,
                "created_at": "2020-04-23T05:56:35.392Z",
                "updated_at": "2020-04-23T05:56:35.392Z"
            }
        ]
    },
    {
        "id": 3,
        "title": "Invictus",
        "release_year": "MMIX",
        "casting": [],
        "directors": [],
        "producers": []
    }
]
```

#### GET /movies/{id}
#### Description:
List movie by id

#### Response body:
```json
{
    "id": 5,
    "title": "Forest Gump",
    "release_year": "MCMXCIV",
    "casting": [
        {
            "id": 5,
            "first_name": "Tom",
            "last_name": "Hanks",
            "deleted_at": null,
            "created_at": "2020-04-23T07:13:17.907Z",
            "updated_at": "2020-04-23T07:13:17.907Z"
        }
    ],
    "directors": [
        {
            "id": 6,
            "first_name": "Robert",
            "last_name": "Zemeckis",
            "deleted_at": null,
            "created_at": "2020-04-23T07:13:17.914Z",
            "updated_at": "2020-04-23T07:13:17.914Z"
        }
    ],
    "producers": [
        {
            "id": 7,
            "first_name": "Steve",
            "last_name": "Tisch",
            "deleted_at": null,
            "created_at": "2020-04-23T07:13:17.921Z",
            "updated_at": "2020-04-23T07:13:17.921Z"
        }
    ]
}
```

#### POST /movies/
#### Description:
Create movie

#### Request headers:
```json
{
  "Access-Token": "4R4dFbmgVmjDBm5YaeJjPQ",
  "Content-Type": "application/json",
  "Accept": "application/json",
  "Uid": "user@mail.com",
  "Client": "Emi7bruGODt_CObwD4ojVQ"
}
```

#### Body Parameters:
```json
{
    "movie": {
        "title": "Men in black 3",
        "release_year": 2012
    }
}
```

#### PUT /movies/{id}
#### Description:
Update movie and asociate people

#### Request headers:
```json
{
  "Access-Token": "4R4dFbmgVmjDBm5YaeJjPQ",
  "Content-Type": "application/json",
  "Accept": "application/json",
  "Uid": "user@mail.com",
  "Client": "Emi7bruGODt_CObwD4ojVQ"
}
```

#### Body Parameters:
```json
{
    "movie": {
        "id": 9,
        "title": "Men in black 3",
        "release_year": 2014,
        "participations_attributes": [
            {
                "role": "actor",
                "person_id": 5
            }
        ]
    }
}
```

### People

#### GET /people
#### Description:
List all people

#### Response body:
```json
[
    {
        "id": 4,
        "first_name": "Russell",
        "last_name": "Crowe",
        "participations_as_actor": [
            {
                "id": 4,
                "title": "Gladiator",
                "deleted_at": null,
                "created_at": "2020-04-23T07:13:17.803Z",
                "updated_at": "2020-04-23T07:17:04.186Z",
                "release_year": 2000
            }
        ],
        "participations_as_director": [],
        "participations_as_producer": []
    },
    {
        "id": 5,
        "first_name": "Tom",
        "last_name": "Hanks",
        "participations_as_actor": [
            {
                "id": 5,
                "title": "Forest Gump",
                "deleted_at": null,
                "created_at": "2020-04-23T07:13:17.900Z",
                "updated_at": "2020-04-23T07:13:17.900Z",
                "release_year": 1994
            }
        ],
        "participations_as_director": [],
        "participations_as_producer": []
    },
    {
        "id": 6,
        "first_name": "Robert",
        "last_name": "Zemeckis",
        "participations_as_actor": [],
        "participations_as_director": [
            {
                "id": 5,
                "title": "Forest Gump",
                "deleted_at": null,
                "created_at": "2020-04-23T07:13:17.900Z",
                "updated_at": "2020-04-23T07:13:17.900Z",
                "release_year": 1994
            }
        ],
        "participations_as_producer": []
    },
    {
        "id": 7,
        "first_name": "Steve",
        "last_name": "Tisch",
        "participations_as_actor": [],
        "participations_as_director": [],
        "participations_as_producer": [
            {
                "id": 5,
                "title": "Forest Gump",
                "deleted_at": null,
                "created_at": "2020-04-23T07:13:17.900Z",
                "updated_at": "2020-04-23T07:13:17.900Z",
                "release_year": 1994
            }
        ]
    }
]
```

#### GET /people/{id}
#### Description:
List person by id

#### Response body:
```json
{
    "id": 7,
    "first_name": "Steve",
    "last_name": "Tisch",
    "participations_as_actor": [],
    "participations_as_director": [],
    "participations_as_producer": [
        {
            "id": 5,
            "title": "Forest Gump",
            "deleted_at": null,
            "created_at": "2020-04-23T07:13:17.900Z",
            "updated_at": "2020-04-23T07:13:17.900Z",
            "release_year": 1994
        }
    ]
}
```

#### POST /people/
#### Description:
Create person

#### Request headers:
```json
{
  "Access-Token": "4R4dFbmgVmjDBm5YaeJjPQ",
  "Content-Type": "application/json",
  "Accept": "application/json",
  "Uid": "user@mail.com",
  "Client": "Emi7bruGODt_CObwD4ojVQ"
}
```

#### Body Parameters:
```json
{
    "person": {
        "first_name": "Matt",
        "last_name": "Damon"
    }
}
```

#### PUT /people/{id}
#### Description:
Update people and asociate movie

#### Request headers:
```json
{
  "Access-Token": "4R4dFbmgVmjDBm5YaeJjPQ",
  "Content-Type": "application/json",
  "Accept": "application/json",
  "Uid": "user@mail.com",
  "Client": "Emi7bruGODt_CObwD4ojVQ"
}
```

#### Body Parameters:
```json
{
    "person": {
        "id": 5,
        "first_name": "Matt",
        "last_name": "Damon",
        "participations_attributes": [
            {
                "role": "actor",
                "movie_id": 3
            }
        ]
    }
}
```

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
