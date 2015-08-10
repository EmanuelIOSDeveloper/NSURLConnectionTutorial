//
//  ViewController.m
//  NSURLConnectionTutorial
//
//  Created by Emanuel Andrade on 03/08/15.
//  Copyright (c) 2015 Emanuel Andrade. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(IBAction)load:(id)sender
{
    [self.urlTextView resignFirstResponder];
    NSURL *url = [NSURL URLWithString:self.urlTextView.text];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url
                                                  cachePolicy:NSURLRequestUseProtocolCachePolicy
                                              timeoutInterval:5];
    
    NSURLConnection *con = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
}

-(void)connection:(NSURLConnection *) connection didReceiveResponse:(NSURLResponse *)response
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    self.data = [[NSMutableData alloc] init];
}

-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.data appendData:data];
}

-(void) connection:(NSURLConnection *) connection didFailWithError:(NSError *)error
{
    NSLog(@"Error: %@", error.description);
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

-(void) connectionDidFinishLoading:(NSURLConnection *)connection
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    NSString *cont = [[NSString alloc] initWithData:self.data encoding:NSUTF8StringEncoding];
    self.dataTextView.text = cont;
}
@end
