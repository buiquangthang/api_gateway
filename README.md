<p align="center">
  <a href="https://rubyonrails.org/"><img width="300" src="https://zakaria.dev/assets/images/rails_base_app/Ruby_On_Rails_Logo.png" alt="Ruby On Rails"></a>
  <a href="https://www.docker.com" style="margin-left: 20px"><img width="105" src="https://zakaria.dev/assets/images/rails_base_app/docker-logo.png" alt="Docker"></a>
</p>

# An example Rails 7 app

[![](https://badgen.net/badge/Rails/7.0.4.2/red)](https://github.com/zakariaf/rails-base-app/blob/main/Gemfile.lock) [![](https://badgen.net/badge/Ruby/3.2.1/red)](https://github.com/zakariaf/rails-base-app/blob/main/.ruby-version) [![GitHub license](https://img.shields.io/github/license/zakariaf/rails-base-app)](https://github.com/zakariaf/rails-base-app/blob/main/LICENSE)

**This app is built with Rails 7, Ruby 3 and is using Docker for building production images.**
This project is my boilerplate project to learning and practice microservice architecture. Otherwise, it follows the community best practices in terms of standards, security and maintainability, integrating a variety of testing and code quality tools.

Several gems and packages are included in this example app that I've been using for a long time. It wires up a number of things you might use in a real world Rails app. However, at the same time it's not loaded up with a million personal opinions.

<!-- List of all topics -->

## Table of Contents

- [Tech stack](#tech-stack)
  - [Back-end](#back-end)
  - [Front-end](#front-end)
  - [Healthy app](#healthy-app)
  - [Auth](#auth)
  - [Apps](#apps)
- [Running app](#running-app)
  - [Clone the repo](#clone-the-repo)
  - [Install dependencies](#install-dependencies)
  - [Copy .env to .env.local](#copy-env-to-envlocal)
  - [Setup database](#setup-database)
  - [Run the app](#run-the-app)
- [Renaming the project](#renaming-the-project)
- [Docker](#docker)
- [How to contribute](#how-to-contribute)
- [License](#license)

## Tech stack

Initially, I used the `rails new baseapp -c tailwindcss -d postgresql` command to initialize the project using the importmaps and default configurations, but I have since removed the importmaps, tailwindcss, and all default configurations in favor of using Vite.
You can see a list of gems that are in the project with a link to their commit. Therefore, you can easily find what we configured for each gem.

**Note** there is a commit/branch for each gem/package and adding/changing a code in the repo, and you can see the list of the steps we did in order at the below. e.g. step 1 in the repo was **init project** and using **PostgreSQL**. step number 2 was adding **RSpec**, etc.

### Back-end

- 1- [PostgreSQL](https://www.postgresql.org/)
- 2- [RSpec](https://github.com/rspec/rspec-metagem) 
- 3- [Factory Bot Rails](https://github.com/thoughtbot/factory_bot_rails)
- 4- [Faker](https://github.com/faker-ruby/faker) 
- 5- [Database Cleaner](https://github.com/DatabaseCleaner/database_cleaner)
- 6- [SimpleCov](https://github.com/simplecov-ruby/simplecov) ([commit](https://github.com/zakariaf/rails-base-app/commit/a1e629b26bf45f008d27ca4ae1a794de65581e2c))
- 7- Rubocop(Check the [**Healthy app/Backend**](#healthy-app) part)
- 8- [Annotate](https://github.com/ctran/annotate_models)
- 9- [Pry](https://github.com/pry/pry)
- 10- [Pagy](https://github.com/ddnexus/pagy) 
- 11- [HasScope](https://github.com/heartcombo/has_scope)
- 12- [JSON:API serializer](https://github.com/jsonapi-serializer/jsonapi-serializer) A fast JSON:API serializer for Ruby Objects ([commit](https://github.com/zakariaf/rails-base-app/commit/c57cb9db2c0df761e48bdae77971d5fd093033bb))
  - [jsonapi.rb](https://github.com/stas/jsonapi.rb) which provides some features for `jsonapi-serializer` [PR](https://github.com/zakariaf/rails-base-app/pull/9), [commit](https://github.com/zakariaf/rails-base-app/commit/b463d3a024513040c52b0745d042ee1fd9ea96aa) and [PR2](https://github.com/zakariaf/rails-base-app/pull/13)
  - [jsonapi-rspec](https://github.com/jsonapi-rb/jsonapi-rspec) which provides some beautiful RSpec matchers for JSON API [PR](https://github.com/zakariaf/rails-base-app/pull/10)
- 13- [dotenv](https://github.com/bkeepers/dotenv) ([commit](https://github.com/zakariaf/rails-base-app/commit/3aaa696c4228aac2dac40ff42591f07dc74a62bb))

### Front-end

### Healthy app

#### Frontend

- 18- Code quality and format ([PR1](https://github.com/zakariaf/rails-base-app/pull/2), [PR2](https://github.com/zakariaf/rails-base-app/pull/3))
  - [ESlint](https://eslint.org/)
  - [Eslint plugin vue](https://eslint.vuejs.org/rules/)
  - [Prettier](https://prettier.io/)
  - [Husky](https://typicode.github.io/husky/#/)
  - [lint-staged](https://github.com/okonet/lint-staged)

#### Backend

- 7- [RuboCop](https://github.com/rubocop/rubocop) Code quality and format. First I added [rubocop-rails_config gem](https://github.com/toshimaru/rubocop-rails_config) by these two commits ([commit1](https://github.com/zakariaf/rails-base-app/commit/abfdce196721e517b9391b618093506fe062c499)) ([commit2](https://github.com/zakariaf/rails-base-app/commit/89e675b793a0467b271e91c85215a6539bcc4b57)), but after a while, I removed this gem and added rubocop gem and its extensions separately in this [PR](https://github.com/zakariaf/rails-base-app/pull/8)

- 20- [Brakeman](https://github.com/presidentbeef/brakeman) Checking Ruby on Rails applications for security vulnerabilities. you can check `config/brakeman.ignore` to see ignore errors ([PR](https://github.com/zakariaf/rails-base-app/pull/7))
- 21- [bundler-audit](https://github.com/rubysec/bundler-audit) Patch-level verification for bundler ([PR](https://github.com/zakariaf/rails-base-app/pull/7))
- 22- [Fasterer](https://github.com/DamirSvrtan/fasterer) Make Rubies code faster by suggestion some speed improvements. check `.fasterer.yml` to enable/disable suggestions ([PR](https://github.com/zakariaf/rails-base-app/pull/7))
- 23- [License Finder](https://github.com/pivotal/LicenseFinder) Check the licenses of the gems and packages. you can update `doc/dependency_decisions.yml` to manage licenses ([PR](https://github.com/zakariaf/rails-base-app/pull/7))
- Moving linting gems into development and test group in Gemfile ([commit](https://github.com/zakariaf/rails-base-app/commit/5671c93ac791b4ad7ea8dcc191d0f36730887f50))

#### Common

- 24- [overcommit](https://github.com/sds/overcommit) to manage and configure Git hooks by managing all healthy app tools. you can check `.overcommit.yml` to enable or disable tools. ([PR](https://github.com/zakariaf/rails-base-app/pull/7))
- 25- Enabling github action to run `overcommit` after push and pull requests in github. Check `.github/workflows/lint.yml` to see the github configs ([PR](https://github.com/zakariaf/rails-base-app/pull/7))


## Apps

## Running app

I generally recommend to use Docker only for building production images, and not for development. hence I didn't add any docker configs for development.

To run the app locally, you need to have [Ruby](https://www.ruby-lang.org/en/) and [PostgreSQL](https://www.postgresql.org/) installed on your machine.

### 1. Clone the repo

```bash
git clone https://github.com/zakariaf/rails-base-app baseapp
cd baseapp
```

### 2. Install dependencies

```bash
bundle install # install ruby gems
yarn install # install node packages
```

### 3. Copy .env to .env.local

- `.env` file is used for production
- `.env.local` will be used for development
- `.env.test` will be used for test

Usually, you only need to change the Postgres variables in `.env.local` file to match your local database.

```bash
cp .env .env.local
cp .env .env.test
```

### 4. Setup database

```bash
bundle rails db:setup
```

### 5. Run the app

- Run the server

```bash
bundle rails s
```

- Run the frontend

```bash
yarn dev
```

## Docker

As I mentioned before, We use Docker only for building production images. We are using [Docker Compose](https://docs.docker.com/compose/) to build the images and run the containers. You can check the `docker-compose.yml` file to see the configurations. and you can check the `Dockerfile` file to see the configurations for the production image.

Dockerize was done by these two MRs:

- [Dockerize the app](https://github.com/zakariaf/rails-base-app/pull/23)
- [Dockerize the app (2)](https://github.com/zakariaf/rails-base-app/pull/32)

**NOTE** Documentation about docker is not complete yet, I will update it soon.

### 1. Build the images

```bash
docker compose build
```

## Renaming the project

This app is named `baseapp` and the module is named `BaseApp`. But for sure you would like to have a different name.

The only thing you need to do is just running the `bin/rename-project yourappname YouAppName` script.
as you see this script needs 2 arguments:

- First argument: The lower case version of your app's name, such as `myapp` or `my_app` depending on your preference.
- Second argument: Used for your app's module name. such as `MyApp`

`bin/rename-project myapp MyApp`

This script is going to:

- Perform a number of find / replace actions
- Initialize a new git repo for you (Optionally)

After that, If you're happy with your new project's name you can delete this
script.

Or you can keep it around in case you decide to change your project's
name later on.

I got the rename script idea and codes from [Docker Rails Example](https://github.com/nickjj/docker-rails-example#running-a-script-to-automate-renaming-the-project) project with some small changes.

## How to contribute

I'm happy to accept any contributions you might want to make. Please follow these steps:

1. Fork the repo
2. Create a new branch
3. Make your changes
4. Run the test suite
5. Submit a pull request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

## TODO

- [ ] automat deploy process using capistrano
- [ ] Add cypress (e2e testing)
