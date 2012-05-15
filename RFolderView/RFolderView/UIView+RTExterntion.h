//
//  UIView+RTExterntion.h
//  RFolderView
//
//  Created by sheng tan on 12-4-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (RTExterntion)

- (void)screenShotWithSplitOffset:(CGFloat)offset toImage:(UIImage**)image1 toImage:(UIImage**)image2;

@end
