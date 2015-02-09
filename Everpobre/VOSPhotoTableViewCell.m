//
//  VOSPhotoTableViewCell.m
//  Everpobre
//
//  Created by Vicente Oliva de la Serna on 5/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSPhotoTableViewCell.h"
#import "VOSNote.h"
#import "VOSPhotoContainer.h"

@implementation VOSPhotoTableViewCell

#pragma mark - Properties
-(void) setNote:(VOSNote *)note{
    //guardamos la nota
    _note = note;
    
    // sincronizamos los datos de la nota con la vista
    if ( note.photo.image){
        self.photoView.image = note.photo.image;
    }
    
    
}

#pragma mark - Class Methods
+(CGFloat)height{
    return 320.0f;
}

+(NSString *)cellId{
    return [self description];
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
