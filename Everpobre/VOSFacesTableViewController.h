//
//  VOSFacesTableViewController.h
//  Everpobre
//
//  Created by Vicente Oliva de la Serna on 9/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VOSFacesTableViewController : UITableViewController

@property (strong, nonatomic) NSArray * faces;
@property (strong, nonatomic) UIImage * imgOriginal;

-(id) initWithModel: (NSArray *) aFaces
              style:(UITableViewStyle) style
                img:(UIImage *) img;



@end
