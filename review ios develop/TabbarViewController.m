//
//  TabbarViewController.m
//  review ios develop
//
//  Created by 苍杰 on 3/2/16.
//  Copyright © 2016 cangjie. All rights reserved.
//

#import "TabbarViewController.h"

#define TabbarViewHeight 49.0f
#define IconSize CGSizeMake(21, 21)
#define ItemTitleLine 2.0f

@implementation TabbarItem

- (id)initWithFrame:(CGRect)frame aIcon:(UIImage *)icon aTitle:(NSString *)title
{
    self = [super initWithFrame:frame];
    if (self) {
        //icon
        if(icon) {
            self.iconImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, IconSize.width, IconSize.height)];
            self.iconImgView.image = icon;
            self.iconImgView.highlightedImage = icon;
            self.iconImgView.highlighted = NO;
            [self addSubview:self.iconImgView];
        }
        
        //lable
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.titleLabel.font = [UIFont systemFontOfSize:14.0f];
        self.titleLabel.textColor = [UIColor colorWithRed:104/255.0 green:108/255.0 blue:113/255.0 alpha:1];
        self.titleLabel.highlightedTextColor = [UIColor colorWithRed:104/255.0 green:108/255.0 blue:113/255.0 alpha:1];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.text = title;
        [self.titleLabel sizeToFit];
        [self addSubview:self.titleLabel];
        
        self.button = [UIButton buttonWithType:UIButtonTypeCustom];
        self.button.frame = self.bounds;
        self.button.adjustsImageWhenDisabled = NO;
        self.button.adjustsImageWhenHighlighted = NO;
        [self addSubview:self.button];
    }
    return self;
}

- (void)layoutSubviews {
    
    CGRect iconRect = self.iconImgView.frame;
    CGRect labelRect = self.titleLabel.frame;
    CGSize vSize = self.frame.size;
    
    iconRect.origin.x = (vSize.width - iconRect.size.width) * 0.5;
    iconRect.origin.y = (vSize.height - iconRect.size.height - labelRect.size.height -ItemTitleLine) * 0.5;
    
    labelRect.origin.x = (vSize.width - labelRect.size.width) * 0.5;
    labelRect.origin.y = iconRect.origin.y+ItemTitleLine + iconRect.size.height;
    
    self.iconImgView.frame = iconRect;
    self.titleLabel.frame = labelRect;
    
    self.button.frame = self.bounds;
}

- (void)didSelected:(BOOL)select
{
    self.iconImgView.highlighted = select;
    self.titleLabel.highlighted = select;
}

/*选中时的文本颜色*/
- (void)setIconHighlightImg:(UIImage *)hImg
{
    self.iconImgView.highlightedImage = hImg;
}

/*选中时的文本颜色*/
- (void)setTextHighlightColor:(UIColor *)hColor
{
    self.titleLabel.highlightedTextColor = hColor;
}

- (void)setTag:(NSInteger)tag {
    [super setTag:tag];
    self.button.tag = tag;
}

- (void)addTarget:(id)target action:(SEL)action
{
    [self.button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}
@end





@implementation TabbarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        
        myCalendarVC = [[MyCalendarViewController alloc] initWithNibName:nil bundle:nil];
        myCalendarVC.tabbarVC = self;
        myCalendarVC.view.width = SCREENWIDTH;
        myCalendarVC.view.height = SCREENHEIGHT;
        
        mainVC = [[MainViewController alloc] initWithNibName:nil bundle:nil];
        mainVC.tabbarVC = self;
        mainVC.view.width = SCREENWIDTH;
        mainVC.view.height = SCREENHEIGHT;

        self.viewControllers = [NSArray arrayWithObjects:myCalendarVC, mainVC, nil];
    }
    
    
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   
    self.currentIndex =0;
    [self changeVCWithindex:self.currentIndex];
    
    self.tabbarBgImgView.userInteractionEnabled = YES;
    
 
    
    self.allContentView.backgroundColor = [UIColor blackColor];
    
    self.tabbarView.frame = CGRectMake(0, self.allContentView.height - TabbarViewHeight, self.allContentView.width, TabbarViewHeight);
    
    UIImage *tabbarImg = [UIImage imageNamed:@"tabbar底"];
    tabbarImg = [tabbarImg resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
    self.tabbarBgImgView.image = tabbarImg;
    
    
    
    //alloc init items
    
    NSArray *nomalIcons = @[@"tabbar课表",@"tabbar课程"];
    NSArray *hIcons = @[@"tabbar课表按下",@"tabbar课程按下"];
    NSArray *titles = @[CSLocalizedString(@"tab_VC_clasListText"),CSLocalizedString(@"tab_VC_courseText")];
    
    int itemsCount = 2;
    CGSize itemSize = CGSizeMake(self.tabbarBgImgView.bounds.size.width / itemsCount, TabbarViewHeight);

    float x = 0;
    for (int i = 0; i < itemsCount; i ++) {
        NSString *nomalImgName = nomalIcons[i];
        NSString *hImgName = hIcons[i];
        NSString *titleText = titles[i];
        
        
        TabbarItem *tmpTabbarItem = [[TabbarItem alloc] initWithFrame:CGRectMake(x, 0, itemSize.width, itemSize.height)
                                                                aIcon:[UIImage imageNamed:nomalImgName]
                                                               aTitle:titleText];
        x += itemSize.width;
        tmpTabbarItem.tag = i;
        [tmpTabbarItem setTextHighlightColor:[UIColor colorWithRed:23/255.0 green:95/255.0 blue:199/255.0 alpha:1]];
        [tmpTabbarItem setIconHighlightImg:[UIImage imageNamed:hImgName]];
        [tmpTabbarItem addTarget:self action:@selector(selectItemAction:)];
        [tmpTabbarItem didSelected:(self.currentIndex == i)];
        [self.tabbarBgImgView addSubview:tmpTabbarItem];
    }

}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)changeVCWithindex:(NSInteger )idx
{
    if (currentViewController) {
        [currentViewController.view removeFromSuperview];
    }
    currentViewController = [self.viewControllers objectAtIndex:idx];
    [self.allContentView insertSubview:currentViewController.view atIndex:0];
    
}


- (void)selectItemAction:(TabbarItem *)item {
    NSInteger index = item.tag;
    if (self.currentIndex == index) {
        return;
    }
    
    self.currentIndex = index;
    [self.tabbarBgImgView.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        TabbarItem *tmpTabbarItem = (TabbarItem *)obj;
        [tmpTabbarItem didSelected:(self.currentIndex == idx)];
        
    }];
    CSLog(@"选择index: %ld",(long)item.tag);
    
    
    [self changeVCWithindex:self.currentIndex];
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
