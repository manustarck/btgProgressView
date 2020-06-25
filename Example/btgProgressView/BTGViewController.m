//
//  BTGViewController.m
//  btgProgressView
//
//  Created by manustarck on 06/25/2020.
//  Copyright (c) 2020 manustarck. All rights reserved.
//

#import "BTGViewController.h"
@import btgProgressView;

@interface BTGViewController ()

@end

@implementation BTGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [_progressView setGradientWithStartColor:[UIColor redColor] andEndColor:[UIColor blueColor]];
    [_progressView setProgress:0.7 animated:NO];
    [_progressView setTrackTintColor:[UIColor colorWithRed:0. green:0. blue:0. alpha:0.1]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
