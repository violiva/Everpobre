// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to VOSPhotoContainer.m instead.

#import "_VOSPhotoContainer.h"

const struct VOSPhotoContainerAttributes VOSPhotoContainerAttributes = {
	.photoData = @"photoData",
};

const struct VOSPhotoContainerRelationships VOSPhotoContainerRelationships = {
	.notes = @"notes",
};

@implementation VOSPhotoContainerID
@end

@implementation _VOSPhotoContainer

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"PhotoContainer" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"PhotoContainer";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"PhotoContainer" inManagedObjectContext:moc_];
}

- (VOSPhotoContainerID*)objectID {
	return (VOSPhotoContainerID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic photoData;

@dynamic notes;

- (NSMutableSet*)notesSet {
	[self willAccessValueForKey:@"notes"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"notes"];

	[self didAccessValueForKey:@"notes"];
	return result;
}

@end

