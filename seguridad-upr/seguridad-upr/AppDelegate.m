//
//  AppDelegate.m
//  seguridad-upr
//
//  Created by Abimael Carrasquillo Ayala on 10/19/14.
//  Copyright (c) 2014 Colectivo-UPR. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "HomeViewController.h"
#import "AlertasViewController.h"
#import "DesalojoViewController.h"
#import "TelefonosViewController.h"
#import "TrolleysViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UITabBarController *tb = [[UITabBarController alloc]init];
    
    UIViewController *alertas  = [[AlertasViewController alloc]initWithNibName:@"AlertasViewController" bundle:nil];
    UIViewController *telefono = [[TelefonosViewController alloc]initWithNibName:@"TelefonosViewController" bundle:nil];
    UIViewController *desalojo = [[DesalojoViewController alloc]initWithNibName:@"DesalojoViewController" bundle:nil];
    UIViewController *trolleys = [[TrolleysViewController alloc]initWithNibName:@"TrolleysViewController" bundle:nil];
    
    tb.viewControllers = @[alertas, telefono, desalojo, trolleys];
    tb.tabBar.tintColor = [UIColor redColor];
    tb.title = @"Alertas";
    
    alertas.title  = @"Alertas";
    telefono.title = @"Teléfonos";
    desalojo.title = @"Desalojo";
    trolleys.title = @"Trolleys";
    
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:tb];
    nc.navigationBar.tintColor = [UIColor whiteColor];
    
    // Descomentar cuando sepamos el color exacto
    //UIColor *color = [self getUIColorObjectFromHexString:@"206691" alpha:0.9];
    
    [nc.navigationBar setBarTintColor:[UIColor redColor]];
    self.window.rootViewController = nc;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (unsigned int)intFromHexString:(NSString *)hexStr
{
    unsigned int hexInt = 0;
    
    // Create scanner
    NSScanner *scanner = [NSScanner scannerWithString:hexStr];
    
    // Tell scanner to skip the # character
    [scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"#"]];
    
    // Scan hex value
    [scanner scanHexInt:&hexInt];
    
    return hexInt;
}

- (UIColor *)getUIColorObjectFromHexString:(NSString *)hexStr alpha:(CGFloat)alpha
{
    // Convert hex string to an integer
    unsigned int hexint = [self intFromHexString:hexStr];
    
    // Create color object, specifying alpha as well
    UIColor *color =
    [UIColor colorWithRed:((CGFloat) ((hexint & 0xFF0000) >> 16))/255
                    green:((CGFloat) ((hexint & 0xFF00) >> 8))/255
                     blue:((CGFloat) (hexint & 0xFF))/255
                    alpha:alpha];
    
    return color;
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

