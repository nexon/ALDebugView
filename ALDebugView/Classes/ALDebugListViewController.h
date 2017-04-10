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

typedef NS_ENUM(NSUInteger, ALDDeploymentMode) {
    ALDDeploymentDebugMode,
    ALDDeploymentNoneMode
    
};

@interface ALDebugListViewController : UIViewController

@property (weak) id<ALDebugViewDelegate>                       delegate;
@property (weak) id<ALDebugViewDataSource>                     datasource;
@property (nonatomic,getter=isDisplayed) BOOL                  display;
@property (nonatomic, getter=deploymentMode) ALDDeploymentMode mode;

+ (instancetype)sharedDebugView;
@end
