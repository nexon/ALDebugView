//
//  ALDebugTableViewCell.h
//  Pods
//
//  Created by Alberto Lagos on 08-04-17.
//
//

#import <UIKit/UIKit.h>
#import "ALDebugLabel.h"

@interface ALDebugTableViewCell : UITableViewCell
+ (NSString *)reuseIdentifier;
- (void)setPropertyTitle:(NSString *)aTitle;
- (void)setPropertyDescription:(NSString *)aDescription;
@end
