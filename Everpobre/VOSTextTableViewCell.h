//
//  VOSTextTableViewCell.h
//  Everpobre
//
//  Created by Vicente Oliva de la Serna on 5/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import <UIKit/UIKit.h>
@class VOSNote;

@interface VOSTextTableViewCell : UITableViewCell

+(CGFloat)height;
+(NSString *)cellId;

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) VOSNote * note;


@end
