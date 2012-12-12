//
//  PicDecorViewController.h
//  PicDecor
//
//  Created by Leo Gau on 12/9/12.
//  Copyright (c) 2012 Leo Gau. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VCImageEditing.h"

@interface PicDecorViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) IBOutlet VCImageEditing *vcImageEditing;

- (IBAction)doCameraBtn:(id)sender;
- (IBAction)doPhotoAlbumBtn:(id)sender;

@end
