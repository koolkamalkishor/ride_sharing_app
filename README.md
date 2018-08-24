[![Build Status](https://travis-ci.org/ogomb/ride_sharing_app.svg?branch=master)](https://travis-ci.org/ogomb/ride_sharing_app)[![Coverage Status](https://coveralls.io/repos/github/ogomb/ride_sharing_app/badge.svg?branch=master)](https://coveralls.io/github/ogomb/ride_sharing_app?branch=master)

# Ride Sharing App

A RideSharing application that allows you and other Andelans to collaborate and carpool to work! 

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. 

### Prerequisites

Ensure that you have installed
```
Ruby  
Rails
``` 
### Technologies Used

```
Ruby
Rails
RSpec
Capybara
devise
```

### Setting up the application
Clone the application:
```
git clone https://github.com/ogomb/ride_sharing_app.git
```

Change directory to ride_sharing_app
```
cd ride_sharing_app
```

Install gems by running 
```
bundle install
```
Run Migrations
```
bundle exec rake db:migrate
```
Seed the the database
```
bundle exec rake db:seed
```
Start the application by running:

```
rails s
```

## Running the tests

You can run the test by running
```
bundle exec rspec spec
```

## Deployment


