//
//  ScanConfigMeta.m
//  SocialCommunity
//
//  Created by Tim on 2024/8/2.
//

#import "ScanConfigMeta.h"

@implementation ScanConfigMeta

- (instancetype)init {
    self = [super init];
    if (self) {
        self.scannerCornerColor = [UIColor colorWithRed:63/255.0 green:187/255.0 blue:54/255.0 alpha:1.0];
        self.scannerBorderColor = [UIColor whiteColor];
        if (@available(iOS 13.0, *)) {
            self.indicatorViewStyle = UIActivityIndicatorViewStyleLarge;
        }
        self.scannerType = SCScanQrCodeType;
    }
    return self;
}

@end
