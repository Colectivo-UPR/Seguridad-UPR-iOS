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
        
        self.title = @"Someter Alerta";
    }
    return self;
}

- (unsigned int)intFromHexString:(NSString *)hexStr {
    unsigned int hexInt = 0;
    
    // Create scanner
    NSScanner *scanner = [NSScanner scannerWithString:hexStr];
    
    // Tell scanner to skip the # character
    [scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"#"]];
    
    // Scan hex value
    [scanner scanHexInt:&hexInt];
    
    return hexInt;
}

- (UIColor *)getUIColorObjectFromHexString:(NSString *)hexStr alpha:(CGFloat)alpha
{
    // Convert hex string to an integer
    unsigned int hexint = [self intFromHexString:hexStr];
    
    // Create color object, specifying alpha as well
    UIColor *color =
    [UIColor colorWithRed:((CGFloat) ((hexint & 0xFF0000) >> 16))/255
                    green:((CGFloat) ((hexint & 0xFF00) >> 8))/255
                     blue:((CGFloat) (hexint & 0xFF))/255
                    alpha:alpha];
    
    return color;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.backgroundColor = [UIColor redColor];
    
    self.cancel = [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleDone target:self action:@selector(didTapConnect:)];
    self.cancel.tintColor = [UIColor redColor];
    self.navigationController.navigationItem.rightBarButtonItem = self.cancel;
    
    UINavigationController *navbar = [[UINavigationController alloc]init];

    UITextField *title = [[UITextField alloc]initWithFrame:CGRectMake(40, 100, 250, 30)];
    title.placeholder = @"Título";
    title.tintColor = [UIColor grayColor];
    
    UITextField *message = [[UITextField alloc]initWithFrame:CGRectMake(40, 180, 250, 30)];
    message.placeholder = @"Suceso";
    message.tintColor = [UIColor grayColor];
    
    UITextField *building = [[UITextField alloc]initWithFrame:CGRectMake(40, 140, 250, 30)];
    building.placeholder = @"Edificio";
    building.tintColor = [UIColor grayColor];
    
    UIButton *post = [[UIButton alloc]initWithFrame:CGRectMake(40, 230, 250, 40)];
    post.tintColor = [UIColor grayColor];
    
    navbar.navigationItem.leftBarButtonItem = self.cancel;
    
    [self.view addSubview:title];
    [self.view addSubview:message];
    [self.view addSubview:building];
    [self.view addSubview:post];
    [self.view addSubview:navbar.view];
}

- (void)didTapConnect:(id)sender {
    
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
