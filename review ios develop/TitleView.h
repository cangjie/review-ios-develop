//
//  TitleView.h
//  review ios develop
//
//  Created by 苍杰 on 3/2/16.
//  Copyright © 2016 cangjie. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TitleView;
@protocol TitleViewDelegate <NSObject>

@optional
-(void)leftClicked:(TitleView *)view;//左侧点击
-(void)rightClicked:(TitleView *)view;//右侧点击


@end

@interface TitleView : UIView



@end
