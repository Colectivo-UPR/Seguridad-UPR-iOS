//
//  DesalojoViewController.m
//  seguridad-upr
//
//  Created by Xiomara on 10/24/14.
//  Copyright (c) 2014 Colectivo-UPR. All rights reserved.
//

#import "DesalojoViewController.h"
#import "CustomCell.h"

@interface DesalojoViewController ()

@end

@implementation DesalojoViewController {
    UITableView *tableView;
    UIWebView *mapView;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
        self.title = @"Desalojo";
        
        self.view.tintColor = [UIColor whiteColor];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 220, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    tableView.backgroundColor = [UIColor whiteColor];
    
    mapView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 60, 320, 400)];
    NSString *fullURL = @"http://iupi-map.herokuapp.com/";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    [mapView sizeThatFits:CGSizeMake(320, 160)];
    [mapView loadRequest:requestObj];

    UIImage *img = [UIImage imageNamed:@"post.png"];
    self.alertButton = [[UIBarButtonItem alloc]initWithImage:img style:UIBarButtonItemStyleDone target:self action:@selector(didTapConnect:)];
    self.alertButton.tintColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = self.alertButton;
    
    [self.view addSubview:tableView];
    [self.view addSubview:mapView]; 
    
    
}

- (void)didTapConnect:(id)sender {
//    UIViewController *newAlert = [[UITableViewController alloc]init];
//    
//    [self presentViewController:newAlert animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomCell *cell = (CustomCell *)[theTableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[CustomCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    cell.nameLabel.text = @"Facundo Bueso";
    cell.prepTimeLabel.text = @"Ruta Principal";
    cell.thumbnailImageView.image = [UIImage imageNamed:@"map.png"];
    cell.icon.image = [UIImage imageNamed:@"Route-Icon"];
    
    return cell;
}

- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
}

- (CGFloat)tableView:(UITableView *)theTableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 300.0;
}


@end
