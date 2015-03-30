//
//  HTTPRequestsViewController.m
//  seguridad-upr
//
//  Created by Xiomara on 11/20/14.
//  Copyright (c) 2014 Colectivo-UPR. All rights reserved.
//

#import "AppDelegate.h"
#import "Constants.h"
#import "HTTPRequestsViewController.h"
#import "ViewController.h"
#import "AlertsViewController.h"
#import "LoginViewController.h"

@interface HTTPRequestsViewController ()

@property NSString *token;
@property NSString *baseURL;

@end

@implementation HTTPRequestsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSMutableURLRequest *)RequestInit:(NSString *)url data:(NSData *)data method:(NSString *)method
{
    NSString *token = [[NSString alloc]initWithString:[[NSUserDefaults standardUserDefaults]stringForKey:@"token"]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    
    [request setURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:method];
    [request setHTTPBody:data];
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    if (token) {
        [request addValue:[NSString stringWithFormat:@"Token %@",token] forHTTPHeaderField:@"Authorization"];
    }
    return request;
    
}

- (BOOL)isValid:(NSURLResponse *)response
{
    NSHTTPURLResponse *responseCode = (NSHTTPURLResponse *) response;
    
    if([responseCode statusCode] == 201 || [responseCode statusCode] == 201){
        return true;
    } else {
        return false;
    }
}

- (NSDictionary *)serializeData:(NSData *)data
{
    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data
                                                           options:NSJSONReadingMutableLeaves error:nil];
    DLog(@"Response %@", result);
    return result;

}

- (void)registration:(NSDictionary *)parameters login:(NSDictionary *)params
         completion:(void (^)(NSString *status, NSString *token))block
{

    NSData *data = [NSJSONSerialization dataWithJSONObject:parameters options:NSJSONWritingPrettyPrinted error:nil];
    NSMutableURLRequest *request = [self RequestInit:@"http://136.145.181.112:8080/register"
                                                data:data
                                              method:@"POST"];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue: [NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
    
        if([self isValid:response]){
            block(@"valid", nil);
        } else {
            block(@"invalid", nil);
            DLog("Response: %@", response);
        }
    }];
}

- (void)auth:(NSDictionary *)parameters completion:(void (^)(NSString *status, NSString *token))block
{
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:parameters options:NSJSONWritingPrettyPrinted error:nil];
    NSMutableURLRequest *request = [self RequestInit:@"http://136.145.181.112:8080/api-token-auth/"
                                                data:data
                                              method:@"POST"];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (data != nil) {
            NSDictionary *result = [self serializeData:data];
            if([self isValid:response]){
                [[NSUserDefaults standardUserDefaults]setValue:[result valueForKey:@"token"] forKey:@"token"];
                block([result valueForKey:@"token"], @"active");
            } else {
                if ([result valueForKey:@"non_field_errors"]) {
                    block(nil, @"inactive");
                }
            }
        } else {
            block(nil, @"nil");
        }
    }];
}

- (void)postNews:(NSDictionary *)params
{
    NSData *data = [NSJSONSerialization dataWithJSONObject:params options:0 error:nil];
    NSMutableURLRequest *request = [self RequestInit:@"%@/create-incident/" data:data method:@"POST"];
    
    [NSURLConnection sendAsynchronousRequest:request queue: NSOperationQueuePriorityNormal
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               
                               if([self isValid:response]){
                                   double delayInSeconds = 0.7;
                                   dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
                                   dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                                   });
                               } else {
                                   DLog(@"ELSE");
                               }
                           }];
}

- (void)getNews
{
    //NSMutableURLRequest *request = [self RequestInit:@"/incidents/" data:nil method:@"GET"];

}


- (void)getReports
{
    //NSMutableURLRequest *request = [self RequestInit:@"" data:nil method:@"GET"];

}

- (void)getPhones
{
    //NSMutableURLRequest *request = [self RequestInit:@"" data:nil method:@"GET"];

    //    AppDelegate *delegate = [[UIApplication sharedApplication]delegate];
    //    delegate.phones = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableLeaves error:nil];
    //    delegate.phones = [delegate.phones valueForKey:@"results"];
}
@end
