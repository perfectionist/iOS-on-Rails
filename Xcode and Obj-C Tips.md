# Lessons Learned and Handy Tips

## Videos on Xcode 4
Pragmatic Programmer has ten very informative videos on Xcode 4 and they are **FREE**. 

* [Project Setup](http://pragmaticstudio.com/screencasts/9-xcode-4-project-setup)
* [Interface Overview](http://pragmaticstudio.com/screencasts/10-xcode-4-interface-overview)
* [Utilities Keyboard Shortcut](http://pragmaticstudio.com/screencasts/11-utilities-keyboard-shortcut)
* [Changing the Assistant Layout](http://pragmaticstudio.com/screencasts/12-changing-the-assistant-layout)
* [Using Interface Builder](http://pragmaticstudio.com/screencasts/13-using-ib-in-xcode-4)
* [Opening Files, Quickly](http://pragmaticstudio.com/screencasts/14-opening-files-quickly)
* [Code Completion](http://pragmaticstudio.com/screencasts/15-code-completion)
* [Code Snippets](http://pragmaticstudio.com/screencasts/16-code-snippets)
* [Custom Code Snippets](http://pragmaticstudio.com/screencasts/17-custom-code-snippets) How to roll your own snippets.
* [Fix It](http://pragmaticstudio.com/screencasts/18-fix-it)

There is also a [Cheat Sheet](http://pragmaticstudio.com/media/Xcode4Shortcuts.pdf) of Xcode 4 Shortcuts.

Bill Dudney also has three videos on [Coding in Objective-C 2.0](http://pragprog.com/screencasts/v-bdobjc/coding-in-objective-c-2-0) that are very good but use Xcode 3 IDE.

## FIXME, TODO, MARK, ??? and !!! comments in jump bar.
There is a neat trick for adding comments to the jump bar. **NOTE**: These comments must be outside the method definitions (the { } brackets).
###FIXME
	// FIXME: your comment here…
###TODO
	// TODO: your comment here…
###MARK
	// MARK: your comment here…
###???
	// ???: your comment here…
###!!!
	// !!!: your comment here…
### How does it look?
![jump bar](http://www.kellenstyler.com/wp-content/posts/iOSCustomJumpbarFunctionMenu/customMenu.jpg)

## #pragma mark and jump bar.
You can also use `#pragma mark` to make nice labels between methods in jump bar.  An example is:
	#pragma mark - UIViewController
The - will draw a dividing line above the label (`UIViewController` in this case)

The `MARK:` comment is another way to to the same thing:
	// MARK: - UIViewController
Whichever one you use is a matter of personal taste.

**NOTE:** A trailing `-` will draw a dividing line below the label.

## Github
### Coupling repositories
If you fork a repository on [github](http://gitcub.comgit) and you clone your fork you can still get to the original repository by using `upstream`. For this application I used:
	remote add upstream https://github.com/CabForward/iOS-on-Rails.git
Then use `fetch` and `merge` to get updates posted at the original repository.
	git fetch upstream
	git merge upstream/master
See [how to fork a repo](http://help.github.com/fork-a-repo/) in github help for more information.

### Applications
[Github for Mac](http://mac.github.com/) is a great **FREE** tool. It does all the basics plus makes it easy to push to github.

[Gitbox](http://www.gitboxapp.com/) is a very good and cheap (for a limited time) application.  Currently ( December 9, 2011 ) it is $9.99 at the App Store.

[Tower](http://www.git-tower.com/) is also very good and more polished but it is more expensive.

[SourceTree](http://www.sourcetreeapp.com/) for Mac is now **FREE** for a  limited time.  Atlassian has purchased the application. It is also available from the App Store and it works for both Git and Hg! This is my go-to git client now.  App is solid and free makes it better :-).

## Mou for markdown editing.
![Mou icon](http://mouapp.com/Mou_128.png)

For editing markdown files the [Mou](http://mouapp.com/) application is great and easy to use.  Github has some minor extensions to markdown and it is easy to work around them in **Mou**. 

Example screenshot:
![Mou Screen](http://mouapp.com/images/Mou_Screenshot_1.png)

##todos
These are things I want to find answers to:

* Where does Xcode keep info on what not to commit to git?  There
  does not seem to be a `.ignore` file and I have problems pushing to 
  origin from inside Xcode.  
