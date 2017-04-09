//
//  UIWindow+ALDebug_UIWindow.m
//  Pods
//
//  Created by Alberto Lagos on 08-04-17.
//
//

#import "UIWindow+ALDebug_UIWindow.h"

@implementation UIWindow (ALDebug_UIWindow)

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if(motion == UIEventSubtypeMotionShake) {
        
        if(![ALDebugListViewController sharedDebugView].isDisplayed) {
            UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:[ALDebugListViewController sharedDebugView]];
            
            [[self rootViewController] presentViewController:navigationController animated:YES completion:nil];
        }
    }
}

@end
