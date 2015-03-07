//
//  HTTPRequestsViewController.h
//  seguridad-upr
//
//  Created by Xiomara on 11/20/14.
//  Copyright (c) 2014 Colectivo-UPR. All rights reserved.
//

#import <AFHTTPClient.h>

@interface UPRHTTPRequestsViewController : NSObject

-(void)postNews:(NSString *)msg title:(NSString *)title date:(NSString *)date building:(NSString *)building; 
-(void)getNews;
-(void)getReports;
-(void)getPhones; 
-(void)registration:(NSString *)name lastname:(NSString *)lstname password:(NSString *)passwd email:(NSString *)email user:(NSString *)user phone:(NSString *)phone;
-(void) auth:(NSString *)passwd user:(NSString *)user;

@end
