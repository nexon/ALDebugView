//
//  ALDebugListViewDataSource.m
//  Pods
//
//  Created by Alberto Lagos on 08-04-17.
//
//

#import "ALDebugListViewDataSource.h"

@implementation ALDebugListViewDataSource


#pragma mark Initial

- (instancetype)initWithDataSource:(id<ALDebugViewDataSource>)datasource forViewController:(ALDebugListViewController *)viewController {
    self = [super init];
    if(self) {
        _datasource = datasource;
        _viewController = viewController;
    }
    
    return self;
}


#pragma mark - UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ALDebugTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[ALDebugTableViewCell reuseIdentifier]];
    
    [cell setPropertyTitle: [self.datasource ALDebugView:self.viewController titleForCellAtRowIndexPath:indexPath]];    
    [cell setPropertyDescription: [self.datasource ALDebugView:self.viewController descriptionForCellAtRowIndexPath:indexPath]];

    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.datasource ALDebugViewNumberOfRows:self.viewController];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self.datasource ALDebugView:self.viewController titleForSection:section];
}

@end
