//
//  MyCalendarViewController.m
//  review ios develop
//
//  Created by 苍杰 on 3/2/16.
//  Copyright © 2016 cangjie. All rights reserved.
//

#import "MyCalendarViewController.h"

@interface MyCalendarViewController ()

@end

@implementation MyCalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.titleView setTitleText:@"test" withTitleStyle:CTitleStyle_Home ];
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
