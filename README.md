CurrencyTracker
===============
[![Code Climate](https://codeclimate.com/github/antonversal/CTracker.png)](https://codeclimate.com/github/antonversal/CTracker)
[![Build Status](https://travis-ci.org/antonversal/CTracker.png?branch=master)](https://travis-ci.org/antonversal/CTracker)

CurrencyTracker allows you to track your personal collection of world currencies, by tagging the countries that you've visited along your travels.

Features
--------

* Track Visited Countries
* Track Collected Currencies
* Charts show you how far along you are!
* Charts show you progress over time
* Filter country and currencies
* 'Check all' option

Run application
===============

Reset your db:

    rake db:reset

Create test data:

    rake db:fixtures:load

If you want to get all countries and currencies from server run:

    rake data_updater:load

Then you can randomize data to see nice progress chart:

    rake data:randomize

And run server:

    rails s

The login you can use users:

    email: smith@example.com
    password: paSSword123456

    email: doe@example.com
    password: paSSword123456

The questions that should be asked to Mr. Smart
===============================================

When user record that he has visited/collected country/currency he can
accidentally check wrong country/currency. So ability to uncheck should be provided.
But this ability can affects history when user uncheck previous checks which are right.
So the suggestion is to disable uncheck after one hour.
