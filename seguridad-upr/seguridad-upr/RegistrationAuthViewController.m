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
#import "ViewController.h"
#import "Constants.h"

@interface RegistrationAuthViewController()

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
    
    self.registerButton = [[UIButton alloc]initWithFrame:CGRectMake(20, 400, self.view.bounds.size.width - 40, 40)];
    self.registerButton.backgroundColor = [UIColor redColor];
    
    [self.registerButton setTitle:@"Registrame" forState:UIControlStateNormal];
    [self.registerButton addTarget:self action:@selector(didTapToRegister:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.registerButton];
    
    self.redirectButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 450, self.view.bounds.size.width - 40, 40)];
    self.redirectButton.backgroundColor = [UIColor clearColor];
    self.redirectButton.font = [UIFont systemFontOfSize:12.0];
    
    [self.redirectButton setTintColor:[UIColor blackColor]]; 
    [self.redirectButton setTitle:@"Ya tengo cuenta en MiUPI Watch" forState:UIControlStateNormal];
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
                                 @"password":self.passw.text,
                                 };
    
    NSDictionary *params = @{@"username": self.email.text,
                             @"password" :self.passw.text,
                             };
    
    // CREATE A SHARED MANAGER OF HTTPS
    HTTPRequestsViewController *requests = [[HTTPRequestsViewController alloc]init];
    [requests registration:parameters login:params completion:^(NSString *status, NSString *token) {
        if ([status isEqual: @"valid"]) {

            double delayInSeconds = 0.7;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                
                [requests auth:params completion:^(NSString *status, NSString *token) {
                    if ([status isEqual: @"active"]) {
                        
                        ViewController *views = [[ViewController alloc] init];
                        [self presentViewController:views animated:YES completion:nil];
                        
                    } else {
                        DLog(@"Your account is not active, please check your email");
                    }
                }];
            });
        } else {
            DLog(@"Invalid Registration, please try again");
        }
    }];

}

- (void)didTapToRedirect:(id)sender
{
    
    LoginViewController *loginView = [[LoginViewController alloc] init];
    [self presentViewController:loginView animated:YES completion:nil];
    
}
@end

