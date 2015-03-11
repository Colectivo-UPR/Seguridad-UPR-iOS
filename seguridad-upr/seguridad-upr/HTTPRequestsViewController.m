//
//  HTTPRequestsViewController.m
//  seguridad-upr
//
//  Created by Xiomara on 11/20/14.
//  Copyright (c) 2014 Colectivo-UPR. All rights reserved.
//

#import "HTTPRequestsViewController.h"
#import "ViewController.h"
#import "AlertasViewController.h"
#import "AppDelegate.h"
#import "LoginViewController.h"

@interface HTTPRequestsViewController ()

@property NSString *token;
@property NSString *baseURL;

@end

@implementation HTTPRequestsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.baseURL = @"http://36.145.181.112:8080";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


-(void)postNews:(NSString *)msg title:(NSString *)title date:(NSString *)date building:(NSString *)building {
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/create-incident/",self.baseURL]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];

    NSDictionary *params = @{@"title":title, @"message":msg, @"message": msg, @"faculty":building, @"lat":@"0.0", @"lon":@"0.0"};
    NSData *data = [NSJSONSerialization dataWithJSONObject:params options:0 error:nil];
    
    request.HTTPMethod = @"POST";
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:@"%lu", (unsigned long)[data length]] forHTTPHeaderField:@"Content-Length"];
    [request addValue:[NSString stringWithFormat:@"Token %@", [[NSUserDefaults standardUserDefaults]valueForKey:@"token"]] forHTTPHeaderField:@"Authorization"];
    [request setHTTPBody:data];
    
    // Send the request
    [NSURLConnection connectionWithRequest:request delegate:self];
    
    //get response
    NSHTTPURLResponse* urlResponse = nil;
    NSError *error = [[NSError alloc] init];
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
    NSString *result = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    NSLog(@"Response Code: %ld", (long)[urlResponse statusCode]);
    if ([urlResponse statusCode] >= 200 && [urlResponse statusCode] < 300) {
        NSLog(@"Response: %@", result);
        
        //here you get the response
    }
}

-(void)registration:(NSString *)name lastname:(NSString *)lstname password:(NSString *)passwd email:(NSString *)email user:(NSString *)user phone:(NSString *)phone {
    NSURL *URL = [NSURL URLWithString:@"http://36.145.181.112:8080/register/"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];

    // Set params to be sent to the server
    NSDictionary *params = @{@"username": user, @"first_name":name, @"last_name":lstname, @"password":passwd, @"email":email, @"telephone": phone};
    NSData *data = [NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:nil];
    
    // Set request type
    request.HTTPMethod = @"POST";
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:@"%lu", (unsigned long)[data length]] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:data];
    
    // Send the request
    [NSURLConnection connectionWithRequest:request delegate:self];
}

-(void)auth:(NSString *)passwd user:(NSString *)user {

    NSString *urlString = [NSString stringWithFormat:@"%@/api-token-auth/",self.baseURL];
    
    // Set params to be sent to the server
    NSDictionary *params = @{@"email":user, @"password":passwd};
    NSData *data = [NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:nil];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:urlString]];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:data];
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSLog(@"%@",response);
    }];

    // Send the request
    [NSURLConnection connectionWithRequest:request delegate:self];
    
    //get response
    NSHTTPURLResponse* urlResponse = nil;
    NSError *error = [[NSError alloc] init];
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
    NSString *result = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableLeaves error:nil];
    NSLog(@"Response Code: %ld", (long)[urlResponse statusCode]);
    if ([urlResponse statusCode] >= 200 && [urlResponse statusCode] < 300) {
        NSLog(@"Response: %@", result);
        [[NSUserDefaults standardUserDefaults] setValue:[dict valueForKey:@"token"] forKey:@"token"];
        
        [self getNews];
        [self getReports];
        [self getPhones];
        
        AppDelegate *delegate = [[UIApplication sharedApplication]delegate];
        ViewController *views = [[ViewController alloc]initWithNibName:@"ViewController" bundle:nil];
        
        delegate.window.rootViewController = views;
        //here you get the response
    }
    else{
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"INVALID LOGIN" message:@"TRY AGAIN" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show]; 
        
    }
    
    [task resume];
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
        
        NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
    
        if([responseCode statusCode] != 200){
            NSLog(@"HTTP status code %li", (long)[responseCode statusCode]);
            NSLog(@"nil");
        }
        else {
            AppDelegate *delegate = [[UIApplication sharedApplication]delegate];

            delegate.incidents = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableLeaves error:nil];
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
