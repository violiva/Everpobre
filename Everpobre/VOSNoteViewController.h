//
//  VOSNoteViewController.h
//  Everpobre
//
//  Created by Vicente Oliva de la Serna on 5/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import <UIKit/UIKit.h>
@class VOSNote;

@interface VOSNoteViewController : UITableViewController
@property (nonatomic, strong) VOSNote * note;

-(id) initWithModel:(VOSNote *) model;

@end
