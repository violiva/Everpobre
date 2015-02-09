//
//  VOSTextTableViewCell.m
//  Everpobre
//
//  Created by Vicente Oliva de la Serna on 5/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSTextTableViewCell.h"
#import "VOSNote.h"

@implementation VOSTextTableViewCell

#pragma mark - Class Methods
+(CGFloat)height{
    return 320.0f;
}

+(NSString *)cellId{
    return [self description];
}

#pragma mark - Properties
-(void) setNote:(VOSNote *)note{
    // guardamos la nota
    _note = note;
    
    // mostramos el texto en la vista
    self.textView.text = note.text;
}

#pragma mark - Misc
-(void) prepareForReuse{
    [super prepareForReuse];
    
    // guardo lo que haya escrito el usuario
    // en la nota
    self.note.text = self.textView.text;
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
