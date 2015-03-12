//
//  RegisterViewController.m
//  seguridad-upr
//
//  Created by Xiomara on 12/4/14.
//  Copyright (c) 2014 Colectivo-UPR. All rights reserved.
//

#import "RegisterViewController.h"
#import "HTTPRequestsViewController.h"
#import "LoginViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (instancetype)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.jpg"]];
    self.logo  = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"miupi-login.png"]];
    
    self.logo.frame = CGRectMake(50, 90, self.view.bounds.size.width - 100, 80);
    self.email = [[UITextField alloc]initWithFrame:CGRectMake(20, 300, self.view.bounds.size.width - 40, 40)];
    self.passw = [[UITextField alloc]initWithFrame:CGRectMake(20, 360, self.view.bounds.size.width - 40, 40)];
    self.name  = [[UITextField alloc]initWithFrame:CGRectMake(20, 180, self.view.bounds.size.width - 40, 40)];
    self.lstn  = [[UITextField alloc]initWithFrame:CGRectMake(20, 240, self.view.bounds.size.width - 40, 40)];
    
    self.name.backgroundColor = [UIColor whiteColor];
    self.name.font = [UIFont systemFontOfSize:14.0];
    self.name.textAlignment = NSTextAlignmentCenter;
    self.name.placeholder = @"Nombre";
    
    self.lstn.backgroundColor = [UIColor whiteColor];
    self.lstn.font = [UIFont systemFontOfSize:14.0];
    self.lstn.textAlignment = NSTextAlignmentCenter;
    self.lstn.placeholder = @"Apellidos";
    
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
    
    UIButton *login = [[UIButton alloc]initWithFrame:CGRectMake(20, 420, self.view.bounds.size.width - 40, 40)];
    [login setTitle:@"Registrame" forState:UIControlStateNormal];
    login.backgroundColor = [UIColor redColor];
    login.tintColor = [UIColor redColor];
    [login addTarget:self action:@selector(didTapToReg:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.email];
    [self.view addSubview:self.passw];
    [self.view addSubview:self.name];
    [self.view addSubview:self.lstn];
    [self.view addSubview:self.logo] ;
    [self.view addSubview:login];
}

-(void)didTapToReg:(id)sender
{
    NSDictionary *parameters = @{@"email": self.email.text,
                                 @"first_name":self.name.text,
                                 @"last_name":self.lstn.text,
                                 @"password":self.passw.text,
                                 };

    NSDictionary *params = @{@"email": self.email.text,
                            @"password":self.passw.text,
                            };
    
    HTTPRequestsViewController *requests = [[HTTPRequestsViewController alloc]init];
    [requests registration:parameters login:params];
    
}

-(void)didTapToLogin:(id)sender
{
    AppDelegate *delegate = [[UIApplication sharedApplication]delegate];
    LoginViewController *views = [[LoginViewController alloc] init];
    delegate.window.rootViewController = views;
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
