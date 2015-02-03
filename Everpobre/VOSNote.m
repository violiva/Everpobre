#import "VOSNote.h"
#import "VOSPhotoContainer.h"
#import "VOSNotebook.h"

@interface VOSNote ()

// Private interface goes here.

@end

@implementation VOSNote

// Custom logic goes here.


+(instancetype) noteWithName:(NSString *) name
                    notebook:(VOSNotebook *) notebook
                     context:(NSManagedObjectContext *) context{
    VOSNote * note = [self insertInManagedObjectContext:context];

    note.name = name;
    note.notebook = notebook;
    note.creationDate = [NSDate date];
    note.modificationDate = [NSDate date];
    note.photo = [VOSPhotoContainer insertInManagedObjectContext:context];
    
    return note;
}

+(NSArray *) observableKeys{
    return @[@"name", @"text", @"notebook"];
    
}

-(void) observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context{
    
    // sólo me interesa saber que algo ha cambiado
    self.modificationDate = [NSDate date];
}


@end
