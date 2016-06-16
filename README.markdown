####Turing Connect

*Turing Connect* connects the Turing community by tracking all alumni jobs on a Google Maps interface and allowing alumni to post and update information through an interactive dashboard and a social newsfeed.

![]https://s3-us-west-2.amazonaws.com/turingconnect/Screen+Shot+2016-06-15+at+10.50.27+PM.png

1[]https://s3-us-west-2.amazonaws.com/turingconnect/Screen+Shot+2016-06-15+at+10.51.09+PM.png

[LIVE ON HEROKU] (https://turingconnect.herokuapp.com/)

## Details about the Application

This application uses RAILS 4.0, Gmaps4rails Gem, Geocode Gem, OmniAuth Gem, Googlemap API, Googlefonts, Github API, Bootstrap, Amazon Web Services, HTML, and CSS.

![](https://s3-us-west-2.amazonaws.com/turingconnect/Screen+Shot+2016-06-15+at+10.37.15+PM.png)

###On Your Own
To download the project and set it up locally, run the following commands:
```$ git clone https://github.com/marinacor1/turing_connect.git
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
