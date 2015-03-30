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
#import "UPRDataManager.h"
#import "LoginViewController.h"
#import "HTTPRequestsViewController.h"
#import "RegistrationAuthViewController.h"

@interface LoginViewController ()

@property (strong, nonatomic) UIButton *loginButton;
@property (strong, nonatomic) UIButton *redirectButton; 

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
    
    self.logo.frame = CGRectMake(50, 70, self.view.bounds.size.width - 100, 80);
    self.email = [[UITextField alloc]initWithFrame:CGRectMake(20, 170, self.view.bounds.size.width - 40, 40)];
    self.passw = [[UITextField alloc]initWithFrame:CGRectMake(20, 220, self.view.bounds.size.width - 40, 40)];
    
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
    
    self.loginButton = [[UIButton alloc]initWithFrame:CGRectMake(20, 300, self.view.bounds.size.width - 40, 40)];
    self.loginButton.backgroundColor = [UIColor redColor];
    self.loginButton.tintColor = [UIColor redColor];
    
    [self.loginButton setTitle:@"Ingreso" forState:UIControlStateNormal];
    [self.loginButton addTarget:self action:@selector(didTapToLogin:) forControlEvents:UIControlEventTouchUpInside];
    
    self.redirectButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 350, self.view.bounds.size.width - 40, 40)];
    self.redirectButton.backgroundColor = [UIColor clearColor];
    self.redirectButton.tintColor = [UIColor blackColor];
    self.redirectButton.font = [UIFont systemFontOfSize:12.0];
    
    [self.redirectButton setTitle:@"No tengo cuenta, ir al registro" forState:UIControlStateNormal];
    [self.redirectButton addTarget:self action:@selector(didTapRegister:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.email];
    [self.view addSubview:self.passw];
    [self.view addSubview:self.logo] ;
    [self.view addSubview:self.loginButton];
    [self.view addSubview:self.redirectButton];
}

#pragma mark - Private Methods

- (void)createAlert:(NSDictionary *)attributes
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[attributes valueForKey:@"title"]
                                                    message:[attributes valueForKey:@"message"]
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    
    [alert show];
}

#pragma mark - Selector Methods

- (void)didTapToLogin:(id)sender
{
    
    [self.indicator startAnimating];
    
    DLog(@"email %@", self.email.text);
    DLog(@"passw %@", self.passw.text);
    
    NSDictionary *parameters = @{@"username":self.email.text,
                                 @"password":self.passw.text};
    
    HTTPRequestsViewController *requests = [[HTTPRequestsViewController alloc]init];
    [requests auth:parameters completion:^(NSString *status, NSString *token) {
        if ([status isEqual:@"active"]) {
            ViewController *views = [[ViewController alloc] init];
            [self presentViewController:views animated:YES completion:nil];
        } else {
            NSDictionary *alert = @{@"title":[[UPRDataManager sharedManager]titleAlert],
                                    @"message":[[UPRDataManager sharedManager]inactiveMessage]};
            
            [self createAlert:alert];
            [self.indicator stopAnimating];
            
            self.email.text = @"";
            self.passw.text = @""; 
        }
    }];
    
}
-(void)didTapRegister:(id)sender
{
    AppDelegate *delegate = [[UIApplication sharedApplication]delegate];
    RegistrationAuthViewController *views = [[RegistrationAuthViewController alloc] init];
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
