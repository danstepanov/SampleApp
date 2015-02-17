//
//  ViewController.m
//  SampleApp
//
//  Created by Daniel Stepanov on 2/16/15.
//  Copyright (c) 2015 Daniel Stepanov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UIButton *aButton;

@end

@implementation ViewController

- (void)loadView {
    // loadView doesn't need to be implemented if using a Storyboard or nib, but it DOES otherwise.
    // Here's the basic implementation, from Apple's doc:
    CGRect applicationFrame = [[UIScreen mainScreen] applicationFrame];
    UIView *contentView = [[UIView alloc] initWithFrame:applicationFrame];
    contentView.backgroundColor = [UIColor blackColor]; // **NOTICE** you can set properties of the contentView
    self.view = contentView;
 
    // In Apple's code, you then -alloc] -init] subviews,
    // and -[self.view addSubview:(UIView *)] for each of your sub-views.
    
    // You could alternatively use lazy instantiation to prevent this method from becoming a clusterfuck.
    // And objects would get recreated when released; however, as long as your VC exists, it's pointer remains
    // strong, so it would never get released...
    // Apple uses this for IBOutlets, so I'm not worried about it for now, esp. since I lazily instantiate.
    
    // note that self.view.frame may still get updated from here to account for other views in the future,
    // so you sohuld not set the frame of these views except in -[UIViewController viewWillLayoutSubviews];
    
    self.aButton = [[UIButton alloc] init];
    [self.aButton setTitle:@"Push me!" forState:UIControlStateNormal];
    [self.aButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:self.aButton];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Target Action here! or setting up RACCommand's if you don't use MVVM / the -[ bindViewModel] idiom.
    [self.aButton addTarget:self action:@selector(buttonPushed:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews]; // make sure you call super here or there's horrific iOS 7 bug
    
    // **NOTICE** You could also add constraints here / etc.
    
    CGFloat buttonWidth = 100;
    CGFloat buttonHeight = 50;
    self.aButton.frame = CGRectMake(
        CGRectGetMidX(self.view.frame) - buttonWidth / 2,
        CGRectGetMidY(self.view.frame) - buttonHeight / 2,
        buttonWidth,
        buttonHeight);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonPushed:(id)sender {
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Wayne Brady loves you!" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [av show];
}

@end
