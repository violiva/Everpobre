// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to VOSPhotoContainer.h instead.

@import CoreData;
#import "VOSBaseObject.h"

extern const struct VOSPhotoContainerAttributes {
	__unsafe_unretained NSString *photoData;
} VOSPhotoContainerAttributes;

extern const struct VOSPhotoContainerRelationships {
	__unsafe_unretained NSString *notes;
} VOSPhotoContainerRelationships;

@class VOSNote;

@interface VOSPhotoContainerID : NSManagedObjectID {}
@end

@interface _VOSPhotoContainer : VOSBaseObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) VOSPhotoContainerID* objectID;

@property (nonatomic, strong) NSData* photoData;

//- (BOOL)validatePhotoData:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *notes;

- (NSMutableSet*)notesSet;

@end

@interface _VOSPhotoContainer (NotesCoreDataGeneratedAccessors)
- (void)addNotes:(NSSet*)value_;
- (void)removeNotes:(NSSet*)value_;
- (void)addNotesObject:(VOSNote*)value_;
- (void)removeNotesObject:(VOSNote*)value_;

@end

@interface _VOSPhotoContainer (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitivePhotoData;
- (void)setPrimitivePhotoData:(NSData*)value;

- (NSMutableSet*)primitiveNotes;
- (void)setPrimitiveNotes:(NSMutableSet*)value;

@end
