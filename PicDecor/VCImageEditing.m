//
//  VCImageEditing.m
//  PicDecor
//
//  Created by Leo Gau on 12/9/12.
//  Copyright (c) 2012 Leo Gau. All rights reserved.
//

#import "VCImageEditing.h"
#import "MovableImageView.h"

@interface VCImageEditing ()

@end

@implementation VCImageEditing

@synthesize editImage = _editImage;
@synthesize selectingImage = _selectingImage;
@synthesize vcDecorations = _vcDecorations;
@synthesize ivEditingImage = _ivEditingImage;

- (IBAction)doDecorateBtn:(id)sender
{
    self.selectingImage = YES;
    [self presentViewController:self.vcDecorations animated:YES completion:nil];
}

- (IBAction)doEmailBtn:(id)sender
{
    return;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.editImage) {
        self.ivEditingImage.image = self.editImage;
        [self.view sendSubviewToBack:self.ivEditingImage];
    }
    
    if (self.selectingImage) {
        MovableImageView *iv = [[MovableImageView alloc] initWithImage:self.vcDecorations.selectedImage];
        [iv setUserInteractionEnabled:YES];
        [self.view addSubview:iv];
    }
    
    self.selectingImage = NO;
}

@end
