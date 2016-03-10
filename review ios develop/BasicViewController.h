//
//  BasicViewController.h
//  review ios develop
//
//  Created by 苍杰 on 3/2/16.
//  Copyright © 2016 cangjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TitleView.h"
//#import "HttpRequest.h"
#import "AppDelegate.h"

@interface BasicViewController : UIViewController<TitleViewDelegate>

@property (nonatomic, strong) UIViewController *tabbarVC;  /*使用此属性代替原有导航<>*/
@property (nonatomic,retain) IBOutlet TitleView *titleView;
@property (nonatomic,retain) IBOutlet UIView *allContentView;

- (void)resetHttp;
/**
 * 打开左侧视图
 **/
- (void)openLeftVC;

/**
 * 显示指示器
 **/
- (void)showHUD:(NSString *)title;

/**
 * 隐藏指示器
 **/
- (void)hiddenHUD;

/**
 * 错误状态
 **/
- (void)showHUDEorror:(NSString *)title;

/**
 * 成功状态
 **/
- (void)showHUDSuccess:(NSString *)title;
/**
 * 判断当前控制是否正在显示
 **/
- (BOOL) isVisible;

/**
 * http请求成功后的回调
 */
//- (void)requestFinished:(ASIHTTPRequest *) request;
/**
 * http请求失败后的回调
 */
//- (void)requestFailed:(ASIHTTPRequest *) request;

/**
 * shouLoginVC
 **/
- (BOOL)showLoginVC;

@end
