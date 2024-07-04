//
//  SCLogin.m
//  SocialCommunity
//
//  Created by Tim on 2024/7/1.
//

#import "SCLogin.h"
/* 支付宝SDK引入 */
#import <AFServiceSDK/AFServiceSDK.h>

@interface SCLogin ()

@property (weak, nonatomic) IBOutlet UILabel *titleLogin;
@property (weak, nonatomic) IBOutlet UIView *SCLoginView;
@property (weak, nonatomic) IBOutlet UIButton *buttonLoginTag;
@property (weak, nonatomic) IBOutlet UIButton *buttonRegisterTag;
@property (weak, nonatomic) IBOutlet UIView *accountView;
@property (weak, nonatomic) IBOutlet UIView *passwordView;
@property (weak, nonatomic) IBOutlet UIImageView *iconAccount;
@property (weak, nonatomic) IBOutlet UIImageView *iconPassword;
/* 登录结果提示 */
@property (weak, nonatomic) IBOutlet UILabel *labelLoginHint;
@property (weak, nonatomic) IBOutlet UIButton *butWechat;
@property (weak, nonatomic) IBOutlet UIButton *butAlipay;
@property (weak, nonatomic) IBOutlet UIButton *butLogin;
@property (weak, nonatomic) IBOutlet UITextField *TFaccount;
@property (weak, nonatomic) IBOutlet UITextField *TFpassword;

@end

@implementation SCLogin

/* 微信请求登录 */
- (IBAction)requestWechatLogin:(id)sender {
    
}

/* 支付宝请求登录 */
- (IBAction)requestAlipayLogin:(id)sender {
    
}

/* 账号密码登录/注册 */
- (IBAction)requestAccountLogin:(id)sender {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = AppColor.shared.launchColor;
    self.titleLogin.attributedText = [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"_login_page_", @"") attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont fontWithName:AppFont.shared.font_Latin_Thin size:18]}];
    self.SCLoginView.layer.cornerRadius = 5.0f;
    [self viewDesignChange];
}

- (void)viewDesignChange{
    self.labelLoginHint.attributedText = [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"_login_label_hint_", @"") attributes:@{ NSFontAttributeName:[UIFont fontWithName:AppFont.shared.font_Latin_Thin size:12]}];
    
    self.buttonLoginTag.backgroundColor = [UIColor whiteColor];
    [self.buttonLoginTag setAttributedTitle: [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"_login_mode_", @"") attributes:@{NSForegroundColorAttributeName:AppColor.shared.launchColor,NSFontAttributeName:[UIFont fontWithName:AppFont.shared.font_Latin_Thin size:18]}] forState:UIControlStateNormal];
    self.buttonRegisterTag.backgroundColor = AppColor.shared.borderLightGrayColor;
    [self.buttonRegisterTag setAttributedTitle: [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"_register_mode_", @"") attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont fontWithName:AppFont.shared.font_Latin_Thin size:18]}] forState:UIControlStateNormal];
    
    [self viewAccountChange];
    
    self.butWechat.layer.cornerRadius = 15.f;
    [self.butWechat setAttributedTitle:[[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"_wechat_login_", @"") attributes:@{NSForegroundColorAttributeName:AppColor.shared.textWhiteColor, NSFontAttributeName:[UIFont fontWithName:AppFont.shared.font_Latin_Bold size:12]}] forState:UIControlStateNormal];
//    [self.butWechat setTitle:NSLocalizedString(@"_wechat_login_", @"") forState:UIControlStateNormal];
    
    self.butAlipay.layer.cornerRadius = 15.f;
    [self.butAlipay setAttributedTitle:[[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"_ali_login_", @"") attributes:@{NSForegroundColorAttributeName:AppColor.shared.textWhiteColor, NSFontAttributeName:[UIFont fontWithName:AppFont.shared.font_Latin_Bold size:12]}] forState:UIControlStateNormal];
//    [self.butWechat setTitle:NSLocalizedString(@"_wechat_login_", @"") forState:UIControlStateNormal];
    
    self.butLogin.layer.cornerRadius = 10.0f;
    [self.butLogin setBackgroundColor:AppColor.shared.launchColor];
    [self.butLogin setAttributedTitle: [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"_login_mode_", @"") attributes:@{NSForegroundColorAttributeName:AppColor.shared.textWhiteColor,NSFontAttributeName:[UIFont fontWithName:AppFont.shared.font_Latin_Thin size:18]}] forState:UIControlStateNormal];
    
    
}

- (void)viewAccountChange {
    self.accountView.layer.cornerRadius = 5.0f;
    self.accountView.backgroundColor = [UIColor whiteColor];
    self.accountView.layer.borderColor = AppColor.shared.borderGrayColor.CGColor;
    self.accountView.layer.borderWidth = 0.5f;
    /* 登录账号 */
    self.iconAccount.image = [UIImage imageNamed:@"icon_account"];
    self.iconAccount.contentMode = UIViewContentModeCenter;
    self.TFaccount.text = @"";
    self.TFaccount.attributedPlaceholder = [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"_placeholder_account_", @"") attributes:@{NSForegroundColorAttributeName:[UIColor grayColor]}];
    [self viewPasswordChange];
}

- (void)viewPasswordChange {
    self.passwordView.layer.cornerRadius = 5.0f;
    self.passwordView.backgroundColor = [UIColor whiteColor];
    self.passwordView.layer.borderColor = AppColor.shared.borderGrayColor.CGColor;
    self.passwordView.layer.borderWidth = 0.5f;
    /* 登录密码 */
    self.iconPassword.image = [UIImage imageNamed:@"icon_password"];
    self.iconPassword.contentMode = UIViewContentModeCenter;
    self.TFpassword.text = @"";
    self.TFpassword.attributedPlaceholder = [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"_placeholder_password_", @"") attributes:@{NSForegroundColorAttributeName:[UIColor grayColor]}];
}


/* 登录模式 */
- (IBAction)styleLogin:(id)sender {
    /* 切换了模式 */
    self.buttonLoginTag.backgroundColor = [UIColor whiteColor];
    [self.buttonLoginTag setTitleColor:AppColor.shared.launchColor forState:UIControlStateNormal];
    [self.buttonLoginTag setAttributedTitle: [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"_login_mode_", @"") attributes:@{NSForegroundColorAttributeName:AppColor.shared.launchColor,NSFontAttributeName:[UIFont fontWithName:AppFont.shared.font_Latin_Thin size:18]}] forState:UIControlStateNormal];
    /* 注册按钮变灰*/
    self.buttonRegisterTag.backgroundColor = AppColor.shared.borderLightGrayColor;
    [self.buttonRegisterTag setAttributedTitle: [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"_register_mode_", @"") attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont fontWithName:AppFont.shared.font_Latin_Thin size:18]}] forState:UIControlStateNormal];
    /* 重置提示语 */
    self.TFaccount.text = @"";
    self.TFaccount.attributedPlaceholder = [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"_placeholder_account_", @"") attributes:@{NSForegroundColorAttributeName:[UIColor grayColor]}];
    
    self.TFpassword.text = @"";
    self.TFpassword.attributedPlaceholder = [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"_placeholder_password_", @"") attributes:@{NSForegroundColorAttributeName:[UIColor grayColor]}];
    
    [self.butLogin setAttributedTitle: [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"_login_mode_", @"") attributes:@{NSForegroundColorAttributeName:AppColor.shared.textWhiteColor,NSFontAttributeName:[UIFont fontWithName:AppFont.shared.font_Latin_Thin size:18]}] forState:UIControlStateNormal];
}


/* 注册模式 */
- (IBAction)styleRegister:(id)sender {
    /* 切换了模式 */
    self.buttonRegisterTag.backgroundColor = [UIColor whiteColor];
    [self.buttonRegisterTag setAttributedTitle: [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"_register_mode_", @"") attributes:@{NSForegroundColorAttributeName:AppColor.shared.launchColor,NSFontAttributeName:[UIFont fontWithName:AppFont.shared.font_Latin_Thin size:18]}] forState:UIControlStateNormal];
    /* 登录按钮变灰*/
    self.buttonLoginTag.backgroundColor = AppColor.shared.borderLightGrayColor;
    [self.buttonLoginTag setAttributedTitle: [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"_login_mode_", @"") attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont fontWithName:AppFont.shared.font_Latin_Thin size:18]}] forState:UIControlStateNormal];
    /* 重置提示语 */
    self.TFaccount.text = @"";
    self.TFaccount.attributedPlaceholder = [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"_placeholder_register_account_", @"") attributes:@{NSForegroundColorAttributeName:[UIColor grayColor]}];
    
    self.TFpassword.text = @"";
    self.TFpassword.attributedPlaceholder = [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"_placeholder_register_password_", @"") attributes:@{NSForegroundColorAttributeName:[UIColor grayColor]}];
    
    [self.butLogin setAttributedTitle: [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"_register_mode_", @"") attributes:@{NSForegroundColorAttributeName:AppColor.shared.textWhiteColor,NSFontAttributeName:[UIFont fontWithName:AppFont.shared.font_Latin_Thin size:18]}] forState:UIControlStateNormal];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
