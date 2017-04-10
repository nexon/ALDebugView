//
//  ALDAppDelegate.m
//  ALDebugView
//
//  Created by nexon on 04/08/2017.
//  Copyright (c) 2017 nexon. All rights reserved.
//

#import "ALDAppDelegate.h"

@interface ALDAppDelegate()
@property (nonatomic) NSDictionary<NSNumber *, NSArray *> *items;
@end


@implementation ALDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    self.items = @{
                   @(ALDDataSourceCellTitleType): @[
                                                   @"title1",
                                                   @"title2",
                                                   @"this is a title a little more large"
                                                   ],
                   @(ALDDataSourceCellDescriptionType): @[
                                                        @"description1description1description1description1description1description1description1description1",
                                                        @"Description 2 Description 2 Description 2 Description 2 Description 2 Description 2 Description 2 ",
                                                        @"Description!! :D"
                                                        
                                                        ],
                   @(ALDDataSourceCellSectionTitleType): @[
                           @"Environment Variables"
                           ]
                   };
    
    [ALDebugListViewController sharedDebugView].delegate   = self;
    [ALDebugListViewController sharedDebugView].datasource = self;

#if DEBUG
    [[ALDebugListViewController sharedDebugView] setMode: ALDDeploymentDebugMode];
#else
    [[ALDebugListViewController sharedDebugView] setMode: ALDDeploymentNoneMode];
#endif
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - ALDebugViewListDelegate

- (NSString *)ALDebugViewTitleForDebugView:(ALDebugListViewController *)aDebugView {
    return @"Details";
}

- (void)ALDebugViewWillCloseView:(ALDebugListViewController *)aDebugView {
    NSLog(@"Will Close!");
}

#pragma mark - ALDebugListViewDataSource

- (NSUInteger)ALDebugViewNumberOfRows:(ALDebugListViewController *)aDebugView {
    return self.items[@(ALDDataSourceCellTitleType)].count;
}

- (NSString *)ALDebugView:(ALDebugListViewController *)aDebugView titleForCellAtRowIndexPath:(NSIndexPath *)aIndexPath {
    return [self.items[@(ALDDataSourceCellTitleType)] objectAtIndex:aIndexPath.row];
}

- (NSString *)ALDebugView:(ALDebugListViewController *)aDebugView descriptionForCellAtRowIndexPath:(NSIndexPath *)aIndexPath {
    return [self.items[@(ALDDataSourceCellDescriptionType)] objectAtIndex:aIndexPath.row];
}

- (NSString *)ALDebugView:(ALDebugListViewController *)aDebugView titleForSection:(NSUInteger)aInteger {
    return [self.items[@(ALDDataSourceCellSectionTitleType)] objectAtIndex:aInteger];
}
@end
