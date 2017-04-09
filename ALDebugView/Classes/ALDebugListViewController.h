//
//  ALDebugListViewController.h
//  Pods
//
//  Created by Alberto Lagos on 08-04-17.
//
//

#import <UIKit/UIKit.h>
#import "ALDebugViewDelegate.h"
#import "ALDebugViewDataSource.h"
#import "ALDebugListViewDataSource.h"
#import "ALDebugTableViewCell.h"

typedef NS_ENUM(NSUInteger, ALDDataSourceCellType) {
    ALDDataSourceCellSectionTitleType,
    ALDDataSourceCellTitleType,
    ALDDataSourceCellDescriptionType
};

@interface ALDebugListViewController : UIViewController

@property (weak) id<ALDebugViewDelegate>             delegate;
@property (weak) id<ALDebugViewDataSource>           datasource;
@property (nonatomic) BOOL                           isDisplayed;

+ (instancetype)sharedDebugView;
@end
