[![Build Status](https://travis-ci.org/libryder/codingchallenge.png)](https://travis-ci.org/libryder/codingchallenge)

**Weekly Coding Challenge**

Coding Challenge is a community service that publishes one coding challenge per week. Sources will range from textbooks to interview questions to community-submitted content. Topics will range between general coding practices to engineering problems.

A problem will be posted each week with all reasonably valid solutions posted one week later. Comments aren't discouraged but a good solution will be self-explanatory and easy to read. Only solutions posted from http://gist.github.com/ or a public GitHub repo will be accepted.

Check the [PivotalTracker Project Page](https://www.pivotaltracker.com/projects/729619) if you would like to contribute. Contributing is easy:

1. For the project
2. Create a topic branch
3. Create tests and ensure you didn't break anything.
4. Submit pull request.

**Setting up Weekly Coding Challenge locally**

The only dependency is postgresql, which can be installed pretty easily by a reasonably competent programmer. This [very short] guide assumes you don't have Ruby installed.

1. [Install postgresql](http://wiki.postgresql.org/wiki/Detailed_installation_guides)
2. [Install Ruby](https://rvm.io/rvm/install/)
3. Start postgresql
3. Clone the project
4. run ```bundle install && bundle exec rake db:create```
5. run ```bundle exec rails server```
6. The application should be running at *http://localhost:3000*
7. ???
8. Profit!

**Submitting Challenge Solutions**

Challenges can be submitted to the [Weekly Coding Challenge](http://weeklycodingchallenge.com) website. You can vote on solutions if you are logged in.