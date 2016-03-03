//
//  TabbarViewController.h
//  review ios develop
//
//  Created by 苍杰 on 3/2/16.
//  Copyright © 2016 cangjie. All rights reserved.
//

#import "BasicViewController.h"
#import "MyCalendarViewController.h"
#import "MainViewController.h"
@class MyCalendarViewController;



@interface TabbarItem : UIView

@property (nonatomic, strong) UIImageView *iconImgView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *button;


- (void)setIconHighlightImg:(UIImage *)hImg; /*选中时的文本颜色*/
- (void)setTextHighlightColor:(UIColor *)hColor; /*选中时的文本颜色*/

- (id)initWithFrame:(CGRect)frame aIcon:(UIImage *)icon aTitle:(NSString *)title;
- (void)addTarget:(id)target action:(SEL)action;
- (void)didSelected:(BOOL)select;
@end






@interface TabbarViewController : BasicViewController
{
    
    UIViewController    *currentViewController;
    UIViewController    *lastViewController;
    NSMutableArray      *tabBarItemsArray;
    
    MainViewController          *mainVC;
    MyCalendarViewController    *myCalendarVC;



}


@property (weak, nonatomic) IBOutlet UIView *tabbarView;


@property (nonatomic, strong) NSArray *viewControllers;
@property (weak, nonatomic) IBOutlet UIImageView *tabbarBgImgView;

@property (nonatomic, assign) NSInteger currentIndex;

@end
