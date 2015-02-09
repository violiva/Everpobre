//
//  VOSBaseObject.m
//  Everpobre
//
//  Created by Vicente Oliva de la Serna on 2/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSBaseObject.h"

@interface VOSBaseObject()

@end

@implementation VOSBaseObject

#pragma mark - Lifecycle
-(void) awakeFromInsert{
    [super awakeFromInsert];
    
    // se llama sólo una vez en su vida
    [self setupKVO];
}

-(void) awakeFromFetch{
    [super awakeFromFetch];
    
    // Se llama muchas veces
    [self setupKVO];
}

-(void) willTurnIntoFault{
    [super willTurnIntoFault];
    
    [self tearDownKVO];
    
}

#pragma mark - Util
-(NSArray *) observableKeys{
    return nil;
}

#pragma mark - KVO
-(void) setupKVO{
    // Alta en notificaciones para las propiedades que quiero observar
    
    // opciones para que te pase el valor antiguo y el nuevo( no nos hace falta: NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld ) esto es para no recibir los datos de la imagen 2 veces -> Problemas de memoria
    for (NSString * key in [self observableKeys]){
    
        [self addObserver:self
               forKeyPath:key
//                  options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                  options:0
                  context:NULL];
    }
    
}

-(void) tearDownKVO{
    // baja de todas las notificaciones
    for (NSString * key in [self observableKeys]){
        [self removeObserver:self
                  forKeyPath:key];
    }
}


@end
