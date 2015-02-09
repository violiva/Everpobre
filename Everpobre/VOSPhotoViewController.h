//
//  VOSPhotoViewController.h
//  Everpobre
//
//  Created by Vicente Oliva de la Serna on 5/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import <UIKit/UIKit.h>
@class VOSNote;

@interface VOSPhotoViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *photoView;

- (IBAction)takePhoto:(id)sender;
- (IBAction)deletePhoto:(id)sender;
- (IBAction)Vintage:(id)sender;
- (IBAction)faceRecognition:(id)sender;


-(id)initWithModel:(VOSNote *) model;

@end
