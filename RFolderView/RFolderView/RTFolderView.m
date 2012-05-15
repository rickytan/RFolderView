//
//  RTFolderView.m
//  RFolderView
//
//  Created by sheng tan on 12-4-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RTFolderView.h"
#import "UIView+RTExterntion.h"

@implementation RTFolderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
        
        [self addTarget:self
                 action:@selector(close:)
       forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
- (void)close:(id)sender
{
    [UIView animateWithDuration:0.35
                     animations:^{
                         CGPoint center = CGPointZero;
                         
                         center = imageView1.center;
                         center.y += 80;
                         imageView1.center = center;
                         
                         center = imageView2.center;
                         center.y -= 40;
                         imageView2.center = center;
                     } 
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.12
                                          animations:^{
                                              self.alpha = 0.1;
                                          } 
                                          completion:^(BOOL finished) {
                                              [self removeFromSuperview];
                                          }];
                     }];
}

- (void)openInView:(UIView *)view 
          atOffset:(CGFloat)offset
 withPreservedView:(UIView *)preservedOrNil
    andContentView:(UIView *)contentView
{
    contentView = view;
    
    self.frame = view.bounds;
    
    UIImage *image1 = nil, *image2 = nil;
    [view screenShotWithSplitOffset:offset
                            toImage:&image1
                            toImage:&image2];
    imageView1 = [[UIImageView alloc] initWithImage:image1];
    imageView2 = [[UIImageView alloc] initWithImage:image2];
    
    [self addSubview:imageView1];
    CGRect frame = imageView2.frame;
    frame.origin.y = offset;
    imageView2.frame = frame;
    [self addSubview:imageView2];
    
    [view addSubview:self];
    
    [UIView animateWithDuration:0.35
                     animations:^{
                         CGPoint center = CGPointZero;
                         
                         center = imageView1.center;
                         center.y -= 80;
                         imageView1.center = center;
                         
                         center = imageView2.center;
                         center.y += 40;
                         imageView2.center = center;
                     }];
}

@end
