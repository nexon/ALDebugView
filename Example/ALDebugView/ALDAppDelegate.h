//
//  ALDAppDelegate.h
//  ALDebugView
//
//  Created by nexon on 04/08/2017.
//  Copyright (c) 2017 nexon. All rights reserved.
//

@import UIKit;
//#import <ALDebugListViewController/ALDebugListViewController.h>
#import  "ALDebugListViewController.h"

@interface ALDAppDelegate : UIResponder <UIApplicationDelegate, ALDebugViewDelegate, ALDebugViewDataSource>

@property (strong, nonatomic) UIWindow *window;

@end
