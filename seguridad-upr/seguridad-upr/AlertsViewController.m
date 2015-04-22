//
//  AlertasViewController.m
//  seguridad-upr
//
//  Created by Xiomara on 10/24/14.
//  Copyright (c) 2014 Colectivo-UPR. All rights reserved.
//

#import "AlertsViewController.h"
#import "NewAlertViewController.h"
#import "Constants.h"
#import "CustomCell.h"
#import "HTTPRequestsViewController.h"
#import "AppDelegate.h"

@interface AlertsViewController ()

@end

@implementation AlertsViewController
{
    UITableView *tableView;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
        self.title = @"Alertas";
        self.view.tintColor = [UIColor whiteColor];
        self.view.backgroundColor = [UIColor whiteColor];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 100, 330, 500) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor whiteColor];
    
    self.delegate = [[UIApplication sharedApplication]delegate];
    
    self.incidentsButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 60, self.view.bounds.size.width / 2 -10, 40)];
    self.incidentsButton.backgroundColor = [UIColor whiteColor];
    self.incidentsButton.tintColor = [UIColor redColor];
    
    [self.incidentsButton setTitle:@"Alertas" forState:UIControlStateNormal];
    [self.incidentsButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.incidentsButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected];

    [self.incidentsButton addTarget:self action:@selector(presentIncidents:) forControlEvents:UIControlEventTouchUpInside];
    
    self.reportsButton = [[UIButton alloc]initWithFrame:
                          CGRectMake(self.view.bounds.size.width / 2, 60, self.view.bounds.size.width / 2 -10, 40)];

    self.reportsButton.backgroundColor = [UIColor whiteColor];
    self.reportsButton.tintColor = [UIColor redColor];
    
    [self.reportsButton setTitle:@"Avisos" forState:UIControlStateNormal];
    [self.reportsButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.reportsButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [self.reportsButton addTarget:self action:@selector(presentReports:) forControlEvents:UIControlEventTouchUpInside];
    
    self.status = @"Alertas";
    
    UIImage *img = [UIImage imageNamed:@"post"];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                              initWithImage:img
                                              style:UIBarButtonItemStylePlain
                                              target:self
                                              action:@selector(didTapNewAlert:)];

    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg.png"]
                                                  forBarMetrics:UIBarMetricsDefault];
    
    [self.view addSubview:tableView];
    [self.view addSubview:self.incidentsButton];
    [self.view addSubview:self.reportsButton];
    [self.view addSubview:self.UILine];
    
}

-(void)viewWillAppear {
    [tableView reloadInputViews];
}

#pragma mark - Selector Methods

-(void)didTapNewAlert:(id)sender
{
    NewAlertViewController *newAlert = [[NewAlertViewController alloc] init];
    [self presentViewController:newAlert animated:YES completion:nil];
}

-(void)presentIncidents:(id)sender
{
    self.status = @"Alertas";
    [tableView reloadData];
}

-(void)presentReports:(id)sender
{
    self.status = @"Avisos";
    [tableView reloadData]; 
}

#pragma mark - UITableView Methods

-(NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
{
    if ([self.status isEqualToString:@"Incidentes"]) {
        return self.delegate.incidents.count;
    } else {
        return self.delegate.reports.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *cell = (CustomCell *)[theTableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[CustomCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    if ([self.status isEqualToString:@"Alertas"]) {
        DLog(@"alertas");
        if (self.delegate.incidents.count > 0) {
        
            NSString *dateStr = [self.delegate.incidents valueForKey:@"incident_date"][indexPath.row];
            
            // Convert string to date object
            NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
            [dateFormat setDateFormat:@"yyyyMMdd"];
            NSDate *date = [dateFormat dateFromString:dateStr];
            
            // Convert date object to desired output format
            [dateFormat setDateFormat:@"EEEE MMMM d, YYYY"];
            dateStr = [dateFormat stringFromDate:date];
            
            
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateStyle:NSDateFormatterFullStyle];
            
            cell.nameLabel.text = [self.delegate.incidents valueForKey:@"title"][indexPath.row];
            cell.prepTimeLabel.text = dateStr;
            cell.infoLabel.text = [self.delegate.incidents valueForKey:@"message"][indexPath.row];
            cell.thumbnailImageView.image = [UIImage imageNamed:@"map.png"];
        }
    }
    if ([self.status isEqualToString:@"Avisos"]) {
        DLog(@"avisos");
        if (self.delegate.reports.count > 0) {
            
            cell.nameLabel.text = [self.delegate.reports valueForKey:@"title"][indexPath.row];
            cell.prepTimeLabel.text = [self.delegate.reports valueForKey:@"pub_date"][indexPath.row];
            cell.infoLabel.text = [self.delegate.reports valueForKey:@"message"][indexPath.row];
            cell.thumbnailImageView.image = [UIImage imageNamed:@"map.png"];
        }
    }
    
    return cell;
}

- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

- (CGFloat)tableView:(UITableView *)theTableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 105.0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
