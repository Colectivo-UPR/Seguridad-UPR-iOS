//
//  ViewController.m
//  seguridad-upr
//
//  Created by Abimael Carrasquillo Ayala on 10/19/14.
//  Copyright (c) 2014 Colectivo-UPR. All rights reserved.
//

#import "ViewController.h"
#import "AlertasViewController.h"
#import "RecursosViewController.h"
#import "TelefonosViewController.h"
#import "DesalojoViewController.h"
#import "TrolleysViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController




// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
        self.title = @"";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    AppDelegate *delegate = [[UIApplication sharedApplication]delegate];
    
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
    [(UITabBarItem *)[tb.tabBar.items objectAtIndex:1] setImage:[UIImage imageNamed:@"Phone-icon"]];
    
    // Item 2
    [(UITabBarItem *)[tb.tabBar.items objectAtIndex:2] setImage:[UIImage imageNamed:@"Route-Icon"]];
    
    // Item 3
    [(UITabBarItem *)[tb.tabBar.items objectAtIndex:3] setImage:[UIImage imageNamed:@"Trolley-Icon"]];
    
    
    // Item 4
    [(UITabBarItem *)[tb.tabBar.items objectAtIndex:4] setImage:[UIImage imageNamed:@"Services-icon"]];
    
    
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:tb];
    nc.navigationBar.tintColor = [UIColor whiteColor];
    nc.navigationBar.backgroundColor = [UIColor redColor]; 
    
    UIImage *img = [UIImage imageNamed:@"post.png"];
    
    UIBarButtonItem *alertButton = [[UIBarButtonItem alloc]initWithImage:img style:UIBarButtonItemStyleDone target:self action:@selector(didTapConnect:)];
    
    alertButton.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = alertButton;
    nc.tabBarController.navigationItem.rightBarButtonItem = alertButton;
    tb.navigationController.navigationItem.rightBarButtonItem = alertButton;
    delegate.window.rootViewController = tb;
}

-(void)didTapConnect:(id)sender {
    NSLog(@"HOLLA");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
