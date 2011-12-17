# Week 2 Notes #

## Step 1 ##

### Implement `Department` Model ###

#### Rails Side ####

Create the `Department` model.

	rails generate model Department name:string

To stop the table in the database we need to run

	bundle exec rake db:migrate

We then we need to setup relationship between `Employee` and `Department` objects.  A `Department` can have many `Employee`s but an `Employee` can belong to just one department.

Add this in the `self.up` migration class for creating `Companies`

	add_index :companies, :employee_id

Then run

	rake db:migrate
	rake db:test:prepare

Make the `name` attribute accessible by adding the following line to `Company` model definition. 

	attr_accessible :name 

#### iOS Client ####



## Credits ##

[MultiMarkdown Composer](http://multimarkdown.com/) is used for creating these notes. ![MultiMarkdown Composer Icon](https://github.com/perfectionist/iOS-on-Rails/tree/week2/Week%202%20Assignment/doc/images/mmd_icon.png)