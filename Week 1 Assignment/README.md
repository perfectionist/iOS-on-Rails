# iOS on Rails - Week 1 Assignment

In our first class, we learned the fundamentals of C and Objective-C, and started to look at UIKit. This assignment will reinforce those skills and help you get more familiar with iOS development in preparation for next week's class.

As the week goes along, I'll be updating the solution branch, which will be useful if you get stuck with a particular part, or would like to compare your version.

To get started, fork this project and clone the repository to your local machine.

If you have any questions or problems, [create an issue in this repository](https://github.com/CabForward/iOS-on-Rails/issues), and I'll have an answer for you soon.

## Objective

Your task is to create a company directory application for the iPhone. Each employee of this company will be displayed on the first screen, with each table view cell showing their name and job title. Tapping on a cell will take you to a new screen with more information, including their birthday and salary. Like in class, we will be faking the data in the model (just for now, until we learn how to pull data from an API).

### Step 1

Implement the `Employee` class, adding properties for `name`, `jobTitle`, `birthday`, and `salary`, and implementing the initializer and sample data class method.

Since creating dates is a bit of a pain in the ass (and since I'm worried that having already used `NSDateComponents` so much overstates what is, in actually, a fairly under-used class), feel free to copy-paste this function under the `#import` statements (outside of your `@implementation`) of `Employee.m`, and use this when generating fake data:

``` objective-c
static NSDate * BirthdayWithMonthDayYear(NSUInteger month, NSUInteger day, NSUInteger year) {
    NSCalendar *gregorianCalendar = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
    
    NSDateComponents *birthdayComponents = [[[NSDateComponents alloc] init] autorelease];
    [birthdayComponents setMonth:month];
    [birthdayComponents setDay:day];
    [birthdayComponents setYear:year];
    
    return [gregorianCalendar dateFromComponents:birthdayComponents];
}
```

### Step 2

Create an `employees` property in `EmployeeListViewController`, and set it to the fake data you created in `Employee +sampleListOfEmployees`. Use that property to power the results of the table view (don't forget to do `[self.tableView reloadData]` after setting the value!)

`UITableViewCell` has a few subviews baked-in, including `textLabel` and `detailTextLabel`. Use these to display the name and job title of the employee for that row.

### Step 3

Create a new `UITableViewController` subclass called `EmployeeViewController`. It should manage the display of an employee's full information in a grouped table view (`UITableViewStyleGrouped`). The number of sections and rows will be fixed, rather than dependent on an array like in the employee list.

Once you've created that, you will add code to push this view controller into the navigation controller of `EmployeeListViewController` when a user taps on a cell.

In order to map row indexes to properties, you may find it useful to declare the following `enum` at the top of implementation file, under the `#import` statements (outside of your `@implementation`):

``` objective-c
enum {
    NameRowIndex        = 0,
    JobTitleRowIndex    = 1,
    BirthdayRowIndex    = 2,
    SalaryRowIndex      = 3,
} EmployeeViewControllerRowIndexes;
```

When configuring your cells, you can then use an `if...else if` or `switch` statement to display the information correponding to the given row.

### Step 4

Use `NSDateFormatter` and `NSNumberFormatter` to display the birthday and salary of your employee in `EmployeeViewController`, in order to follow best practices.

## Resources

* [Apple - Table View Programming Guide](http://developer.apple.com/library/IOs/#documentation/UserExperience/Conceptual/TableView_iPhone/AboutTableViewsiPhone/AboutTableViewsiPhone.html#//apple_ref/doc/uid/TP40007451)
* [Apple - iOS Application Programming Guide](http://developer.apple.com/library/IOs/#documentation/iPhone/Conceptual/iPhoneOSProgrammingGuide/Introduction/Introduction.html#//apple_ref/doc/uid/TP40007072)