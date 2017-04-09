//
//  ALDebugListViewDataSource.h
//  Pods
//
//  Created by Alberto Lagos on 08-04-17.
//
//

#import <Foundation/Foundation.h>
#import "ALDebugViewDataSource.h"
#import "ALDebugTableViewCell.h"

@interface ALDebugListViewDataSource : NSObject <UITableViewDelegate, UITableViewDataSource>
- (instancetype)initWithDataSource:(id<ALDebugViewDataSource>)datasource forViewController:(ALDebugListViewController *)viewController;

@property (nonatomic) id<ALDebugViewDataSource>           datasource;
@property (nonatomic) UITableView                        *tableView;
@property (nonatomic) ALDebugListViewController          *viewController;

@end
