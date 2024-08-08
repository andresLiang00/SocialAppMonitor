//
//  GroupTopView.h
//  SocialCommunity
//
//  Created by Tim on 2024/8/8.
//

#import <UIKit/UIKit.h>
#import "GroupSearch.h"

NS_ASSUME_NONNULL_BEGIN

@interface GroupTopView : UIView

/* 关闭界面 */
@property (nonatomic, strong) UIButton *groupClose;
/* 界面标题 */
@property (nonatomic, strong) UILabel *groupTitle;
/* 创建群组 */
@property (nonatomic, strong) UIButton *groupCreate;
/* 搜索联系人整体搜索框 */
@property (nonatomic, strong) UIView *searchSpace;
/* 搜索联系人图标 */
@property (nonatomic, strong) UIImageView *searchIcon;
/* 搜索联系人输入框 */
@property (nonatomic, strong) UITextField *searchTF;
/* 被选中的群组的个数 */
@property (nonatomic, strong) UILabel *includeGroupLabel;

# pragma mark - 更新选中的群组文字
- (void)updateIncludeGroups:(CGFloat)groupNum;

@end

NS_ASSUME_NONNULL_END
