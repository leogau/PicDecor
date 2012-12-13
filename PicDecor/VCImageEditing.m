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

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    [self dismissModalViewControllerAnimated:YES];
}

- (UIImage *)saveImage:(UIView *)view
{
    CGRect mainRect = [[UIScreen mainScreen] bounds];
    UIGraphicsBeginImageContext(mainRect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    [[UIColor blackColor] set];
    
    CGContextFillRect(context, mainRect);
    [view.layer renderInContext:context];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (IBAction)doEmailBtn:(id)sender
{
    MFMailComposeViewController *mailController = [[MFMailComposeViewController alloc] init];
    mailController.mailComposeDelegate = self;
    
    for (UIView *view in [self.view subviews]) {
        if ([view isKindOfClass:[UIToolbar class]]) {
            [view setHidden:YES];
        }
    }
    
    UIImage *image = [self saveImage:self.view];
    
    for (UIView *view in [self.view subviews]) {
        if ([view isKindOfClass:[UIToolbar class]]) {
            [view setHidden:NO];
        }
    }
    
    NSData *imageAsData = UIImagePNGRepresentation(image);
    [mailController addAttachmentData:imageAsData mimeType:@"image/png" fileName:@"PicDecor.png"];
    [mailController setSubject:@"Your PicDecor Image"];
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    [self presentModalViewController:mailController animated:YES];
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
