//
//  UIView+BasicAnimation.m
//  SocialCommunity
//
//  Created by Andres on 2024/6/27.
//

#import "UIView+BasicAnimation.h"
#import <objc/runtime.h>

@interface UIView ()

@property (strong, nonatomic) dispatch_source_t  dispatchSource;
@property (strong, nonatomic) NSNumber          *glowViewShowFlag;

@end

@implementation UIView (BasicAnimation)

static char dispatchSourceTimerFlag;

- (void)setDispatchSource:(dispatch_source_t)dispatchSource {
    objc_setAssociatedObject(self, &dispatchSourceTimerFlag, dispatchSource, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (dispatch_source_t)dispatchSource {
    return objc_getAssociatedObject(self, &dispatchSourceTimerFlag);
}

- (void)layerGlow {
    
}



@end
