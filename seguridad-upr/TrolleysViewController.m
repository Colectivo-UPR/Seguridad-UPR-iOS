//
//  TrolleysViewController.m
//  seguridad-upr
//
//  Created by Xiomara on 10/24/14.
//  Copyright (c) 2014 Colectivo-UPR. All rights reserved.
//

#import "TrolleysViewController.h"
#import "CustomCell.h"

@interface TrolleysViewController ()

@end

@implementation TrolleysViewController
{
    UITableView *tableView;
    UIWebView *mapView;
}

- (instancetype)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.title = @"Trolleys";
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 450, 330, 500)
                                            style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    tableView.backgroundColor = [UIColor whiteColor];
    
    mapView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 60, 320, 400)];

    NSString *fullURL = @"http://iupi-app.herokuapp.com/";
    
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    [mapView loadRequest:requestObj];
    
    UIImage *img = [UIImage imageNamed:@"post.png"];
    
    self.alertButton = [[UIBarButtonItem alloc]initWithImage:img
                                                       style:UIBarButtonItemStyleDone
                                                      target:self
                                                      action:@selector(didTapConnect:)];

    self.alertButton.tintColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = self.alertButton;
    
    [self.view addSubview:tableView];
    [self.view addSubview:mapView]; 
}

- (void)didTapConnect:(id)sender
{

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


-(NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CustomCell *cell = (CustomCell *)[theTableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[CustomCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    cell.nameLabel.text = @"Ruta 1";
    cell.prepTimeLabel.text = @"7:00 am - 9:00 am";
    cell.thumbnailImageView.image = [UIImage imageNamed:@"map.png"];
    cell.icon.image = [UIImage imageNamed:@"purpleL"];
    
    return cell;
}

- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}

- (CGFloat)tableView:(UITableView *)theTableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 300.0;
}

@end
