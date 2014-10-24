//
//  AlertasViewController.m
//  seguridad-upr
//
//  Created by Xiomara on 10/24/14.
//  Copyright (c) 2014 Colectivo-UPR. All rights reserved.
//

#import "AlertasViewController.h"
#import "HomeViewController.h"

@interface AlertasViewController ()

@end

@implementation AlertasViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
        self.title = @"Alertas";
        self.connect = [[UIBarButtonItem alloc] initWithTitle:@"Alerta!" style:UIBarButtonItemStylePlain target:self action:@selector(didTapConnect:)];
        self.connect.tintColor = [UIColor whiteColor];
        self.navigationItem.rightBarButtonItem = self.connect;
        self.navigationItem.title = @"Alertas";
        self.tabBarItem.title = @"Alertas";
        
    }
    return self;
}

- (void)loadView{
    [super loadView];
    self.connect = [[UIBarButtonItem alloc] initWithTitle:@"Alerta!" style:UIBarButtonItemStylePlain target:self action:@selector(didTapConnect:)];
    self.connect.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = self.connect;
    self.navigationItem.title = @"Alertas";
    self.tabBarItem.title = @"Alertas";
    self.title = @"Alertas";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.connect = [[UIBarButtonItem alloc] initWithTitle:@"Alerta!" style:UIBarButtonItemStylePlain target:self action:@selector(didTapConnect:)];
    self.connect.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = self.connect;
    self.navigationItem.title = @"Alertas";
    self.tabBarItem.title = @"Alertas";
    self.title = @"Alertas";
}

- (void)didTapConnect:(id)sender {
    UIViewController *newAlert = [[HomeViewController alloc]init];
    
    [self presentViewController:newAlert animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
