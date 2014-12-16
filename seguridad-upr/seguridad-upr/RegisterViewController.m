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
        self.view.tintColor = [UIColor whiteColor];
        
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.name   = [[UITextField alloc]initWithFrame:CGRectMake(0,  40, 100, 20)];
    self.lstn   = [[UITextField alloc]initWithFrame:CGRectMake(0,  80, 100, 20)];
    self.email  = [[UITextField alloc]initWithFrame:CGRectMake(0, 120, 100, 20)];
    self.passwd = [[UITextField alloc]initWithFrame:CGRectMake(0, 160, 100, 20)];

    self.registration = [[UIButton alloc]initWithFrame:CGRectMake(0, 210, 100, 30)];
    [self.registration setTitle:@"Registrame" forState:UIControlStateNormal];
    [self.registration addTarget:self action:@selector(registrationTapped:) forControlEvents:UIControlEventTouchUpOutside];
    self.registration.backgroundColor = [UIColor grayColor];

    self.name.placeholder = @"Name";
    self.name.backgroundColor = [UIColor whiteColor];
    
    self.email.backgroundColor = [UIColor whiteColor];
    self.email.placeholder = @"Email";
    
    self.passwd.backgroundColor = [UIColor whiteColor];
    self.passwd.placeholder = @"Password";
    
    self.lstn.backgroundColor = [UIColor whiteColor];
    self.lstn.placeholder = @"Last Name";
    
    
    self.view.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.name];
    [self.view addSubview:self.lstn];
    [self.view addSubview:self.email];
    [self.view addSubview:self.passwd];
    [self.view addSubview:self.registration];
    
    HTTPRequestsViewController *requests = [[HTTPRequestsViewController alloc]init];
    NSLog(@"HELLO");
    
//    NSString *name  = @"Alex";
//    NSString *email = @"asantos@gmail.com";
//    NSString *passw = @"123456";
//    NSString *lstn  = @"Santos";
//    
//    [requests registration:name lastname:lstn password:passw email:email user:@"AlexXx" phone:@"7870980987"];
}


-(void)registrationTapped:(id)sender {
//    HTTPRequestsViewController *requests = [[HTTPRequestsViewController alloc]init];
//    NSLog(@"HELLO");
//    
//    NSString *name  = self.name.text;
//    NSString *email = self.email.text;
//    NSString *passw = self.passwd.text;
//    NSString *lstn  = self.lstn.text;
    
//    [requests registration:name lastname:lstn password:passw email:email];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
