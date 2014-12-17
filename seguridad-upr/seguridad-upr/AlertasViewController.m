//
//  AlertasViewController.m
//  seguridad-upr
//
//  Created by Xiomara on 10/24/14.
//  Copyright (c) 2014 Colectivo-UPR. All rights reserved.
//

#import "AlertasViewController.h"
#import "NuevaAlertaViewController.h"
#import "CustomCell.h"
#import "HTTPRequestsViewController.h"
#import "AppDelegate.h"

@interface AlertasViewController ()

@end

@implementation AlertasViewController {
    UITableView *tableView;
}

- (IBAction)alertButton:(id)sender {
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
        self.title = @"Alertas";
        self.view.tintColor = [UIColor whiteColor];

        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 100, 330, 500) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    tableView.backgroundColor = [UIColor whiteColor];

    UIImage *img = [UIImage imageNamed:@"post.png"];
    
    self.alertButton = [[UIBarButtonItem alloc]initWithImage:img style:UIBarButtonItemStyleDone target:self action:@selector(didTapConnect:)];
    self.alertButton.tintColor = [UIColor whiteColor];

    self.navigationItem.rightBarButtonItem = self.alertButton;
    
    self.delegate = [[UIApplication sharedApplication]delegate];
    
    self.incidentsButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 60, self.view.bounds.size.width / 2, 40)];
    [self.incidentsButton setTitle:@"Incidentes" forState:UIControlStateNormal];
    [self.incidentsButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.incidentsButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    self.incidentsButton.backgroundColor = [UIColor whiteColor];
    self.incidentsButton.tintColor = [UIColor redColor];
    self.incidentsButton.font = [UIFont systemFontOfSize:14.0];
    [self.incidentsButton addTarget:self action:@selector(presentIncidents:) forControlEvents:UIControlEventAllTouchEvents]; 
    
    self.reportsButton = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width / 2, 60, self.view.bounds.size.width / 2, 40)];
    [self.reportsButton setTitle:@"Reportes" forState:UIControlStateNormal];
    self.reportsButton.backgroundColor = [UIColor whiteColor];
    self.reportsButton.tintColor = [UIColor redColor];
    [self.reportsButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.reportsButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    self.reportsButton.font = [UIFont systemFontOfSize:14.0];
    [self.reportsButton addTarget:self action:@selector(presentReports:) forControlEvents:UIControlEventAllTouchEvents];
    
    [self.view addSubview:tableView];
    [self.view addSubview:self.incidentsButton];
    [self.view addSubview:self.reportsButton];
    
    
}

-(void)viewWillAppear {
    [self reloadInputViews];
}

- (void)didTapConnect:(id)sender {

    UIViewController *newAlert = [[NuevaAlertaViewController alloc]initWithNibName:@"NuevaAlertaViewController" bundle:nil];
    self.delegate.window.rootViewController = newAlert;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)presentIncidents:(id)sender {
    NSLog(@"Incidentes");
}

-(void)presentReports:(id)sender {
    NSLog(@"Reportes");
}


-(NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section {

    return self.delegate.incidents.count;
}

- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomCell *cell = (CustomCell *)[theTableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[CustomCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    if (self.delegate.incidents.count > 0) {
        
        cell.nameLabel.text = [self.delegate.incidents valueForKey:@"title"][indexPath.row];
        cell.prepTimeLabel.text = [self.delegate.incidents valueForKey:@"incident_date"][indexPath.row];
        cell.infoLabel.text = [self.delegate.incidents valueForKey:@"message"][indexPath.row];
        cell.thumbnailImageView.image = [UIImage imageNamed:@"map.png"];

    }
    
    return cell;
}

- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (CGFloat)tableView:(UITableView *)theTableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 105.0;
}

@end
