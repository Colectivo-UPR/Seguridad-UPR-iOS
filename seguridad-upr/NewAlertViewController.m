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

@property (strong, nonatomic) UITextField *title;
@property (strong, nonatomic) UITextField *message;
@property (strong, nonatomic) UITextField *building;

@property (strong, nonatomic) UIButton *post;

@end

@implementation NewAlertViewController

- (instancetype)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.title = @"Someter Alerta";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.backgroundColor = [UIColor redColor];
    
    self.cancel = [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleDone target:self action:@selector(didTapConnect:)];
    self.cancel.tintColor = [UIColor redColor];
    self.navigationController.navigationItem.rightBarButtonItem = self.cancel;
    
    UINavigationController *navbar = [[UINavigationController alloc]init];

    self.title = [[UITextField alloc]initWithFrame:CGRectMake(40, 100, 250, 30)];
    self.title.placeholder = @"Título";
    self.title.tintColor = [UIColor grayColor];
    
    self.message = [[UITextField alloc]initWithFrame:CGRectMake(40, 180, 250, 30)];
    self.message.placeholder = @"Suceso";
    self.message.tintColor = [UIColor grayColor];
    
    self.building = [[UITextField alloc]initWithFrame:CGRectMake(40, 140, 250, 30)];
    self.building.placeholder = @"Edificio";
    self.building.tintColor = [UIColor grayColor];
    
    self.post = [[UIButton alloc]initWithFrame:CGRectMake(40, 230, 250, 40)];
    self.post.tintColor = [UIColor grayColor];
    
    navbar.navigationItem.leftBarButtonItem = self.cancel;
    
    [self.view addSubview:self.title];
    [self.view addSubview:self.message];
    [self.view addSubview:self.building];
    [self.view addSubview:self.post];
    [self.view addSubview:navbar.view];
}

- (void)didTapConnect:(id)sender {
    
    NSDictionary *params = @{@"title":self.title.text,
                             @"message":self.message.text,
                             @"faculty":self.building.text,
                             @"lat":@"0.0",
                             @"lon":@"0.0"};
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
