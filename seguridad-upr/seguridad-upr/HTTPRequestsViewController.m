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
    
    NSString *token;
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];

    [request setURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:method];
    [request setHTTPBody:data];
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    if (token) {
        [request addValue:[NSString stringWithFormat:@"Token %@",token] forHTTPHeaderField:@"Authorization"];
    } else {
    }
    return request;
    
}

- (BOOL)isValid:(NSURLResponse *)response
{
    NSHTTPURLResponse *responseCode = (NSHTTPURLResponse *) response;
    
    DLog(@"status code: %ld", (long)[responseCode statusCode]);
    
    if([responseCode statusCode] == 201 || [responseCode statusCode] == 200){
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
    NSMutableURLRequest *request = [self RequestInit:@"http://136.145.181.112:8080/rest-auth/registration/"
                                                data:data
                                              method:@"POST"];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue: [NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
    
        if([self isValid:response]){
            block(@"alert", nil);
        } else {
            block(@"invalid", nil);
            DLog("Response: %@", response);
        }
    }];
}

- (void)auth:(NSDictionary *)parameters completion:(void (^)(NSString *status, NSString *token))block
{
 
    NSData *data = [NSJSONSerialization dataWithJSONObject:parameters options:NSJSONWritingPrettyPrinted error:nil];
    DLog(@"data %@", data);
    NSMutableURLRequest *request = [self RequestInit:@"http://136.145.181.112:8080/rest-auth/login/"
                                                data:data
                                              method:@"POST"];
    
    DLog(@"data %@", (data));
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        DLog(@"response: %@", response);
        if (data != nil) {
            NSDictionary *result = [self serializeData:data];
            
            if([self isValid:response]){
                [[NSUserDefaults standardUserDefaults]setValue:[result valueForKey:@"token"] forKey:@"token"];
                
                DLog(@"is valid");

                block(@"active", [[NSUserDefaults standardUserDefaults]valueForKey:@"token"]); 
                
            } else {
                DLog(@"not valid");
                
                if ([result valueForKey:@"non_field_errors"]) {
                    block(@"inactive", nil);
                }
            }
        } else {
            DLog(@"vine al else");
            
            block(@"inactive", @"nil");
        }
    }];
}

- (void)postNews:(NSDictionary *)params completion:(void (^)(NSString *status, NSDictionary *news))block
{
    NSData *data = [NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:nil];
    NSMutableURLRequest *request = [self RequestInit:@"http://136.145.181.112:8080/create-incident/"
                                                data:data method:@"POST"];
    
    [NSURLConnection sendAsynchronousRequest:request queue: NSOperationQueuePriorityNormal
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               
       if([self isValid:response]){
           NSDictionary *news = [self serializeData:data];
           block(@"completed", news);
       } else {
           block(@"error", nil);
       }
   }];
}

- (void)getNews:(NSDictionary *)params completion:(void (^)(NSString *status, NSDictionary *news))block
{
    
    NSMutableURLRequest *request = [self RequestInit:@"http://136.145.181.112:8080/incidents/" data:nil method:@"GET"];
    [NSURLConnection sendAsynchronousRequest:request queue:NSOperationQueuePriorityNormal
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
       if ([self isValid:response]) {
           NSDictionary *news = [self serializeData:data];
           block(@"completed", news);
       } else {
           block(@"error", nil);
       }
    }];

}


- (void)getReports
{
    //NSMutableURLRequest *request = [self RequestInit:@"http://136.145.181.112:8080/reports" data:nil method:@"GET"];

}

- (void)getPhones
{
    //NSMutableURLRequest *request = [self RequestInit:@"http://136.145.181.112:8080/phones" data:nil method:@"GET"];

    //    AppDelegate *delegate = [[UIApplication sharedApplication]delegate];
    //    delegate.phones = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableLeaves error:nil];
    //    delegate.phones = [delegate.phones valueForKey:@"results"];
}

+ (instancetype)sharedManager
{
    static id sharedInstance = nil;
    sharedInstance = [[[self class] alloc] init];
    
    return sharedInstance;
}

@end
