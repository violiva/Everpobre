//
//  VOSDatesTableViewCell.h
//  Everpobre
//
//  Created by Vicente Oliva de la Serna on 5/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import <UIKit/UIKit.h>
@class VOSNote;

@interface VOSDatesTableViewCell : UITableViewCell

+(CGFloat)height;
+(NSString *)cellId;

@property (weak, nonatomic) IBOutlet UILabel *creationDate;
@property (weak, nonatomic) IBOutlet UILabel *modificationDate;
@property (nonatomic, strong) VOSNote * note;

@end
