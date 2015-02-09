//
//  VOSNotebookTableViewCell.h
//  Everpobre
//
//  Created by Vicente Oliva de la Serna on 5/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VOSNotebookTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameView;
@property (weak, nonatomic) IBOutlet UILabel *notesView;

+(CGFloat)height;
+(NSString *)cellId;

@end
