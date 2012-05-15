//
//  RTFolderView.h
//  RFolderView
//
//  Created by sheng tan on 12-4-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

typedef enum  {
    RTFolderStateNormal = 0,
    RTFolderStateOpened = 1
}RTFolderState;

@interface RTFolderView : UIControl {
    CALayer             * layerOne;
    CALayer             * layerTwo;
    
    UIImageView         * imageView1;
    UIImageView         * imageView2;
    
    UIView              * containerView;
    
    RTFolderState       * state;
}


- (void)openInView:(UIView*)view 
          atOffset:(CGFloat)offset
 withPreservedView:(UIView*)preservedOrNil
    andContentView:(UIView*)contentView;

@end
