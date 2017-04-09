//
//  ALDebugViewDataSource.h
//  Pods
//
//  Created by Alberto Lagos on 08-04-17.
//
//

#import <Foundation/Foundation.h>
@class ALDebugListViewController;

@protocol ALDebugViewDataSource <NSObject>

- (NSUInteger)ALDebugViewNumberOfRows:(ALDebugListViewController *)aDebugView;
- (NSString *)ALDebugView:(ALDebugListViewController *)aDebugView titleForCellAtRowIndexPath:(NSIndexPath *)aIndexPath;
- (NSString *)ALDebugView:(ALDebugListViewController *)aDebugView descriptionForCellAtRowIndexPath:(NSIndexPath *)aIndexPath;
- (NSString *)ALDebugView:(ALDebugListViewController *)aDebugView titleForSection:(NSUInteger)aInteger;

@end
