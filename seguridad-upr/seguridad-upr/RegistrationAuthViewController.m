//
//  RegistrationAuthViewController.m
//  seguridad-upr
//
//  Created by Xiomara on 3/26/15.
//  Copyright (c) 2015 Colectivo-UPR. All rights reserved.
//

#import "RegistrationAuthViewController.h"
#import "HTTPRequestsViewController.h"
#import "LoginViewController.h"
#import "UPRDataManager.h"
#import "ViewController.h"
#import "Constants.h"

@interface RegistrationAuthViewController()

@property UIActivityIndicatorView *indicator; 

@end

@implementation RegistrationAuthViewController

- (instancetype)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.title = @"Registro";
        
    }
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.jpg"]];
    self.view.tintColor = [UIColor blackColor];
    
    self.logo  = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"miupi-login.png"]];
    self.logo.frame = CGRectMake(50, 70, self.view.bounds.size.width - 100, 80);
    
    [self.view addSubview:self.logo];
    
    self.email = [[UITextField alloc]initWithFrame:CGRectMake(20, 280, self.view.bounds.size.width - 40, 40)];
    self.passw = [[UITextField alloc]initWithFrame:CGRectMake(20, 340, self.view.bounds.size.width - 40, 40)];
    self.name  = [[UITextField alloc]initWithFrame:CGRectMake(20, 160, self.view.bounds.size.width - 40, 40)];
    self.lstn  = [[UITextField alloc]initWithFrame:CGRectMake(20, 220, self.view.bounds.size.width - 40, 40)];
    
    self.name.backgroundColor = [UIColor whiteColor];
    self.name.font = [UIFont systemFontOfSize:14.0];
    self.name.textAlignment = NSTextAlignmentCenter;
    self.name.placeholder = @"Nombre";
    
    [self.view addSubview:self.name];
    
    self.lstn.backgroundColor = [UIColor whiteColor];
    self.lstn.font = [UIFont systemFontOfSize:14.0];
    self.lstn.textAlignment = NSTextAlignmentCenter;
    self.lstn.placeholder = @"Apellidos";
    
    [self.view addSubview:self.lstn];
    
    self.email.backgroundColor = [UIColor whiteColor];
    self.email.keyboardType = UIKeyboardTypeEmailAddress;
    self.email.font = [UIFont systemFontOfSize:14.0];
    self.email.textAlignment = NSTextAlignmentCenter;
    self.email.placeholder = @"Email";
    
    [self.view addSubview:self.email];
    
    self.passw.backgroundColor = [UIColor whiteColor];
    self.passw.secureTextEntry = true;
    self.passw.font = [UIFont systemFontOfSize:14.0];
    self.passw.textAlignment = NSTextAlignmentCenter;
    self.passw.placeholder = @"Contraseña";
    
    [self.view addSubview:self.passw];
    
    self.indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    [self.indicator setCenter:self.view.center];
    [self.view addSubview:self.indicator];
    
    self.registerButton = [[UIButton alloc]initWithFrame:CGRectMake(20, 400, self.view.bounds.size.width - 40, 40)];
    self.registerButton.backgroundColor = [UIColor redColor];
    
    [self.registerButton setTitle:@"Registrame" forState:UIControlStateNormal];
    [self.registerButton addTarget:self action:@selector(didTapToRegister:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.registerButton];
    
    self.redirectButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.redirectButton.frame = CGRectMake(20, 450, self.view.bounds.size.width - 40, 40);
    self.redirectButton.backgroundColor = [UIColor clearColor];
    self.redirectButton.font = [UIFont systemFontOfSize:12.0];
    self.redirectButton.tintColor = [UIColor blackColor];

    [self.redirectButton setTintColor:[UIColor blackColor]]; 
    [self.redirectButton setTitle:@"Ya tengo cuenta, entrar" forState:UIControlStateNormal];
    [self.redirectButton addTarget:self action:@selector(didTapToRedirect:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.redirectButton];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)didTapToRegister:(id)sender
{
    NSDictionary *parameters = @{@"email": self.email.text,
                                 @"first_name":self.name.text,
                                 @"last_name":self.lstn.text,
                                 @"password1":self.passw.text,
                                 @"password2":self.passw.text,
                                 };
    
    NSDictionary *params = @{@"username": self.email.text,
                             @"password" :self.passw.text,
                             };
    
    [self.indicator startAnimating];
    
    HTTPRequestsViewController *requests = [HTTPRequestsViewController sharedManager];
    [requests registration:parameters login:params completion:^(NSString *status, NSString *token) {
        if ([status isEqual: @"alert"]) {
            
            NSDictionary *alert = @{@"title":[[UPRDataManager sharedManager]activeTitle],
                                    @"message":[[UPRDataManager sharedManager]actionMessage]};
            
            LoginViewController *login = [[LoginViewController alloc] initWithAlert:alert];
            [self presentViewController:login animated:YES completion:nil];

        } if ([status isEqual: @"invalid"]) {
            NSDictionary *alert = @{@"title":[[UPRDataManager sharedManager]titleAlert],
                                    @"message":[[UPRDataManager sharedManager]generalMessage]};
            
            [self.delegate createAlert:alert];
            [self.indicator stopAnimating];
            
            self.email.text = @"";
            self.name.text = @"";
            self.lstn.text = @"";
            self.passw.text = @"";
        }
    }];
}

- (void)didTapToRedirect:(id)sender
{
    
    LoginViewController *loginView = [[LoginViewController alloc] init];
    [self presentViewController:loginView animated:YES completion:nil];
    
}
@end

