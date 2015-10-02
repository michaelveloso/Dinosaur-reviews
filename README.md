<img src="https://pixabay.com/static/uploads/photo/2013/07/12/14/29/tyrannosaurus-148320__180.png" align="right" />

# Explorasaurus!

### About
Welcome to our dinosaur review site.  This is the week 7 & 8 group project from LaunchAcademy in Boston, MA, fall 2015.

The home page has a list of existing dinosaurs paginated to 10 per page.  They can be searched for in the navigation bar on all pages.  The name of each dinosaur is a link to their display page.  The home page also provides a slide show of dinosaurs via [Slick](http://kenwheeler.github.io/slick/) in JavaScript. At the bottom of this page we provide a button to create a new dinosaur.

<img src="http://i.imgur.com/v1H64vm.png" width="750px" />

Explorasaurus is responsive.  The dinosaur display page has the dinosaur name, image, location found, description, the location it was first found, and a link to an external reference. The dinosaur can be reviewed and rated.  Ratings are displayed as a triceratops fossil.  The more the better!  Reviews can also be voted upon.  "▲" adds a point, "▼" subtracts a point, or you can bring your vote back to zero with "◯".  Users can comment on reviews to explain their vote.

<img src="http://i.imgur.com/Op7RV9D.png" width="750px" />

Users can sign up by giving an email, password and optionally a profile photo.  There is a default photo if one is not provided.  Once signed in, the user's account page has the image, buttons to edit or delete their account, and a list of their dinosaur contributions.  From the dinosaur display page they have the ability to edit or delete their own dinosaurs.  Users can be emailed when other users review their dinosaurs with Action Mailer.  Admins have all the same privileges but with the additional ability to delete other users, their dinosaurs and their reviews to maintain the integrity of the app.  They also have access to a list of all users.

<img src="http://i.imgur.com/laOu0b7.png" width="750px" />

### Tools
Explorasaurus is written in Rails.  Additional gems and addons inculde:
* [Slick](http://kenwheeler.github.io/slick/): JavaScript based image carousel
* [MakeItSo](https://github.com/LaunchAcademy/make_it_so): Rails setup
* [Devise gem](https://github.com/plataformatec/devise): User authentication  
* [CarrierWave gem](https://github.com/carrierwaveuploader/carrierwave): Image uploader
* [Fog gem](https://github.com/fog/fog): Image storage
* [Kaminari](https://github.com/amatsuda/kaminari): Pagination
* [Capybara](https://github.com/jnicklas/capybara) supported by [FactoryGirl](https://github.com/thoughtbot/factory_girl): Testing
* [Selenium-Webdriver](https://rubygems.org/gems/selenium-webdriver/versions/2.47.1): JavaScript Testing

### Future Features
* Ratings on dinosaurs
* Maps for location found via google map API
* Order reviews by rank
* Additional validations that filter for accurate content
* Display who added a dinosaur

### Team
<a href="https://github.com/mcasey5216"><img src="https://avatars3.githubusercontent.com/u/12865707?v=3&s=460" width="100" /></a>  <a href="https://github.com/stacy-wells"><img src="https://avatars1.githubusercontent.com/u/11218638?v=3&s=460" width="100"/></a>
<a href="https://github.com/michaelveloso"><img src="https://avatars3.githubusercontent.com/u/11981927?v=3&s=460" width="100"/></a>
<a href="https://github.com/maribethpierce"><img src="https://avatars3.githubusercontent.com/u/10468678?v=3&s=460" width="100"/></a>

[ ![Codeship Status for michaelveloso/Dinosaur-reviews](https://codeship.com/projects/84c97f50-42b3-0133-bc6b-1eb5f82d52fc/status?branch=master)](https://codeship.com/projects/103836)
![Code Climate](https://codeclimate.com/github/michaelveloso/Dinosaur-reviews.png)
[![Coverage Status](https://coveralls.io/repos/michaelveloso/Dinosaur-reviews/badge.svg?branch=master&service=github)](https://coveralls.io/github/michaelveloso/Dinosaur-reviews?branch=master)

--------------------------------------------------------
