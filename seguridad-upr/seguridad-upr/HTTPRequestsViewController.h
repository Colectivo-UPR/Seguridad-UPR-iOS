//
//  HTTPRequestsViewController.h
//  seguridad-upr
//
//  Created by Xiomara on 11/20/14.
//  Copyright (c) 2014 Colectivo-UPR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HTTPRequestsViewController : UIViewController

-(void)postNews:(NSString *)msg title:(NSString *)title date:(NSString *)date building:(NSString *)building; 
-(void)getNews;
-(void)getReports;
-(void)getPhones; 
-(void)registration:(NSDictionary *)parameters login:(NSDictionary *)params;
-(void) auth:(NSDictionary *)parameters; 

@end
