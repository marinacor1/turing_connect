####Turing Connect

*Turing Connect* connects the Turing community by tracking all alumni jobs on a Google Maps interface and allowing alumni to post and update information through an interactive dashboard and a social newsfeed.

![](https://s3-us-west-2.amazonaws.com/turingconnect/Screen+Shot+2016-06-15+at+10.51.09+PM.png)

![](https://s3-us-west-2.amazonaws.com/turingconnect/Screen+Shot+2016-06-15+at+10.58.17+PM.png)


[LIVE ON HEROKU] (https://turingconnect.herokuapp.com/)

## Details about the Application

This application uses the following tools:

#### Languages/ Frameworks: RAILS 4.0, Ruby, Javascript, AJAX, JQuery, Bootstrap, HTML, and CSS.

#### Gems: Gmaps4rails, Geocode, OmniAuth

#### APIS/ Services: Googlemaps Javascript, Github, Google Fonts, Amazon Web Services

#### Testing: RSpec, Simplecov (for coverage)

![](https://s3-us-west-2.amazonaws.com/turingconnect/Screen+Shot+2016-06-15+at+10.37.15+PM.png)

###On Your Own
To download the project and set it up locally, run the following commands:

```
$ git clone https://github.com/marinacor1/turing_connect.git
```
```
$ bundle
```
```
$ bundle exec figaro install
```
Make sure to switch out my keys for your own. You will need keys for Google Maps and Github
```
$ rake db:create db:migrate
```
```
$ bundle exec rake import
 ```
 ```
$ rake db:seed
```
```
$ rake geocode:all CLASS=User SLEEP=0.25 BATCH=100
```
