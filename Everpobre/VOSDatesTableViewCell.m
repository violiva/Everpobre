//
//  VOSDatesTableViewCell.m
//  Everpobre
//
//  Created by Vicente Oliva de la Serna on 5/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSDatesTableViewCell.h"
#import "VOSNote.h"

@implementation VOSDatesTableViewCell


+(CGFloat)height{
    return 44.0f;
}

+(NSString *)cellId{
    return [self description];
}

-(void) setNote:(VOSNote *)note{
    
    // guardar la note
    _note = note;
    
    // observamos modificationDate y cuando
    // cambia la mostramos en la vista
    [self.note addObserver:self
                forKeyPath:VOSNoteAttributes.modificationDate
                   options:0
                   context:NULL];
    
    // Mostramos los datos en la vista
    [self syncNoteWithView];

}

-(void) prepareForReuse{
    [super prepareForReuse];
    
    // Hay que darse de baja de las notificaciones
    // de KVO!!!
    [self.note removeObserver:self
                   forKeyPath:VOSNoteAttributes.modificationDate];
    
}

-(void) observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context{
    
    // sincronizamos el nuevo valor de modificationDate
    [self syncNoteWithView];
    
}

-(void) syncNoteWithView{
    
    NSDateFormatter *fmt = [NSDateFormatter new];
    fmt.dateStyle = NSDateFormatterShortStyle;
    self.creationDate.text = [fmt stringFromDate:self.note.creationDate];
    
    fmt.dateStyle = NSDateIntervalFormatterFullStyle;
    self.modificationDate.text = [fmt stringFromDate:self.note.modificationDate];
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
