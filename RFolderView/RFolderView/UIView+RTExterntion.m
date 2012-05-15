//
//  UIView+RTExterntion.m
//  RFolderView
//
//  Created by sheng tan on 12-4-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "UIView+RTExterntion.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (RTExterntion)

- (void)screenShotWithSplitOffset:(CGFloat)offset 
                          toImage:(UIImage **)image1
                          toImage:(UIImage **)image2
{    
    UIGraphicsBeginImageContext(self.bounds.size);
    CGContextRef content = UIGraphicsGetCurrentContext();
    [self.layer renderInContext:content];
    UIImage *screenShotImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    CGRect upperRect = CGRectMake(0, 0, CGRectGetWidth(self.bounds), offset);
    CGRect lowerRect = CGRectMake(0, offset, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds)-offset);
    
    CGImageRef imageRef1 = CGImageCreateWithImageInRect(screenShotImage.CGImage, upperRect);
    *image1 = [UIImage imageWithCGImage:imageRef1];
    
    CGImageRef imageRef2 = CGImageCreateWithImageInRect(screenShotImage.CGImage, lowerRect);
    *image2 = [UIImage imageWithCGImage:imageRef2];
    
    CGImageRelease(imageRef1);
    CGImageRelease(imageRef2);
}

@end
