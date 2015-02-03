#import "_VOSNote.h"

@interface VOSNote : _VOSNote {}
// Custom logic goes here.

+(instancetype) noteWithName:(NSString *) name
                    notebook:(VOSNotebook *) notebook
                     context:(NSManagedObjectContext *) context;

@end