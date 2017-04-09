//
//  ALDebugViewDelegate.h
//  Pods
//
//  Created by Alberto Lagos on 08-04-17.
//
//

#import <Foundation/Foundation.h>

@class ALDebugListViewController;

@protocol ALDebugViewDelegate <NSObject>


- (void)ALDebugViewWillCloseView: (ALDebugListViewController *)aDebugView;

@optional

- (NSString *)ALDebugViewTitleForDebugView: (ALDebugListViewController *)aDebugView;


@end
