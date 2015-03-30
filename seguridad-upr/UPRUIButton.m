//
//  UPRUIButton.m
//  seguridad-upr
//
//  Created by Xiomara on 3/17/15.
//  Copyright (c) 2015 Colectivo-UPR. All rights reserved.
//

#import "UPRUIButton.h"
#import <QuartzCore/QuartzCore.h>

@interface UPRUIButton ()


@end

@implementation UPRUIButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.opaque = NO;
        self.backgroundColor = [UIColor clearColor];
        
        self.layer.borderColor = (__bridge CGColorRef)([UIColor redColor]);
        self.layer.borderWidth = 1.0;
        self.layer.cornerRadius = 5.0;
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textColor = [UIColor redColor];
        _titleLabel.highlightedTextColor = [UIColor redColor];
        _titleLabel.font = [UIFont systemFontOfSize:16.0];
        
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:_titleLabel];
        
        _supportLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _supportLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _supportLabel.backgroundColor = [UIColor clearColor];
        _supportLabel.textColor = [UIColor redColor];
        _supportLabel.highlightedTextColor = [UIColor redColor];
        _supportLabel.font = [UIFont systemFontOfSize:16.0];
        _supportLabel.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:_supportLabel];
    }
    return self;
}

- (void)updateConstraints
{
    //[self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:7.0];
    //[self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10.0];
    //[self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10.0];
    //
    //[self.supportLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:7.0];
    //[self.supportLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:5.0];
    //[self.supportLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:5.0];
    
    [super updateConstraints];
}

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    
    self.titleLabel.highlighted = highlighted;
    self.supportLabel.highlighted = highlighted;
    
    if (highlighted) {
        self.backgroundColor = [UIColor redColor];
    } else {
        self.backgroundColor = [UIColor clearColor];
    }
}

- (void)setEnabled:(BOOL)enabled
{
    [super setEnabled:enabled];
    if (enabled) {
        self.titleLabel.textColor = [UIColor redColor];
        self.supportLabel.textColor = [UIColor redColor];
    } else {
        self.titleLabel.textColor = [UIColor redColor];
        self.supportLabel.textColor = [UIColor redColor];
    }
}

- (CGSize)intrinsicContentSize
{
    return CGSizeMake(UIViewNoIntrinsicMetric, [[self class] defaultHeight]);
}

+ (CGFloat)defaultHeight
{
    return 34.0;
}

@end
