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

#pragma mark - Class methods
+(NSArray *) observableKeys{
//    return @[ @"name", @"text", @"notebook" ];
//    nuestros objetos a observar se definirán en cada clase
    return nil;
    
}

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

#pragma mark - KVO
-(void) setupKVO{
    // Alta en notificaciones para las propiedades que quiero observar
    
    for (NSString * key in [[self class] observableKeys]){
    
        [self addObserver:self
               forKeyPath:key
                  options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                  context:NULL];
    }
    
}

-(void) tearDownKVO{
    // baja de todas las notificaciones
    for (NSString * key in [[self class] observableKeys]){
        [self removeObserver:self
                  forKeyPath:key];
    }
}


@end
