//
//  LoadingIndicatorView.m
//  iClub
//
//  Created by Jie Yu on 6/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LoadingIndicatorView.h"
#import "iClubMacro.h"
#import <QuartzCore/QuartzCore.h>
#import "UIColor+Hex.h"

@interface LoadingIndicatorView()
@property (nonatomic, strong) UIView *maskView;
@end


@implementation LoadingIndicatorView

@synthesize loadingIndicator = _loadingIndicator, loadingLabel = _loadingLabel, normalLabel = _normalLabel, type;
@synthesize maskView = _maskView;

- (UIView *)maskView
{
    if (!_maskView) {
        _maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
        [_maskView setBackgroundColor:[UIColor whiteColorWithAlpha:0.6]];
        [_maskView setUserInteractionEnabled:NO];
    }
    
    return _maskView;
}

- (UIActivityIndicatorView*)loadingIndicator
{
    if (!_loadingIndicator) {
        _loadingIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _loadingIndicator.hidden = YES;
        _loadingIndicator.backgroundColor = [UIColor clearColor];
        _loadingIndicator.hidesWhenStopped = YES;
        _loadingIndicator.frame = CGRectMake(110 ,8 , 24, 24);
//        _loadingIndicator.frame = CGRectMake(self.frame.size.width/2 - 12 ,self.frame.size.height/2 - 12 , 24, 24);        
    }
    
    return _loadingIndicator;
}

- (UILabel*)normalLabel
{
    if (!_normalLabel) {
        _normalLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _normalLabel.text = @"上拉加载更多";
        _normalLabel.backgroundColor = [UIColor clearColor];
        [_normalLabel setFont:[UIFont fontWithName:DEFAULT_FONT size:14]];
        _normalLabel.textAlignment = UITextAlignmentCenter;
        [_normalLabel setTextColor:[UIColor darkGrayColor]];
    }
    
    return _normalLabel;

}

- (UILabel*)loadingLabel
{
    if (!_loadingLabel) {
        _loadingLabel = [[UILabel alloc] initWithFrame:CGRectMake(140, 0, 160, 40)];
        _loadingLabel.text = @"加载中... ...";
        _loadingLabel.backgroundColor = [UIColor clearColor];
        [_loadingLabel setFont:[UIFont fontWithName:DEFAULT_FONT size:14]];
        _loadingLabel.textAlignment = UITextAlignmentLeft;
        [_loadingLabel setTextColor:[UIColor darkGrayColor]];
        [_loadingLabel setHidden:YES];
    }
    
    return _loadingLabel;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.type = 1;
        [self addSubview:self.loadingLabel];
        [self addSubview:self.normalLabel];
        [self addSubview:self.loadingIndicator];
    }
    
    return self;
}

- (void)setType:(int)indicatorType
{
    if (indicatorType == 3) {
        // set 3 type
        [self setFrame:CGRectMake(0, 0, 320, 480)];
        [self setBackgroundColor:[UIColor whiteColorWithAlpha:0.5]];
        
        
        UIView *loadingView = [[UIView alloc] initWithFrame:CGRectMake(120, 180, 100, 120)];
        loadingView.layer.masksToBounds = YES;
        loadingView.layer.cornerRadius = 10;
        [loadingView setBackgroundColor:[UIColor blackColorWithAlpha:0.7]];
        
        [self.loadingIndicator removeFromSuperview];
        [self.loadingIndicator setFrame:CGRectMake(0, 0, loadingView.frame.size.width, loadingView.frame.size.height-20)];
        [self.loadingIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
        
        [self.loadingLabel removeFromSuperview];
        [self.loadingLabel setFrame:CGRectMake(0, 80, 100, 50)];
        [self.loadingLabel setTextAlignment:UITextAlignmentCenter];
        [self.loadingLabel setTextColor:[UIColor whiteColor]];
        [self.loadingLabel setFont:[UIFont fontWithName:DEFAULT_FONT size:16]];
        [self.loadingLabel setText:@"Saving..."];
        
        [loadingView addSubview:self.loadingIndicator];
        [loadingView addSubview:self.loadingLabel];
        
        [self addSubview:loadingView];
        
        [self.normalLabel setHidden:YES];
    }
}

- (void)startLoading
{
    [self setHidden:NO];
    [self.loadingIndicator startAnimating];
    [self.loadingLabel setHidden:NO];
    [self.normalLabel setHidden:YES];
    
    [[self superview] bringSubviewToFront:self];
}

- (void)stopLoading:(int)loadingType
{
    [self.loadingIndicator stopAnimating];
    switch (loadingType) {
        case 1:
            [self.normalLabel setHidden:NO];
            [self.normalLabel setText:@"上拉加载更多..."];
            [self.loadingLabel setHidden:YES];
            break;
        case 2:
            [self setHidden:YES];
            break;
        default:
            break;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
