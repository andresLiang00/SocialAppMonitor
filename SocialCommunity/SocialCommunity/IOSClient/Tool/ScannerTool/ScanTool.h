//
//  ScanTool.h
//  SocialCommunity
//
//  Created by Tim on 2024/8/1.
//

#import <Foundation/Foundation.h>
#import "ScanConfigMeta.h"

NS_ASSUME_NONNULL_BEGIN

@interface ScanTool : NSObject

# pragma mark - 检查访问相机权限

+ (void)checkCameraAuthorization:(void(^)(BOOL isAuthorized))authorizedCheck;

# pragma mark - 检查访问相册权限

+ (void)checkAlbumAuthorization:(void(^)(BOOL isAuthorizedAlbum))authorizedAlbumCheck;

# pragma mark - 扫描器类型

+ (NSArray *)metadataObjectType:(SCScanType)scannerType;

@end

NS_ASSUME_NONNULL_END
