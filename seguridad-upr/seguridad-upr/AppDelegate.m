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
#import "RecursosViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    CGRect screenBounds = [[UIScreen mainScreen]bounds];
    
    UIWindow *window = [[UIWindow alloc]initWithFrame:screenBounds];
    
    [self setWindow:window];

    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UITabBarController *tb = [[UITabBarController alloc]init];
    
    UIViewController *alertas  = [[AlertasViewController alloc]initWithNibName:@"AlertasViewController" bundle:nil];
    UINavigationController *ncAlertas = [[UINavigationController alloc]initWithRootViewController:alertas];
    [ncAlertas.navigationBar setBarTintColor:[UIColor redColor]];
    
    UIViewController *telefono = [[TelefonosViewController alloc]initWithNibName:@"TelefonosViewController" bundle:nil];
    UINavigationController *ncTelefono = [[UINavigationController alloc]initWithRootViewController:telefono];
    [ncTelefono.navigationBar setBarTintColor:[UIColor redColor]];
    
    UIViewController *desalojo = [[DesalojoViewController alloc]initWithNibName:@"DesalojoViewController" bundle:nil];
    UINavigationController *ncDesalojo = [[UINavigationController alloc]initWithRootViewController:desalojo];
    [ncDesalojo.navigationBar setBarTintColor:[UIColor redColor]];
    
    UIViewController *trolleys = [[TrolleysViewController alloc]initWithNibName:@"TrolleysViewController" bundle:nil];
    UINavigationController *ncTrolleys = [[UINavigationController alloc]initWithRootViewController:trolleys];
    [ncTrolleys.navigationBar setBarTintColor:[UIColor redColor]];
    
    UIViewController *recursos = [[RecursosViewController alloc]initWithNibName:@"TrolleysViewController" bundle:nil];
    UINavigationController *ncRecursos = [[UINavigationController alloc]initWithRootViewController:recursos];
    [ncRecursos.navigationBar setBarTintColor:[UIColor redColor]];
    
    
    // Add navigation controllers to each tabitem
    
    
    tb.viewControllers = @[ncAlertas, ncTelefono, ncDesalojo, ncTrolleys, ncRecursos];
    tb.tabBar.tintColor = [UIColor redColor];
    
    alertas.title  = @"Alertas";
    telefono.title = @"Teléfonos";
    desalojo.title = @"Desalojo";
    trolleys.title = @"Trolleys";
    recursos.title = @"Recursos";

    // Initialize Views
    
    // Set the icons
    
    // Item 0
    
    [(UITabBarItem *)[tb.tabBar.items objectAtIndex:0] setImage:[UIImage imageNamed:@"World-Icon"]];
    
    // Item 1
    [(UITabBarItem *)[tb.tabBar.items objectAtIndex:1] setImage:[UIImage imageNamed:@"Phone-Icon"]];
    
    // Item 2
    [(UITabBarItem *)[tb.tabBar.items objectAtIndex:2] setImage:[UIImage imageNamed:@"Route-Icon"]];
    
    // Item 3
    [(UITabBarItem *)[tb.tabBar.items objectAtIndex:3] setImage:[UIImage imageNamed:@"Trolley-Icon"]];
    
    
    // Item 4
    [(UITabBarItem *)[tb.tabBar.items objectAtIndex:4] setImage:[UIImage imageNamed:@"Services-Icon"]];
    
    
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:tb];
    nc.navigationBar.tintColor = [UIColor whiteColor];

    
    // Descomentar cuando sepamos el color exacto
    //UIColor *color = [self getUIColorObjectFromHexString:@"206691" alpha:0.9];
    
    [self.window setRootViewController:tb];
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

