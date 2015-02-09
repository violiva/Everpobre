//
//  VOSNameTableViewCell.m
//  Everpobre
//
//  Created by Vicente Oliva de la Serna on 5/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSNameTableViewCell.h"
#import "VOSNote.h"

@interface VOSNameTableViewCell()
@end


@implementation VOSNameTableViewCell

#pragma mark - Properties
// creamos un setter personalizado
-(void) setNote:(VOSNote *)note{
    // sincronizamos la vista con la nota
    self.nameField.text = note.name;
    
    // guardamos la nota
    _note = note;
}

#pragma mark - Class methods
+(CGFloat) height{
    return 44.0f;
}

+(NSString *) cellId{
    return [self description];
}



#pragma mark - Misc

-(void) prepareForReuse{
    [super prepareForReuse];
    // es muy importante para celdas personalizadas.
    // te manda la tabla cuando te saca del caché y te va a reutilizar
    // es buen momento para resetear la lista antes de que te metan datos nuevos
    // y darse de baja de las notificaciones de KVO
    
    // cuando desaparezco mem mandan este mensaje para que me resetee y me prepare para ser reutilizado
    //  Esto es algo así como el viewWillDissappear para celdas
    
    // Sincroniza la vista con la nota por si hubo cambios
    self.note.name = self.nameField.text;
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
