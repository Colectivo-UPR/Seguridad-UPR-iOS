//
//  AppDelegate.h
//  seguridad-upr
//
//  Created by Abimael Carrasquillo Ayala on 10/19/14.
//  Copyright (c) 2014 Colectivo-UPR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UITabBarController *tabBarController;

@property (strong, nonatomic) UINavigationController *navigationController1;
@property (strong, nonatomic) UINavigationController *navigationController2;
@property (strong, nonatomic) UINavigationController *navigationController3;
@property (strong, nonatomic) UINavigationController *navigationController4;
@property (strong, nonatomic) UINavigationController *navigationController5;

@property NSDictionary *incidents;
@property NSDictionary *phones;
@property NSDictionary *reports;

@end

