//
//  KOPlanetView.m
//  MaskDemo
//
//  Created by Akshay on 09/03/13.
//  Copyright (c) 2013 Akshay. All rights reserved.
//

#import "MDPlanetView.h"
#import <QuartzCore/QuartzCore.h>

@interface MDPlanetView()

@property (nonatomic) CGPoint imageOrigin;
@property (nonatomic) CGPoint circleOrigin;
@property (nonatomic) CGSize  largeImagesize;
@property (nonatomic) CGSize  smallImageSize;
@property (nonatomic) CGPoint selfCenter;

@property (nonatomic,strong) UIImageView *circleView;
@end

@implementation MDPlanetView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self customInitialzation];
    }
    return self;
}

- (void) customInitialzation
{
    _selfCenter = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    
    _largeImagesize = CGSizeMake(150.0,150.0);
    _smallImageSize = CGSizeMake(75, 75);
            
    _imageView = [[UIImageView alloc] init];
    CGRect frame = _imageView.frame;
    frame.size = _smallImageSize;
    [_imageView setFrame:frame];
    _imageView.center = _selfCenter;
    _imageView.clipsToBounds = YES;
    [self addSubview:_imageView];
    
    _circleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"smallCircle.png"]];
    _circleView.center = _selfCenter;
    [self addSubview:_circleView];
    
    [self addMaskToBounds:self.imageView.frame];
}

- (void) addMaskToBounds:(CGRect) maskBounds
{
	CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
	
    CGPathRef maskPath = CGPathCreateWithEllipseInRect(maskBounds, NULL);
    maskLayer.bounds = maskBounds;
	[maskLayer setPath:maskPath];
	[maskLayer setFillColor:[[UIColor blackColor] CGColor]];
    maskLayer.position = CGPointMake(maskBounds.size.width/2, maskBounds.size.height/2);
	
	[self.imageView.layer setMask:maskLayer];
    
}

- (void) enlargeImage:(BOOL)enlarge
{
    _circleView.image = (enlarge) ? [UIImage imageNamed:@"largeCircle.png"] : [UIImage imageNamed:@"smallCircle.png"];
    CGRect frame = _circleView.frame;
    frame.size = (enlarge) ? CGSizeMake(215.0, 215.0) : CGSizeMake(150,150);
    
    CGRect imageFrame = _imageView.frame;
    imageFrame.size = (enlarge) ? CGSizeMake(150.0, 150.0) : CGSizeMake(75, 75);
    
    [self addMaskToBounds:imageFrame];

    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        _circleView.frame = frame;
        _imageView.frame = imageFrame;
        _imageView.center = _selfCenter;
        _circleView.center = _selfCenter;
    } completion:^(BOOL finished) {
        
    }];
}



@end
