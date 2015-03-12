//
//  LoginViewController.m
//  seguridad-upr
//
//  Created by Xiomara on 12/16/14.
//  Copyright (c) 2014 Colectivo-UPR. All rights reserved.
//

#import "AppDelegate.h"
#import "Constants.h"
#import "ViewController.h"
#import "LoginViewController.h"
#import "HTTPRequestsViewController.h"
#import "RegisterViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController


- (instancetype)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.jpg"]];
    
    self.logo  = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"miupi-login.png"]];
    
    self.logo.frame = CGRectMake(50, 90, self.view.bounds.size.width - 100, 80);
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
    [login addTarget:self action:@selector(didTapToLogin:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.email];
    [self.view addSubview:self.passw];
    [self.view addSubview:self.logo] ;
    [self.view addSubview:login];
}

-(void)didTapToLogin:(id)sender
{
    
    [self.indicator startAnimating];
    
    DLog(@"email %@", self.email.text);
    DLog(@"passw %@", self.passw.text);
    
    NSDictionary *parameters = @{@"email":self.email.text,
                                 @"password":self.passw.text};
    
    HTTPRequestsViewController *requests = [[HTTPRequestsViewController alloc]init];
    [requests auth:parameters];
    
}
-(void)didTapRegister:(id)sender
{
    AppDelegate *delegate = [[UIApplication sharedApplication]delegate];
    RegisterViewController *views = [[RegisterViewController alloc] init];
    delegate.window.rootViewController = views;
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
