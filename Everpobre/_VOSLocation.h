// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to VOSLocation.h instead.

@import CoreData;
#import "VOSBaseObject.h"

extern const struct VOSLocationAttributes {
	__unsafe_unretained NSString *address;
	__unsafe_unretained NSString *latitud;
	__unsafe_unretained NSString *longitude;
} VOSLocationAttributes;

extern const struct VOSLocationRelationships {
	__unsafe_unretained NSString *notes;
} VOSLocationRelationships;

@class VOSNote;

@interface VOSLocationID : NSManagedObjectID {}
@end

@interface _VOSLocation : VOSBaseObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) VOSLocationID* objectID;

@property (nonatomic, strong) NSString* address;

//- (BOOL)validateAddress:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* latitud;

@property (atomic) float latitudValue;
- (float)latitudValue;
- (void)setLatitudValue:(float)value_;

//- (BOOL)validateLatitud:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* longitude;

@property (atomic) float longitudeValue;
- (float)longitudeValue;
- (void)setLongitudeValue:(float)value_;

//- (BOOL)validateLongitude:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *notes;

- (NSMutableSet*)notesSet;

@end

@interface _VOSLocation (NotesCoreDataGeneratedAccessors)
- (void)addNotes:(NSSet*)value_;
- (void)removeNotes:(NSSet*)value_;
- (void)addNotesObject:(VOSNote*)value_;
- (void)removeNotesObject:(VOSNote*)value_;

@end

@interface _VOSLocation (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveAddress;
- (void)setPrimitiveAddress:(NSString*)value;

- (NSNumber*)primitiveLatitud;
- (void)setPrimitiveLatitud:(NSNumber*)value;

- (float)primitiveLatitudValue;
- (void)setPrimitiveLatitudValue:(float)value_;

- (NSNumber*)primitiveLongitude;
- (void)setPrimitiveLongitude:(NSNumber*)value;

- (float)primitiveLongitudeValue;
- (void)setPrimitiveLongitudeValue:(float)value_;

- (NSMutableSet*)primitiveNotes;
- (void)setPrimitiveNotes:(NSMutableSet*)value;

@end
