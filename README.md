# ALDebugView

This is a custom view that i use to display develop and QA data before send the App to review to appstore o production. The main goal is to provide information about the actual environment that the app is running. 

But mainly you can add any information you want and display it when the device is shaken. 

#### Installation

You can use it with cocoapods 

`pod 'ALDebugView'`

#### Configuration
1. You need to add `#import  "ALDebugListViewController.h"` in any controller. But i recomend to put in *AppDelegate*. (i will asume that)
2. You need to indicate to `ALDebugView` where to look to get the feed. For that you need to:
	- `[ALDebugListViewController sharedDebugView].delegate   = self;`
    - `[ALDebugListViewController sharedDebugView].datasource = self;`
3. After the last point, your *AppDelegate* must conform the following methods:
	- `ALDebugViewDelegate`:
		- `- (NSString *)ALDebugViewTitleForDebugView:(ALDebugListViewController *)aDebugView`: This method set the title when the DebugView appear.
		- `- (void)ALDebugViewWillCloseView:(ALDebugListViewController *)aDebugView`: Allows perform any thing you want while is closing the DebugView.
	- `ALDebugViewDataSource`:
		- `- (NSUInteger)ALDebugViewNumberOfRows:(ALDebugListViewController *)aDebugView`: Indicates the number of items you will show.
		- `- (NSString *)ALDebugView:(ALDebugListViewController *)aDebugView titleForCellAtRowIndexPath:(NSIndexPath *)aIndexPath`: Display the title for the given row.
		- `- (NSString *)ALDebugView:(ALDebugListViewController *)aDebugView descriptionForCellAtRowIndexPath:(NSIndexPath *)aIndexPath`: Display the description for the given row.
		- `- (NSString *)ALDebugView:(ALDebugListViewController *)aDebugView titleForSection:(NSUInteger)aInteger`: Display the title for the section.



