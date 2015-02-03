#import "_VOSNotebook.h"

@interface VOSNotebook : _VOSNotebook {}
// Custom logic goes here.

+(instancetype) notebookWithName:(NSString *) name
                         context:(NSManagedObjectContext *) context;

@end
