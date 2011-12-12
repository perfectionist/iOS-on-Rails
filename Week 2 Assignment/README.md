# iOS on Rails - Week 2 Assignment

In our second class, we reinforced and expanded our knowledge and familiarity with Objective-C and UIKit. We also learned how to have an iOS client communicate with a Rails server to read and write data. This assignment, like the first, will be an extension of the concepts we learned in class, and will get us ready for our third and final class.

As the week goes along, I'll be updating the solution branch, which will be useful if you get stuck with a particular part, or would like to compare your version.

To get started, fork this project and clone the repository to your local machine.

If you have any questions or problems, [create an issue in this repository](https://github.com/CabForward/iOS-on-Rails/issues), and I'll have an answer for you soon.

## Objective

Your task is to expand on the company directory application you've created, adding a few features, and improving the general look and feel of the application.

### Step 1

Create and implement a "Department" model on both the client and server. A Department has a name and a list of employees in that department. Rails, of course, has `belongs_to` and `has_many`, but on the client, you will have to manage that relationship manually.

A suggestion for the right way to model this on the client, would be to have one side have an `NSArray` or `NSSet` property, and the other, a `Department` property. To ensure having a two-sided relationship, you may want to consider overriding the `setEmployees:` method to be something along the lines of:

``` objective-c
- (void)setEmployees:(NSArray *employees) {
  // Wrap property ivar assignment in KVO will/didChangeValueForKey
  [self willChangeValueForKey:@"employees"];
  [employees retain];
  [_employees release];
  _employees = employees;
  [self didChangeValueForKey:@"employees"];
  
  // Manually assign department association
  for (Employee *employee in self.employees) {
    employee.department = self;
  }
}
```

### Step 2

Add fields and properties for Employee image url, phone number, and email. All of these (especially image url) can have the same contrived value, since their purpose is to illustrate UI concepts.

### Step 3

In `EmployeeViewController`, add a custom table header view, with the Employee's name, job title, and a `UIImageView` with the contents of the `imageURL` property (see the `UIImageView+AFNetworking` category). The table header view should have a transparent background, an image view on the left, and two left-aligned labels alongside the image, with a 10pt margin on each side. The fields for name and job title should not appear in the table itself, with the header already displaying that information.

### Step 4

Also in `EmployeeViewController`, add a row for email. When you tap on the row for email, a mail composer view should be presented. For information on how to do this, see the [`MFMailComposeViewController` class reference](http://developer.apple.com/library/ios/#documentation/MessageUI/Reference/MFMailComposeViewController_class/Reference/Reference.html), as well as the [MailComposer](http://developer.apple.com/library/ios/#samplecode/MailComposer/Introduction/Intro.html#//apple_ref/doc/uid/DTS40008865) sample code. Make sure to [add the `MessageUI` framework to your project](http://stackoverflow.com/questions/3352664/how-to-add-existing-frameworks-in-xcode-4).

### Step 5

Likewise, add a row for phone number. When you tap this, the user should be presented with a `UIActionSheet`, with a single button to "Call (555) 555-5555" (or whatever your phone number). Since the simulator doesn't support telephone calls, you should wrap the code to actually make a phone call like this:

``` objective-c
if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tel:"]]) {
  NSString *phoneURLString = [NSString stringWithFormat:@"tel:%@", self.employee.phoneNumber];
                 NSURL *phoneURL = [NSURL URLWithString:[phoneURLString stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
                 [[UIApplication sharedApplication] openURL:phoneURL];
}
```

## Resources

* [Apple - Message UI Framework Reference](http://developer.apple.com/library/ios/#documentation/MessageUI/Reference/MessageUI_Framework_Reference/_index.html)
* [Getting Started With AFNetworking](https://github.com/AFNetworking/AFNetworking/wiki/Getting-Started-with-AFNetworking)
* [Introduction to AFNetworking](https://github.com/AFNetworking/AFNetworking/wiki/Introduction-to-AFNetworking)