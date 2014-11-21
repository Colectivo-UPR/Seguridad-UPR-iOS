//
//  RecursosViewController.m
//  seguridad-upr
//
//  Created by Abimael Carrasquillo Ayala on 10/27/14.
//  Copyright (c) 2014 Colectivo-UPR. All rights reserved.
//

#import "CustomCell.h"
#import "RecursosViewController.h"

@interface RecursosViewController ()

@end

@implementation RecursosViewController {
    UITableView *tableView;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
        self.title = @"Recursos";
        
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
//    UIViewController *newAlert = [[UITableViewController alloc]init];
//    
//    [self presentViewController:newAlert animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomCell *cell = (CustomCell *)[theTableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[CustomCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    cell.nameLabel.text = @"Oficina de Seguridad";
    cell.prepTimeLabel.text = @"787 xxx xxxx";
    cell.thumbnailImageView.image = [UIImage imageNamed:@"map.png"];
    cell.icon.image = [UIImage imageNamed:@"Phone-Icon"];
    
    return cell;
}

- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
}

- (CGFloat)tableView:(UITableView *)theTableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80.0;
}

@end
