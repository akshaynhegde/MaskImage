//
//  MDViewController.m
//  MaskDemo
//
//  Created by Akshay on 08/03/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import "MDViewController.h"
#import "MDPlanetView.h"
#import <QuartzCore/QuartzCore.h>

@interface MDViewController ()

@property (nonatomic,strong) MDPlanetView *planet;

@end

@implementation MDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor blackColor];
        
    _planet = [[MDPlanetView alloc] initWithFrame:CGRectMake(200, 200, 220, 220)];
    _planet.imageView.image = [UIImage imageNamed:@"dog.jpg"];
    [self.view addSubview:_planet];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)makeSmall:(UIButton *)sender
{
    [_planet enlargeImage:NO];
}

- (IBAction)makeBig:(UIButton *)sender
{
    [_planet enlargeImage:YES];
}

@end
