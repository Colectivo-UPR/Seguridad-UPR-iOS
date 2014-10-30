//
//  RecursosViewController.m
//  seguridad-upr
//
//  Created by Abimael Carrasquillo Ayala on 10/27/14.
//  Copyright (c) 2014 Colectivo-UPR. All rights reserved.
//

#import "RecursosViewController.h"

@interface RecursosViewController ()

@end

@implementation RecursosViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
        self.title = @"Recursos";
        
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didTapConnect:(id)server{
    
}

@end
