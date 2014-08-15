Takeaway Menu (w/ SMS confirmation)
===================================

This was the challenge set at the end of Week 4 at Makers Academy.

The objective was to write Ruby code to display a takeaway menu in Terminal which allows for some user interaction. 

<b>Program Features</b>
- Listing of dishes with prices
- User able to place an order by choosing dishes, their quantities and confirming the total cost. If the sum provided by the user is not correct, an error should be raised.
- If the total cost provided is correct, the customer is sent a text confirming the order was placed successfully and that it will be delivered 1 hour from the time of order
- The text sending functionality should be implemented using the Twilio API
- A Gemfile must be used to manage gems
- Mocks and/or stubs should be used as necessary to prevent texts from being sent when tests are run

Technologies used
-----------------

* Ruby
* RSpec
* Twilio

How to use
----------

```shell
git clone git@github.com:juliatan/takeaway.git
cd takeaway
ruby takeaway.rb
```

How to run tests
----------------

```shell
cd takeaway
rspec
```
