//
//  VCImageEditing.h
//  PicDecor
//
//  Created by Leo Gau on 12/9/12.
//  Copyright (c) 2012 Leo Gau. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VCDecorations.h"
#import <QuartzCore/QuartzCore.h>
#import <MessageUI/MessageUI.h>

@interface VCImageEditing : UIViewController <MFMailComposeViewControllerDelegate>

@property bool selectingImage;
@property (nonatomic, weak) IBOutlet UIImageView *ivEditingImage;
@property (nonatomic, strong) UIImage *editImage;
@property (nonatomic, strong) IBOutlet VCDecorations *vcDecorations;

- (IBAction)doDecorateBtn:(id)sender;
- (IBAction)doEmailBtn:(id)sender;

@end
