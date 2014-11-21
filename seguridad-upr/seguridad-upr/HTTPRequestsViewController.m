//
//  HTTPRequestsViewController.m
//  seguridad-upr
//
//  Created by Xiomara on 11/20/14.
//  Copyright (c) 2014 Colectivo-UPR. All rights reserved.
//

#import "HTTPRequestsViewController.h"

@interface HTTPRequestsViewController ()

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

-(void)postNews {
    NSURL *URL = [NSURL URLWithString:@"http://54.172.3.196:8000/noticias/"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    // Set request type
    request.HTTPMethod = @"POST";
    
    // Set params to be sent to the server
    NSDictionary *params = @{@"title":@"Le Robaron al decano!", @"message":@"Le roban al decano frente a la escuela de derecho", @"building":@"Escuela de Derecho"};
    // Encoding type
    NSData *data = [NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:nil];
    // Add values and contenttype to the http header
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:@"%lu", (unsigned long)[data length]] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:data];
    
    // Send the request
    [NSURLConnection connectionWithRequest:request delegate:self];
}

-(void)getNews {
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setHTTPMethod:@"GET"];
        [request setURL:[NSURL URLWithString:@"http://54.172.3.196:8000/noticias/"]];
        
        NSError *error = [[NSError alloc] init];
        NSHTTPURLResponse *responseCode = nil;
        
        NSData *oResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
        
        if([responseCode statusCode] != 200){
            NSLog(@"Error getting %@, HTTP status code %li", @"http://54.172.3.196:8000/noticias/", (long)[responseCode statusCode]);
            NSLog(@"nil");
        }
        
        NSLog(@"%@",[[NSString alloc] initWithData:oResponseData encoding:NSUTF8StringEncoding]);
}

@end
