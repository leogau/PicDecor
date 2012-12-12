//
//  VCDecorations.h
//  PicDecor
//
//  Created by Leo Gau on 12/9/12.
//  Copyright (c) 2012 Leo Gau. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VCDecorations : UIViewController

@property (nonatomic, strong) UIImage *selectedImage;

- (IBAction)doImageBtn:(id)sender;
- (IBAction)doCancelBtn:(id)sender;

@end
