[![Dependency Status](http://img.shields.io/gemnasium/pikesley/githubbadges.svg)](https://gemnasium.com/pikesley/githubbadges)
[![Code Climate](http://img.shields.io/codeclimate/github/pikesley/githubbadges.svg)](https://codeclimate.com/github/pikesley/githubbadges)
[![Badges](http://img.shields.io/:badges-3/3-ff6799.svg)](https://github.com/badges/badgerbadgerbadger)

#Github Badges

##Dynamically-generated [shields.io](http://shields.io/) badges

_v0.0.1_

###API

####`/:owner/:repo/issues`

Will redirect to a shields.io badge containing a count of the open Github issues on `:owner/:repo`

####`/:owner/:repo/pulls`

Will redirect to a shields.io badge containing a count of the pending pull-requests on `:owner/:repo`

####Undocumented

Almost certainly works for other `:owner/:repo/{something}` API endpoints, too. If it responds to #count, then it should return something sensible.
