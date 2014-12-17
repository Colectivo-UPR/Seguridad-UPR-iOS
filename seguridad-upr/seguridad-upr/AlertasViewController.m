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
    
    self.incidentsButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 60, self.view.bounds.size.width / 2 -10, 40)];
    [self.incidentsButton setTitle:@"Incidentes" forState:UIControlStateNormal];
    [self.incidentsButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.incidentsButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    self.incidentsButton.backgroundColor = [UIColor whiteColor];
    self.incidentsButton.tintColor = [UIColor redColor];
    self.incidentsButton.font = [UIFont systemFontOfSize:14.0];
    [self.incidentsButton addTarget:self action:@selector(presentIncidents:) forControlEvents:UIControlEventAllTouchEvents];
    
    self.reportsButton = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width / 2, 60, self.view.bounds.size.width / 2 -10, 40)];
    [self.reportsButton setTitle:@"Reportes" forState:UIControlStateNormal];
    self.reportsButton.backgroundColor = [UIColor whiteColor];
    self.reportsButton.tintColor = [UIColor redColor];
    [self.reportsButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.reportsButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    self.reportsButton.font = [UIFont systemFontOfSize:14.0];
    [self.reportsButton addTarget:self action:@selector(presentReports:) forControlEvents:UIControlEventAllTouchEvents];
    
    self.UILine = [[UILabel alloc]initWithFrame:CGRectMake(self.view.bounds.size.width / 2, 60, 10, 40)];
    self.UILine.text = @"|";
    self.UILine.tintColor = [UIColor grayColor];
    
    self.status = [[NSString alloc]initWithString:@"Incidentes"];
    
    [self.view addSubview:tableView];
    [self.view addSubview:self.incidentsButton];
    [self.view addSubview:self.reportsButton];
    [self.view addSubview:self.UILine];
    
}

-(void)viewWillAppear {
    [tableView reloadInputViews];
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
    self.status = @"Incidentes";
    [tableView reloadData];
}

-(void)presentReports:(id)sender {
    NSLog(@"Reportes");
    self.status = @"Reportes";
    [tableView reloadData]; 
}


-(NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section {
    if ([self.status isEqualToString:@"Incidentes"]) {
        return self.delegate.incidents.count;
    }
    else {
        return self.delegate.reports.count; 
    }
}

- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomCell *cell = (CustomCell *)[theTableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[CustomCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    if ([self.status isEqualToString:@"Incidentes"]) {
        if (self.delegate.incidents.count > 0) {
        
            cell.nameLabel.text = [self.delegate.incidents valueForKey:@"title"][indexPath.row];
            cell.prepTimeLabel.text = [self.delegate.incidents valueForKey:@"incident_date"][indexPath.row];
            cell.infoLabel.text = [self.delegate.incidents valueForKey:@"message"][indexPath.row];
            cell.thumbnailImageView.image = [UIImage imageNamed:@"map.png"];
        }
    }
    if ([self.status isEqualToString:@"Reportes"]) {
        if (self.delegate.reports.count > 0) {
            
            cell.nameLabel.text = [self.delegate.reports valueForKey:@"title"][indexPath.row];
            cell.prepTimeLabel.text = [self.delegate.reports valueForKey:@"pub_date"][indexPath.row];
            cell.infoLabel.text = [self.delegate.reports valueForKey:@"message"][indexPath.row];
            cell.thumbnailImageView.image = [UIImage imageNamed:@"map.png"];
        }
    }
    
    return cell;
}

- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"hola");
}

- (CGFloat)tableView:(UITableView *)theTableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 105.0;
}

@end
