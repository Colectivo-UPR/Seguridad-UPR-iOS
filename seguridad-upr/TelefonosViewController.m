//
//  TelefonosViewController.m
//  seguridad-upr
//
//  Created by Xiomara on 10/24/14.
//  Copyright (c) 2014 Colectivo-UPR. All rights reserved.
//

#import "TelefonosViewController.h"

@interface TelefonosViewController ()

@end

@implementation TelefonosViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
        self.title = @"Teléfonos";

        self.connect = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(didTapConnect:)];
        self.connect.tintColor = [UIColor whiteColor];
        [self.connect setImage:[UIImage imageNamed:@"post.png"]];
        self.navigationItem.rightBarButtonItem = self.connect;
        
        self.view.tintColor = [UIColor whiteColor];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didTapConnect:(id)sender{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
