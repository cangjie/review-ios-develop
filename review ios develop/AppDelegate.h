//
//  AppDelegate.h
//  review ios develop
//
//  Created by 苍杰 on 2/24/16.
//  Copyright © 2016 cangjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "BasicNavigationController.h"
#import "TabbarViewController.h"

#import "TestButtonTouchController.h"

@class BasicNavigationController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) BasicNavigationController *tabbarNavVC;
@property (assign, nonatomic) BOOL hasAutoPortrait;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

