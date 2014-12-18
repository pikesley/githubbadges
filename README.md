[![Build Status](https://travis-ci.org/pikesley/githubbadges.svg)](https://travis-ci.org/pikesley/githubbadges)
[![Dependency Status](http://img.shields.io/gemnasium/pikesley/githubbadges.svg)](https://gemnasium.com/pikesley/githubbadges)
[![Coverage Status](http://img.shields.io/coveralls/pikesley/githubbadges.svg)](https://coveralls.io/r/pikesley/githubbadges)
[![Code Climate](http://img.shields.io/codeclimate/github/pikesley/githubbadges.svg)](https://codeclimate.com/github/pikesley/githubbadges)
[![Github Issues](http://githubbadges.herokuapp.com/pikesley/githubbadges/issues.svg)](https://github.com/pikesley/githubbadges/issues)
[![Pending Pull-Requests](http://githubbadges.herokuapp.com/pikesley/githubbadges/pulls.svg)](https://github.com/pikesley/githubbadges/pulls)
[![License](http://img.shields.io/:license-mit-blue.svg)](http://pikesley.mit-license.org)
[![Badges](http://img.shields.io/:badges-8/8-ff6799.svg)](https://github.com/badges/badgerbadgerbadger)

#Github Badges

##Dynamically-generated [shields.io](http://shields.io/) badges

_v0.0.1_

###API

####`/:owner/:repo/issues.(png|svg)`

Will redirect to a shields.io badge containing a count of the open Github issues on `:owner/:repo`

####`/:owner/:repo/pulls.(png|svg)`

Will redirect to a shields.io badge containing a count of the pending pull-requests on `:owner/:repo`

####Undocumented

Almost certainly works for other `:owner/:repo/{something}` API endpoints, too. If it responds to #count, then it should return something sensible.
