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

@interface HTTPRequestsViewController ()

@property NSString *token;

@end

@implementation HTTPRequestsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)postNews:(NSString *)msg title:(NSString *)title date:(NSString *)date building:(NSString *)building {
    NSURL *URL = [NSURL URLWithString:@"http://54.172.3.196:8000/create-incident/"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    // Set request type
    request.HTTPMethod = @"POST";
    
    NSDictionary *params = @{@"title":title, @"message":msg, @"message": msg, @"faculty":building, @"lat":@"0.0", @"lon":@"0.0"};
    NSData *data = [NSJSONSerialization dataWithJSONObject:params options:0 error:nil];
    
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
    NSURL *URL = [NSURL URLWithString:@"http://54.172.3.196:8000/register/"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    // Set request type
    request.HTTPMethod = @"POST";
    
    // Set params to be sent to the server
    NSDictionary *params = @{@"username": user, @"first_name":name, @"last_name":lstname, @"password":passwd, @"email":email, @"telephone": phone};
    // Encoding type
    NSData *data = [NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:nil];
    // Add values and contenttype to the http header
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:@"%lu", (unsigned long)[data length]] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:data];
    
    // Send the request
    [NSURLConnection connectionWithRequest:request delegate:self];
}

-(void)auth:(NSString *)passwd user:(NSString *)user {
    NSString *urlString = [NSString stringWithFormat:@"http://54.172.3.196:8000/api-token-auth/"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:urlString]];
    [request setHTTPMethod:@"POST"];
    
    // Set params to be sent to the server
    NSDictionary *params = @{@"username":user, @"password":passwd};
    NSData *data = [NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:nil];
    
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
        [request setHTTPMethod:@"GET"];
        [request setURL:[NSURL URLWithString:@"http://54.172.3.196:8000/incidents/"]];
        [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
        NSString *token = [[NSString alloc]initWithString:[[NSUserDefaults standardUserDefaults]stringForKey:@"token"]];
    
        NSLog(@"token: %@", token);
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
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:@"http://54.172.3.196:8000/reports/"]];
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSString *token = [[NSString alloc]initWithString:[[NSUserDefaults standardUserDefaults]stringForKey:@"token"]];
    
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
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:@"http://54.172.3.196:8000/phones/"]];
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSString *token = [[NSString alloc]initWithString:[[NSUserDefaults standardUserDefaults]stringForKey:@"token"]];
    
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
