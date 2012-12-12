//
//  PicDecorViewController.m
//  PicDecor
//
//  Created by Leo Gau on 12/9/12.
//  Copyright (c) 2012 Leo Gau. All rights reserved.
//

#import "PicDecorViewController.h"

@interface PicDecorViewController ()
@property BOOL startedUp;
@end

@implementation PicDecorViewController

@synthesize vcImageEditing = _vcImageEditing;
@synthesize startedUp = _startedUp;

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (!self.startedUp) {
        if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            [self doPhotoAlbumBtn:nil];
        }
    }
    
    self.startedUp = YES;
}

- (IBAction)doCameraBtn:(id)sender
{
    UIImagePickerController *ipController = [[UIImagePickerController alloc] init];
    
    if ([[[UIDevice currentDevice] model] rangeOfString:@"Sim"].location == NSNotFound) {
        [ipController setSourceType:UIImagePickerControllerSourceTypeCamera];
    }
    [ipController setDelegate:self];
    [self presentViewController:ipController animated:YES completion:nil];
}

- (IBAction)doPhotoAlbumBtn:(id)sender
{
    UIImagePickerController *ipController = [[UIImagePickerController alloc] init];
    [ipController setDelegate:self];
    [self presentViewController:ipController animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self dismissViewControllerAnimated:NO completion:nil];
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.vcImageEditing.editImage = image;
    [self presentViewController:self.vcImageEditing animated:YES completion:nil];
}

@end
