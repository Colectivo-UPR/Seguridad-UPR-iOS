//
//  LoginViewController.m
//  seguridad-upr
//
//  Created by Xiomara on 12/16/14.
//  Copyright (c) 2014 Colectivo-UPR. All rights reserved.
//

#import "LoginViewController.h"
#import "ViewController.h"
#import "AppDelegate.h"
#import "HTTPRequestsViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
        self.title = @"Trolleys";
        
        self.view.tintColor = [UIColor whiteColor];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.email = [[UITextField alloc]initWithFrame:CGRectMake(80, 160, self.view.bounds.size.width, 40)];
    self.passw = [[UITextField alloc]initWithFrame:CGRectMake(100, 215, self.view.bounds.size.width, 40)];
    
    self.email.backgroundColor = [UIColor whiteColor];
    self.email.keyboardType = UIKeyboardTypeEmailAddress;
    self.email.placeholder = @"Correo Electrónico";
    
    self.passw.backgroundColor = [UIColor whiteColor];
    self.passw.secureTextEntry = true;
    self.passw.placeholder = @"Contraseña";
    
    UIButton *login = [[UIButton alloc]initWithFrame:CGRectMake(20, 400, self.view.bounds.size.width - 40, 40)];
    [login setTitle:@"Entrar" forState:UIControlStateNormal];
    login.backgroundColor = [UIColor redColor];
    login.tintColor = [UIColor redColor];
    [login addTarget:self action:@selector(didTapLogin:) forControlEvents:UIControlEventAllTouchEvents];
    
    
//    [self.view setBackgroundColor:[self getUIColorObjectFromHexString:@"fdfcfa" alpha:01]];
    
    [self.view addSubview:self.email];
    [self.view addSubview:self.passw];
    [self.view addSubview:login]; 
    
}

-(void)didTapLogin:(id)sender {
//    AppDelegate *delegate = [[UIApplication sharedApplication]delegate];
//    
//    ViewController *loginView = [[ViewController alloc]initWithNibName:@"ViewController" bundle:nil];
//    delegate.window.rootViewController = loginView;
    
    HTTPRequestsViewController *requests = [[HTTPRequestsViewController alloc]init];
    [requests auth:self.passw.text user:self.email.text]; 
    
    
    NSLog(@"email %@", self.email.text);
    NSLog(@"passw %@", self.passw.text);
    
}

- (UIColor *)getUIColorObjectFromHexString:(NSString *)hexStr alpha:(CGFloat)alpha {
    // Convert hex string to an integer
    unsigned int hexint = [self intFromHexString:hexStr];
    
    // Create color object, specifying alpha as well
    UIColor *color =
    [UIColor colorWithRed:((CGFloat) ((hexint & 0xFF0000) >> 16))/255
                    green:((CGFloat) ((hexint & 0xFF00) >> 8))/255
                     blue:((CGFloat) (hexint & 0xFF))/255
                    alpha:alpha]; //f6f0e9
    
    return color;
}

- (unsigned int)intFromHexString:(NSString *)hexStr {
    unsigned int hexInt = 0;
    
    // Create scanner
    NSScanner *scanner = [NSScanner scannerWithString:hexStr];
    
    // Tell scanner to skip the # character
    [scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"#"]];
    
    // Scan hex value
    [scanner scanHexInt:&hexInt];
    
    return hexInt;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
