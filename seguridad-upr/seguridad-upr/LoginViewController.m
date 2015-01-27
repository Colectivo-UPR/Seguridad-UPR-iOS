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
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.jpg"]];
    
    self.logo  = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"miupi-login.png"]];
    
    self.logo.frame = CGRectMake(50, 100, self.view.bounds.size.width - 100, 60);
    self.email = [[UITextField alloc]initWithFrame:CGRectMake(20, 200, self.view.bounds.size.width - 40, 40)];
    self.passw = [[UITextField alloc]initWithFrame:CGRectMake(20, 260, self.view.bounds.size.width - 40, 40)];
    
    self.email.backgroundColor = [UIColor whiteColor];
    self.email.keyboardType = UIKeyboardTypeEmailAddress;
    self.email.font = [UIFont systemFontOfSize:14.0];
    self.email.textAlignment = NSTextAlignmentCenter;
    self.email.placeholder = @"Email";
    
    
    self.passw.backgroundColor = [UIColor whiteColor];
    self.passw.secureTextEntry = true;
    self.passw.font = [UIFont systemFontOfSize:14.0];
    self.passw.textAlignment = NSTextAlignmentCenter;
    self.passw.placeholder = @"Contraseña";

    
    self.indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self.indicator setCenter:self.view.center];
    [self.view addSubview:self.indicator];
    
    UIButton *login = [[UIButton alloc]initWithFrame:CGRectMake(20, 320, self.view.bounds.size.width - 40, 40)];
    [login setTitle:@"Ingreso" forState:UIControlStateNormal];
    login.backgroundColor = [UIColor redColor];
    login.tintColor = [UIColor redColor];
    [login addTarget:self action:@selector(didTapLogin:) forControlEvents:UIControlEventAllTouchEvents];
    
    [self.view addSubview:self.email];
    [self.view addSubview:self.passw];
    [self.view addSubview:self.logo] ;
    [self.view addSubview:login];

    
}

-(void)didTapLogin:(id)sender {
    
    [self.indicator startAnimating];
    
    NSLog(@"email %@", self.email.text);
    NSLog(@"passw %@", self.passw.text);
    
    HTTPRequestsViewController *requests = [[HTTPRequestsViewController alloc]init];
    [requests auth:self.email.text user:self.passw.text];
    
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

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
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
