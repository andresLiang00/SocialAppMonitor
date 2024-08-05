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

- (void)createColor:(UIColor *)colorStart
           endColor:(UIColor *)colorEnd
         startPoint:(CGPoint)startPoint
           endPoint:(CGPoint)endPoint {
    NSMutableArray *colors = [NSMutableArray arrayWithObjects:(id)colorStart.CGColor,(id)colorEnd.CGColor, nil];
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
//    gradientLayer.startPoint = CGPointMake(0, 0.5);
    gradientLayer.startPoint = startPoint;
//    gradientLayer.endPoint = CGPointMake(1, 0.5);
    gradientLayer.endPoint = endPoint;
    [gradientLayer setColors:[NSArray arrayWithArray:colors]];
//    [self.layer addSublayer:gradientLayer];
    [self.layer insertSublayer:gradientLayer atIndex:0];
}



@end
