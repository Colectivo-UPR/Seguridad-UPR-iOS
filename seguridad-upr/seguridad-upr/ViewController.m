//
//  ViewController.m
//  seguridad-upr
//
//  Created by Abimael Carrasquillo Ayala on 10/19/14.
//  Copyright (c) 2014 Colectivo-UPR. All rights reserved.
//

#import "ViewController.h"
#import "AlertsViewController.h"
#import "ResourcesViewController.h"
#import "PhonesViewController.h"
#import "DesalojoViewController.h"
#import "TrolleysViewController.h"
#import "NewAlertViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (instancetype)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    AppDelegate *delegate = [[UIApplication sharedApplication]delegate];
    
    UITabBarController *tb = [[UITabBarController alloc]init];
    
    UIViewController *alerts  = [[AlertsViewController alloc] init];
    UINavigationController *ncAlerts = [[UINavigationController alloc]initWithRootViewController:alerts];
    [ncAlerts.navigationBar setBarTintColor:[UIColor redColor]];
    
    UIViewController *phones = [[PhonesViewController alloc] init];
    UINavigationController *ncPhones = [[UINavigationController alloc] initWithRootViewController:phones];
    [ncPhones.navigationBar setBarTintColor:[UIColor redColor]];
    
    UIViewController *desalojo = [[DesalojoViewController alloc] init];
    UINavigationController *ncDesalojo = [[UINavigationController alloc]initWithRootViewController:desalojo];
    [ncDesalojo.navigationBar setBarTintColor:[UIColor redColor]];
    
    UIViewController *trolleys = [[TrolleysViewController alloc] init];
    UINavigationController *ncTrolleys = [[UINavigationController alloc]initWithRootViewController:trolleys];
    [ncTrolleys.navigationBar setBarTintColor:[UIColor redColor]];
    
    UIViewController *resources = [[ResourcesViewController alloc]init];
    UINavigationController *ncResources = [[UINavigationController alloc]initWithRootViewController:resources];
    [ncResources.navigationBar setBarTintColor:[UIColor redColor]];
    
    // Add navigation controllers to each tabitem
    
    tb.viewControllers = @[ncAlerts, ncPhones, ncDesalojo, ncTrolleys, ncResources];
    tb.tabBar.tintColor = [UIColor redColor];
    
    alerts.title = @"Alertas";
    phones.title = @"Teléfonos";
    desalojo.title = @"Desalojo";
    trolleys.title = @"Trolleys";
    resources.title = @"Recursos";
    
    // Item 0
    [(UITabBarItem *)[tb.tabBar.items objectAtIndex:0] setImage:[UIImage imageNamed:@"World-Icon"]];
    
    // Item 1
    [(UITabBarItem *)[tb.tabBar.items objectAtIndex:1] setImage:[UIImage imageNamed:@"Phone-icon"]];
    
    // Item 2
    [(UITabBarItem *)[tb.tabBar.items objectAtIndex:2] setImage:[UIImage imageNamed:@"Route-Icon"]];
    
    // Item 3
    [(UITabBarItem *)[tb.tabBar.items objectAtIndex:3] setImage:[UIImage imageNamed:@"Trolley-Icon"]];
    
    // Item 4
    [(UITabBarItem *)[tb.tabBar.items objectAtIndex:4] setImage:[UIImage imageNamed:@"Services-icon"]];
    
    
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:tb];

    [nc.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg.png"] forBarMetrics:UIBarMetricsDefault];
    nc.navigationBar.tintColor = [UIColor whiteColor];
    
    delegate.window.rootViewController = tb;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
