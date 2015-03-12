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

-(NSMutableURLRequest *)RequestInit:(NSString *)url data:(NSData *)data method:(NSString *)method
{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    
    [request setURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:method];
    [request setHTTPBody:data];
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    return request;
    
}

-(void)registration:(NSDictionary *)parameters login:(NSDictionary *)params {

    NSData *data = [NSJSONSerialization dataWithJSONObject:parameters options:NSJSONWritingPrettyPrinted error:nil];
    NSMutableURLRequest *request = [self RequestInit:@"http://136.145.181.112:8080/register" data:data method:@"POST"];
    
    NSHTTPURLResponse *responseCode = nil;
    
    [NSURLConnection sendAsynchronousRequest:request queue: NSOperationQueuePriorityNormal
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {

        DLog(@"HTTP register status code %li", (long)[responseCode statusCode]);
        
        if([responseCode statusCode] == 201){
            double delayInSeconds = 0.7;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                [self auth:params];
            });
        }
        else {
            DLog(@"HTTP register status code %li", (long)[responseCode statusCode]);
        }
    }];
}

-(void)postNews:(NSString *)msg title:(NSString *)title date:(NSString *)date building:(NSString *)building {
    
    NSDictionary *params = @{@"title":title, @"message":msg, @"message": msg, @"faculty":building, @"lat":@"0.0", @"lon":@"0.0"};
    NSData *data = [NSJSONSerialization dataWithJSONObject:params options:0 error:nil];
    
    NSMutableURLRequest *request = [self RequestInit:@"%@/create-incident/" data:data method:@"POST"];
    
    NSHTTPURLResponse *responseCode = nil;
    
    [NSURLConnection sendAsynchronousRequest:request queue: NSOperationQueuePriorityNormal
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               
       DLog(@"HTTP register status code %li", (long)[responseCode statusCode]);
       
       if([responseCode statusCode] == 201){
           double delayInSeconds = 0.7;
           dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
           dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
           });
       }
       else {
           DLog(@"HTTP register status code %li", (long)[responseCode statusCode]);
       }
    }];
}

-(void)auth:(NSDictionary *)parameters {

    NSData *data = [NSJSONSerialization dataWithJSONObject:parameters options:NSJSONWritingPrettyPrinted error:nil];
    NSMutableURLRequest *request = [self RequestInit:@"http://136.145.181.112:8080/api-token-auth/" data:data method:@"POST"];

    NSHTTPURLResponse *responseCode = nil;
    
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:nil];
    
    if([responseCode statusCode] != 200){
        DLog(@"HTTP login status code %li", (long)[responseCode statusCode]);
    }
    else {
        AppDelegate *delegate = [[UIApplication sharedApplication]delegate];
        
        delegate.incidents = [NSJSONSerialization JSONObjectWithData:response
                                                  options:NSJSONReadingMutableLeaves
                                                  error:nil];
        delegate.incidents = [delegate.incidents valueForKey:@"results"];
        
        
        ViewController *views = [[ViewController alloc] init];
        delegate.window.rootViewController = views;
    }
}

-(void)getNews {
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];

        NSString *token = [[NSString alloc]initWithString:[[NSUserDefaults standardUserDefaults]stringForKey:@"token"]];
        NSLog(@"token: %@", token);
    
        [request setHTTPMethod:@"GET"];
        [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/incidents/",self.baseURL]]];
        [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request addValue:[NSString stringWithFormat:@"Token %@",token] forHTTPHeaderField:@"Authorization"];
    
        NSError *error = [[NSError alloc] init];
        NSHTTPURLResponse *responseCode = nil;
        
        NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
    
        if([responseCode statusCode] != 200){
            NSLog(@"HTTP status code %li", (long)[responseCode statusCode]);
            NSLog(@"nil");
        }
        else {
            AppDelegate *delegate = [[UIApplication sharedApplication]delegate];

            delegate.incidents = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:nil];
            delegate.incidents = [delegate.incidents valueForKey:@"results"]; 
            
            
            ViewController *views = [[ViewController alloc]initWithNibName:@"ViewController" bundle:nil];
            delegate.window.rootViewController = views;
        }
}


-(void)getReports {
    
    NSString *token = [[NSString alloc]initWithString:[[NSUserDefaults standardUserDefaults]stringForKey:@"token"]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];

    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/reports/",self.baseURL]]];
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:@"Token %@",token] forHTTPHeaderField:@"Authorization"];
    
    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *responseCode = nil;
    
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
    
    if([responseCode statusCode] != 200){
        NSLog(@"HTTP status code %li", (long)[responseCode statusCode]);
        NSLog(@"nil");
    }
    else {
        AppDelegate *delegate = [[UIApplication sharedApplication]delegate];
        delegate.reports = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableLeaves error:nil];
        
        delegate.reports = [delegate.reports valueForKey:@"results"]; 
        NSLog(@"%@", delegate.reports);

    }
}

-(void)getPhones {
    NSString *token = [[NSString alloc]initWithString:[[NSUserDefaults standardUserDefaults]stringForKey:@"token"]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/phones/",self.baseURL]]];
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:@"Token %@",token] forHTTPHeaderField:@"Authorization"];
    
    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *responseCode = nil;
    
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
    
    if([responseCode statusCode] != 200){
        NSLog(@"HTTP status code %li", (long)[responseCode statusCode]);
        NSLog(@"nil");
    }
    else {
        AppDelegate *delegate = [[UIApplication sharedApplication]delegate];
        delegate.phones = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableLeaves error:nil];
        delegate.phones = [delegate.phones valueForKey:@"results"];
        
        NSLog(@"%@", delegate.phones);
        
    }
}

@end
