#import "VOSNotebook.h"

@interface VOSNotebook ()

// Private interface goes here.

@end

@implementation VOSNotebook

// Custom logic goes here.

+(instancetype) notebookWithName:(NSString *) name context:(NSManagedObjectContext *) context{
    VOSNotebook * nb = [self insertInManagedObjectContext:context];
    nb.name = name;
    nb.creationDate = [NSDate date];
    nb.modificationDate = [NSDate date];
    
    return nb;
}

#pragma mark - Util
+(NSArray *) observableKeys{
    return @[ @"name", @"notes" ];
    
}

#pragma mark - KVO
-(void) observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context{
    
    // sólo me interesa saber que algo ha cambiado
    self.modificationDate = [NSDate date];
}
@end
