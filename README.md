[![Build Status](https://travis-ci.org/ogomb/ride_sharing_app.svg?branch=master)](https://travis-ci.org/ogomb/ride_sharing_app)[![Coverage Status](https://coveralls.io/repos/github/ogomb/ride_sharing_app/badge.svg?branch=master)](https://coveralls.io/github/ogomb/ride_sharing_app?branch=master)

# Ride Sharing App

A RideSharing application that allows you and other Andelans to collaborate and carpool to work! This application has an added admin section that allows the Admin to remove some users from accessing the application when members lodge complaints amoung other admin priviledges.

This application gives the creator of the ride to select people who he wants to share his ride. But the people will just show interest on a ride.

A user can create a new ride as well as jumping in to other rides that are available. The user would not be able to edit the ride if he is not the creator of the ride. He will not be able to edit other peoples interest on the ride.

The creator of the ride has the autonomy of selecting the people he/she wants on the ride.

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


