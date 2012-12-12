//
//  VCDecorations.m
//  PicDecor
//
//  Created by Leo Gau on 12/9/12.
//  Copyright (c) 2012 Leo Gau. All rights reserved.
//

#import "VCDecorations.h"

@interface VCDecorations ()

@end

@implementation VCDecorations

@synthesize selectedImage = _selectedImage;

- (IBAction)doImageBtn:(id)sender
{
    self.selectedImage = [sender backgroundImageForState:UIControlStateNormal];
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)doCancelBtn:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

@end
