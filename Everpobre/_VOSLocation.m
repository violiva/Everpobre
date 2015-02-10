// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to VOSLocation.m instead.

#import "_VOSLocation.h"

const struct VOSLocationAttributes VOSLocationAttributes = {
	.address = @"address",
	.latitud = @"latitud",
	.longitude = @"longitude",
};

const struct VOSLocationRelationships VOSLocationRelationships = {
	.notes = @"notes",
};

@implementation VOSLocationID
@end

@implementation _VOSLocation

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Location" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Location";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Location" inManagedObjectContext:moc_];
}

- (VOSLocationID*)objectID {
	return (VOSLocationID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"latitudValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"latitud"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"longitudeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"longitude"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic address;

@dynamic latitud;

- (float)latitudValue {
	NSNumber *result = [self latitud];
	return [result floatValue];
}

- (void)setLatitudValue:(float)value_ {
	[self setLatitud:@(value_)];
}

- (float)primitiveLatitudValue {
	NSNumber *result = [self primitiveLatitud];
	return [result floatValue];
}

- (void)setPrimitiveLatitudValue:(float)value_ {
	[self setPrimitiveLatitud:@(value_)];
}

@dynamic longitude;

- (float)longitudeValue {
	NSNumber *result = [self longitude];
	return [result floatValue];
}

- (void)setLongitudeValue:(float)value_ {
	[self setLongitude:@(value_)];
}

- (float)primitiveLongitudeValue {
	NSNumber *result = [self primitiveLongitude];
	return [result floatValue];
}

- (void)setPrimitiveLongitudeValue:(float)value_ {
	[self setPrimitiveLongitude:@(value_)];
}

@dynamic notes;

- (NSMutableSet*)notesSet {
	[self willAccessValueForKey:@"notes"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"notes"];

	[self didAccessValueForKey:@"notes"];
	return result;
}

@end

