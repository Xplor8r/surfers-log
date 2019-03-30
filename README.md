# Surfers Log

+ Built MVC framework using Sinatra gem
+ Authenticated user via the Bcrypt gem
+ Designed front-end styles and responsive layouts with Bootstrap


Surfers Log was built using the Sinatra and styled using Bootstrap.

# Video Demo
[![Surfers Log](https://img.youtube.com/vi/PpkXoG4JFLY/hqdefault.jpg)](https://youtu.be/PpkXoG4JFLY)

# Getting Started
Fork and clone this repo. Then run bundle install to install associated gems, and rake db:migrate to activate your database, then rake db:seed to fill the database with fake user data. Deploy the program in your browser by running shotgun. Finally, navigate to your https://localhost:9393 in your browser.

# Usage

After a new surfer logs in with a surfername, an email, and a password the surfer is presented with all log_entries. The surfer may input into a personal log entry specific data about a particular surf session they had. The data includes the surfspot, date, and discription with optional info about swell direction, swell size, weather conditions, wave count and the option to upload an image. The surfer can then view their own log entries or may select a single log entry from their own log entries or from the Surfers Log community. The surfer also has the ability to edit or delete their own log entries.

# Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'Xplor8r'/surfers-log. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

# License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

# Code of Conduct

Everyone interacting in the Surfers::Log project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/'Xplor8r'/surfers-log/blob/master/CODE_OF_CONDUCT.md).
