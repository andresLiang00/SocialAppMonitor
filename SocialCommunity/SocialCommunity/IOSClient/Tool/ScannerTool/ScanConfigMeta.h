//
//  ScanConfigMeta.h
//  SocialCommunity
//
//  Created by Tim on 2024/8/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, SCScanType) {
    SCScanQrCodeType,
    SCScanBarCodeType,
    SCScanBothType,
};

/*
 扫描区域
 */
typedef NS_ENUM(NSInteger, SDScannerArea) {
    SDScannerAreaDefault,
    SDScannerAreaFullScreen,
};


@interface ScanConfigMeta : NSObject

@property (nonatomic, assign) SCScanType scannerType;

/*
 扫描区域
 */
@property (nonatomic, assign) SDScannerArea scannerArea;

/*
 棱角颜色
 */
@property (nonatomic, strong) UIColor *scannerCornerColor;

/*
 边框颜色
 */
@property (nonatomic, strong) UIColor *scannerBorderColor;

/*
 指示器风格
 */
@property (nonatomic, assign) UIActivityIndicatorViewStyle indicatorViewStyle;

@end

NS_ASSUME_NONNULL_END
