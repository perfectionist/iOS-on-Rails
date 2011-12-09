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
## How does it look?
![jump bar](http://www.kellenstyler.com/wp-content/posts/iOSCustomJumpbarFunctionMenu/customMenu.jpg)

## #pragma mark and jump bar.
You can also use `#pragma mark` to make nice labels between methods in jump bar.  An example is:
	#pragma mark - UIViewController
The - will draw a dividing line above the label (`UIViewController` in this case)

The `MARK:` is another way to to the same thing:
	// MARK: - UIViewController
Which ever one you use is a matter of personal taste.

**NOTE:** A trailing `-` will draw a dividing line below the label.