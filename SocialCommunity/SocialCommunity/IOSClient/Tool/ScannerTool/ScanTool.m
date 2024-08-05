//
//  ScanTool.m
//  SocialCommunity
//
//  Created by Tim on 2024/8/1.
//

#import "ScanTool.h"

@implementation ScanTool

# pragma mark - 检查访问相机权限

+ (void)checkCameraAuthorization:(void(^)(BOOL isAuthorized))authorizedCheck {
    AVAuthorizationStatus cameraAuthorization = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    
    switch (cameraAuthorization) {
        case AVAuthorizationStatusAuthorized: {
            authorizedCheck(YES);
        }
            break;
        
        case AVAuthorizationStatusNotDetermined: {
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                authorizedCheck(granted);
            }];
        }
            break;
        
        case AVAuthorizationStatusDenied: {
            [SVProgressHUD showErrorWithStatus:NSLocalizedString(@"_camera_denied_tips", @"")];
        }
            break;
        
        case AVAuthorizationStatusRestricted: {
            [SVProgressHUD showErrorWithStatus:NSLocalizedString(@"_camera_restricted_tips", @"")];
        }
            break;
        
        default:
            break;
    }
    
}

# pragma mark - 检查访问相册权限

+ (void)checkAlbumAuthorization:(void(^)(BOOL isAuthorizedAlbum))authorizedAlbumCheck {
    PHAuthorizationStatus photoAuthorization = [PHPhotoLibrary authorizationStatus];
    
    switch (photoAuthorization) {
        case PHAuthorizationStatusAuthorized: {
            authorizedAlbumCheck(YES);
        }
            break;
        
        case PHAuthorizationStatusNotDetermined: {
            [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
                authorizedAlbumCheck(status == PHAuthorizationStatusAuthorized);
            }];
        }
            break;
        
        case PHAuthorizationStatusDenied: {
            [SVProgressHUD showErrorWithStatus:NSLocalizedString(@"_album_denied_tips", @"")];
            authorizedAlbumCheck(NO);
        }
            break;
        
        case AVAuthorizationStatusRestricted: {
            [SVProgressHUD showErrorWithStatus:NSLocalizedString(@"_album_restricted_tips", @"")];
            authorizedAlbumCheck(NO);
        }
            break;
        
        default:
            break;
    }
    
}

# pragma mark - 扫描器类型

+ (NSArray *)metadataObjectType:(SCScanType)scannerType {
    switch (scannerType) {
        case SCScanQrCodeType:
        {
            return @[AVMetadataObjectTypeQRCode];
        }
            break;
        case SCScanBarCodeType:
        {
            return @[AVMetadataObjectTypeEAN13Code,
                     AVMetadataObjectTypeEAN8Code,
                     AVMetadataObjectTypeUPCECode,
                     AVMetadataObjectTypeCode39Code,
                     AVMetadataObjectTypeCode39Mod43Code,
                     AVMetadataObjectTypeCode93Code,
                     AVMetadataObjectTypeCode128Code,
                     AVMetadataObjectTypePDF417Code];
        }
            break;
        case SCScanBothType:
        {
            return @[AVMetadataObjectTypeQRCode,
                     AVMetadataObjectTypeEAN13Code,
                     AVMetadataObjectTypeEAN8Code,
                     AVMetadataObjectTypeUPCECode,
                     AVMetadataObjectTypeCode39Code,
                     AVMetadataObjectTypeCode39Mod43Code,
                     AVMetadataObjectTypeCode93Code,
                     AVMetadataObjectTypeCode128Code,
                     AVMetadataObjectTypePDF417Code];
        }
            break;
        default:
            break;
    }
}

# pragma mark - 打开手机手电筒

+ (void)openFlashLight:(BOOL)flashOn {
    AVCaptureDevice *captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    /* 若手电筒和闪光灯都有 */
    if ([captureDevice hasTorch] && [captureDevice hasFlash]) {
        [captureDevice lockForConfiguration:nil];
        if (flashOn) {
            if ([captureDevice isTorchModeSupported:AVCaptureTorchModeOn]) {
                [captureDevice setTorchMode:AVCaptureTorchModeOn];
            }
        }
        
        [captureDevice unlockForConfiguration];
        
    }
}

@end
