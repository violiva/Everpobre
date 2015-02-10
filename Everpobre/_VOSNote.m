// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to VOSNote.m instead.

#import "_VOSNote.h"

const struct VOSNoteAttributes VOSNoteAttributes = {
	.creationDate = @"creationDate",
	.modificationDate = @"modificationDate",
	.name = @"name",
	.text = @"text",
};

const struct VOSNoteRelationships VOSNoteRelationships = {
	.location = @"location",
	.notebook = @"notebook",
	.photo = @"photo",
};

@implementation VOSNoteID
@end

@implementation _VOSNote

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Note" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Note";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Note" inManagedObjectContext:moc_];
}

- (VOSNoteID*)objectID {
	return (VOSNoteID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic creationDate;

@dynamic modificationDate;

@dynamic name;

@dynamic text;

@dynamic location;

@dynamic notebook;

@dynamic photo;

@end

