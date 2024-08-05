//
//  ScanView.h
//  SocialCommunity
//
//  Created by Tim on 2024/8/1.
//

#import <UIKit/UIKit.h>
#import "ScanConfigMeta.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^returnBlock)(void);

@interface ScanView : UIView

- (instancetype)initWithFrame:(CGRect)frame config:(ScanConfigMeta *)config;

@end

NS_ASSUME_NONNULL_END
