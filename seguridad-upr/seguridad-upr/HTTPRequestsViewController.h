//
//  HTTPRequestsViewController.h
//  seguridad-upr
//
//  Created by Xiomara on 11/20/14.
//  Copyright (c) 2014 Colectivo-UPR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HTTPRequestsViewController : UIViewController

- (void)getNews:(NSDictionary *)params completion:(void (^)(NSString *status, NSDictionary *news))block; 
- (void)getReports;
- (void)getPhones;
- (void)postNews:(NSDictionary *)params completion:(void (^)(NSString *status, NSDictionary *news))block; 
- (void)auth:(NSDictionary *)parameters completion:(void (^)(NSString *status, NSString *token))block;
- (void)registration:(NSDictionary *)parameters login:(NSDictionary *)params
         completion:(void (^)(NSString *status, NSString *token))block;

+ (instancetype)sharedManager;

@end
