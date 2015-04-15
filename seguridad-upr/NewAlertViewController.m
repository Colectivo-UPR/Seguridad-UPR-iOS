//
//  NuevaAlertaViewController.m
//  seguridad-upr
//
//  Created by Xiomara on 10/28/14.
//  Copyright (c) 2014 Colectivo-UPR. All rights reserved.
//

#import "NewAlertViewController.h"
#import "HTTPRequestsViewController.h"

@interface NewAlertViewController ()

@property (strong, nonatomic) UITextField *titleAlert;
@property (strong, nonatomic) UITextField *message;
@property (strong, nonatomic) UITextField *building;

@property (strong, nonatomic) UIButton *postButton;

@end

@implementation NewAlertViewController

- (instancetype)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
    
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.jpg"]];
    
    UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:self];
    [navController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg.png"] forBarMetrics:UIBarMetricsDefault];
    

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(didTapCancel:)];
    
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor redColor];
    
    self.titleAlert = [[UITextField alloc]initWithFrame:CGRectMake(40, 100, 250, 30)];
    self.titleAlert.backgroundColor = [UIColor whiteColor];
    self.titleAlert.font = [UIFont systemFontOfSize:14.0];
    self.titleAlert.textAlignment = NSTextAlignmentCenter;
    self.titleAlert.placeholder = @"Título";
    
    self.message = [[UITextField alloc]initWithFrame:CGRectMake(40, 180, 250, 30)];
    self.message.backgroundColor = [UIColor whiteColor];
    self.message.font = [UIFont systemFontOfSize:14.0];
    self.message.textAlignment = NSTextAlignmentCenter;
    self.message.placeholder = @"Suceso";
    
    self.building = [[UITextField alloc]initWithFrame:CGRectMake(40, 140, 250, 30)];
    self.building.backgroundColor = [UIColor whiteColor];
    self.building.font = [UIFont systemFontOfSize:14.0];
    self.building.textAlignment = NSTextAlignmentCenter;
    self.building.placeholder = @"Edificio";

    self.postButton = [[UIButton alloc]initWithFrame:CGRectMake(20, 250, self.view.bounds.size.width - 40, 40)];
    self.postButton.backgroundColor = [UIColor redColor];
    self.postButton.tintColor = [UIColor redColor];
    
    [self.postButton setTitle:@"Someter Incidente" forState:UIControlStateNormal];
    [self.postButton addTarget:self action:@selector(didTapConnect:) forControlEvents:UIControlEventTouchUpInside];
    
    //navbar.navigationItem.leftBarButtonItem = self.cancel;
    
    [self.view addSubview:self.titleAlert];
    [self.view addSubview:self.message];
    [self.view addSubview:self.building];
    [self.view addSubview:self.postButton];
    
    //[self.view addSubview:navbar.view];
    
    [self.view addSubview:navController.view];
}

#pragma mark - Selector Methods

- (void)didTapCancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didTapConnect:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    //NSDictionary *params = @{@"title":self.title.text,
    //                         @"message":self.message.text,
    //                         @"faculty":self.building.text,
    //                         @"lat":@"0.0",
    //                         @"lon":@"0.0"};
    
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
