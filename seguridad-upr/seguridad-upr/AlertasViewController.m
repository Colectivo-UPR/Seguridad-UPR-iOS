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
    
    tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 60, 330, 500) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    tableView.backgroundColor = [UIColor whiteColor];

    UIImage *img = [UIImage imageNamed:@"post.png"];
    
    self.alertButton = [[UIBarButtonItem alloc]initWithImage:img style:UIBarButtonItemStyleDone target:self action:@selector(didTapConnect:)];
    self.alertButton.tintColor = [UIColor whiteColor];

    self.navigationItem.rightBarButtonItem = self.alertButton;
    [self.view addSubview:tableView];
    
}

- (void)didTapConnect:(id)sender {
//    UIViewController *newAlert = [[NuevaAlertaViewController alloc]initWithNibName:@"NuevaAlertaViewController" bundle:nil];
//    [self presentViewController:newAlert animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section {

    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    CustomCell *cell = (CustomCell *)[theTableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[CustomCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    cell.nameLabel.text = @"Roban a Corrada";
    cell.prepTimeLabel.text = @"Oct 9 a las 12:00 am";
    cell.infoLabel.text = @"A el profesor Carlos Corrada lo asaltaron a las 12:00 am mientras caminaba por el Centro de Estudiantes";
    cell.thumbnailImageView.image = [UIImage imageNamed:@"map.png"];
    
    return cell;
}

- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
}

- (CGFloat)tableView:(UITableView *)theTableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 105.0;
}

@end
