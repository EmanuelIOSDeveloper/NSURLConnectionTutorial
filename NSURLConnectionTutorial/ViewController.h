//
//  ViewController.h
//  NSURLConnectionTutorial
//
//  Created by Emanuel Andrade on 03/08/15.
//  Copyright (c) 2015 Emanuel Andrade. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *urlTextView;
@property (weak, nonatomic) IBOutlet UIButton *loadButton;
@property (weak, nonatomic) IBOutlet UITextView *dataTextView;
@property (strong, nonatomic) NSMutableData *data;

-(IBAction)load:(id)sender;

@end

