//
//  VOSBaseObject.h
//  Everpobre
//
//  Created by Vicente Oliva de la Serna on 2/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

@import CoreData;
// #import <Foundation/Foundation.h>

@interface VOSBaseObject : NSManagedObject

+(NSArray *) observableKeys;
-(void) setupKVO;
-(void) tearDownKVO;

@end
