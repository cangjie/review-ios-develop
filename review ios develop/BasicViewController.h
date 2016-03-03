//
//  BasicViewController.h
//  review ios develop
//
//  Created by 苍杰 on 3/2/16.
//  Copyright © 2016 cangjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TitleView.h"

@interface BasicViewController : UIViewController<TitleViewDelegate>

@property (nonatomic, strong) UIViewController *tabbarVC;  /*使用此属性代替原有导航<>*/
@property (nonatomic,retain) IBOutlet TitleView *titleView;
@property (nonatomic,retain) IBOutlet UIView *allContentView;

@end
