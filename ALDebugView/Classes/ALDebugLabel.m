//
//  ALDebugLabel.m
//  Pods
//
//  Created by Alberto Lagos on 09-04-17.
//
//

#import "ALDebugLabel.h"

@implementation ALDebugLabel

- (void)drawTextInRect:(CGRect)rect {
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 10, 0, 10);
    [self setNeedsLayout];
    
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
}

@end
