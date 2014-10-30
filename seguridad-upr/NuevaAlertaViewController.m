//
//  NuevaAlertaViewController.m
//  seguridad-upr
//
//  Created by Xiomara on 10/28/14.
//  Copyright (c) 2014 Colectivo-UPR. All rights reserved.
//

#import "NuevaAlertaViewController.h"

@interface NuevaAlertaViewController ()

@end

@implementation NuevaAlertaViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
        self.cancel = [[UIBarButtonItem alloc] initWithTitle:@"cancel" style:UIBarButtonItemStyleDone target:self action:@selector(didTapConnect:)];
        self.cancel.tintColor = [UIColor whiteColor];
        self.navigationController.navigationItem.rightBarButtonItem = self.cancel;
        self.title = @"Alertas";
        
        self.view.tintColor = [UIColor whiteColor];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didTapConnect:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
