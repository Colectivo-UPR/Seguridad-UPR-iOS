//
//  RegisterViewController.m
//  seguridad-upr
//
//  Created by Xiomara on 12/4/14.
//  Copyright (c) 2014 Colectivo-UPR. All rights reserved.
//

#import "RegisterViewController.h"
#import "HTTPRequestsViewController.h"
@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
        self.title = @"Registro";
        
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.jpg"]];
    self.logo  = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"miupi-login.png"]];
    
    self.logo.frame = CGRectMake(50, 100, self.view.bounds.size.width - 100, 70);
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
    [login addTarget:self action:@selector(didTapLogin:) forControlEvents:UIControlEventAllTouchEvents];
    
    [self.view addSubview:self.email];
    [self.view addSubview:self.passw];
    [self.view addSubview:self.name];
    [self.view addSubview:self.lstn];
    [self.view addSubview:self.logo] ;
    [self.view addSubview:login];
}


-(void)registrationTapped:(id)sender {
    
}

-(void)didTapLogin:(id)sender {
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
