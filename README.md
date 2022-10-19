# Test automation exercise
Candidate: Emmanuel Malikides

## Task:
Create robot script for some public web page using Robot Framework. (Any web
page you want - simple and short script).

Use Robot Framework ja selenium library.

It would be nice to meet next requirements:

Written using Gherkin style
Use Google Chrome or Firefox browsers
Use SeleniumLibrary
Use different kind of selectors and elements
Send us git repo link or zip archive with source code

## Solution
### to run
robot login_tests

### choices
Browser : Firefox
website : reddit.com
Python  : 3.6

See requirments.txt, and appropriately initialise virtualenv.

### notes
Over about 3-4 hours I familiarised myself with some of the Selenium/Robot
framework syntax, worked through the quickstart and edited it for reddit.

Initially I wanted to create a test for creating accounts but obviously
reddit has security features for that. 
Getting around the randomized class names required some creativity
and execution of javascript.

I think probably executing javascript in Robot tests is a bad idea for
in-house testing because it would possibly add non-determinism, or 
another channel for mistakes in the tests themselves, obviously bad.

Additionally testing the logout require sleeping, which is also probably 
bad, I am not sure how the factors affecting the time taken to log out
can be controlled in this context.

I found the syntax pretty straightforward, but obviously I'd
like to see some examples of conventions you have in your company to be 
more awesome.

Regards,
Emmanuel