//
//  AppDelegate.m
//  seguridad-upr
//
//  Created by Abimael Carrasquillo Ayala on 10/19/14.
//  Copyright (c) 2014 Colectivo-UPR. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen]bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    // Initialize a navigation controller and a tabbar controller
    ViewController *viewController1 = [[ViewController alloc]init]; // Initialize View Controller
    UINavigationController *navigationViewController1 = [[UINavigationController alloc]initWithRootViewController:viewController1]; // Set root view Controller
    
    // Other 3 View Controllers
    UIViewController *viewController2 = [[UIViewController alloc] init];
    UIViewController *viewController3 = [[UIViewController alloc] init];
    UIViewController *viewController4 = [[UIViewController alloc] init];
    UIViewController *viewController5 = [[UIViewController alloc] init];
    
    UITabBarController *mainTabBarController = [[UITabBarController alloc]init];
    
    // Tint Color
    
    UIColor *redColor = [UIColor colorWithRed:355.0f/255.0f
                                        green:84.0/255.0f
                                        blue:84.0/255.0f
                                        alpha:1.0f];
    
    
    [[mainTabBarController tabBar] setTintColor:redColor];
    
    // Initialize Views
    
    [mainTabBarController setViewControllers:@[navigationViewController1, viewController2, viewController3, viewController4, viewController5]];
    
    // Set the icons
    
    // Item 0
    
    [(UITabBarItem *)[mainTabBarController.tabBar.items objectAtIndex:0] setImage:[UIImage imageNamed:@"World-Icon"]];
    
    // Item 1
    [(UITabBarItem *)[mainTabBarController.tabBar.items objectAtIndex:1] setImage:[UIImage imageNamed:@"Phone-Icon"]];
    
    // Item 2
    [(UITabBarItem *)[mainTabBarController.tabBar.items objectAtIndex:2] setImage:[UIImage imageNamed:@"Route-Icon"]];
    
    // Item 3
    [(UITabBarItem *)[mainTabBarController.tabBar.items objectAtIndex:3] setImage:[UIImage imageNamed:@"Trolley-Icon"]];
    
    // Item 4
    [(UITabBarItem *)[mainTabBarController.tabBar.items objectAtIndex:4] setImage:[UIImage imageNamed:@"Services-Icon"]];
    
    self.window.rootViewController = mainTabBarController;
    [self.window makeKeyAndVisible];
     
     
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
