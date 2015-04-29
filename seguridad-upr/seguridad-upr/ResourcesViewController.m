//
//  RecursosViewController.m
//  seguridad-upr
//
//  Created by Abimael Carrasquillo Ayala on 10/27/14.
//  Copyright (c) 2014 Colectivo-UPR. All rights reserved.
//

#import "CustomCell.h"
#import "ResourcesViewController.h"

@interface ResourcesViewController ()

@end

@implementation ResourcesViewController {
    UITableView *tableView;
    
}

- (instancetype)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.title = @"Recursos";
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 60, 330, 500) style:UITableViewStylePlain];
    tableView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor whiteColor];
    
    UIImage *img = [UIImage imageNamed:@"post.png"];
    self.alertButton = [[UIBarButtonItem alloc]initWithImage:img
                                                       style:UIBarButtonItemStyleDone
                                                      target:self
                                                      action:@selector(didTapConnect:)];
    self.alertButton.tintColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = self.alertButton;
    
    
    [self.view addSubview:tableView];
    
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
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
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

- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}

- (CGFloat)tableView:(UITableView *)theTableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.0;
}

@end
