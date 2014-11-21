//
//  NuevaAlertaViewController.m
//  seguridad-upr
//
//  Created by Xiomara on 10/28/14.
//  Copyright (c) 2014 Colectivo-UPR. All rights reserved.
//

#import "NuevaAlertaViewController.h"
#import "HTTPRequestsViewController.h"

@interface NuevaAlertaViewController ()

@end

@implementation NuevaAlertaViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
        
        UINavigationController *navigation = [[UINavigationController alloc]init];
        self.title = @"Alertas";
        
        self.cancel = [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleDone target:self action:@selector(didTapConnect:)];

        self.cancel.tintColor = [UIColor whiteColor];
        navigation.navigationItem.leftBarButtonItem = self.cancel;
        navigation.navigationBar.backgroundColor = [UIColor redColor]; 
        
        [self.view addSubview:navigation.view];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UITextField *title = [[UITextField alloc]initWithFrame:CGRectMake(40, 100, 250, 30)];
//    title.placeholder = @"Título";
//    title.tintColor = [UIColor grayColor];
//    
//    UITextField *message = [[UITextField alloc]initWithFrame:CGRectMake(40, 180, 250, 30)];
//    message.placeholder = @"Suceso";
//    message.tintColor = [UIColor grayColor];
//    
//    UITextField *building = [[UITextField alloc]initWithFrame:CGRectMake(40, 140, 250, 30)];
//    building.placeholder = @"Edificio";
//    building.tintColor = [UIColor grayColor];
//    
//    UIButton *post = [[UIButton alloc]initWithFrame:CGRectMake(40, 230, 250, 40)];
//    post.tintColor = [UIColor grayColor];
//    
//    [self.view addSubview:title];
//    [self.view addSubview:message];
//    [self.view addSubview:building];
//    [self.view addSubview:post];
}

- (void)didTapConnect:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:true];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
