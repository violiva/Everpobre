//
//  VOSNotesViewController.h
//  Everpobre
//
//  Created by Vicente Oliva de la Serna on 4/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSCoreDataTableViewController.h"
#import "VOSNotebook.h"

@interface VOSNotesViewController : VOSCoreDataTableViewController

@property (strong, nonatomic) VOSNotebook * notebook;

@end
