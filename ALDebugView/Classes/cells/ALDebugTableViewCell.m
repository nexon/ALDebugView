//
//  ALDebugTableViewCell.m
//  Pods
//
//  Created by Alberto Lagos on 08-04-17.
//
//

#import "ALDebugTableViewCell.h"

@interface ALDebugTableViewCell()
@property (weak) IBOutlet ALDebugLabel *propertyTitleLabel;
@property (weak) IBOutlet ALDebugLabel *propertyDescriptionLabel;
@end

@implementation ALDebugTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setPropertyTitle:(NSString *)aTitle {
    [self.propertyTitleLabel setText:aTitle];
}

- (void)setPropertyDescription:(NSString *)aDescription {
    [self.propertyDescriptionLabel setText:aDescription];
}


+ (NSString *)reuseIdentifier {
    return NSStringFromClass([self class]);
}



@end
