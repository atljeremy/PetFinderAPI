//
//  PFPetRecord.m
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import "PFPetRecord.h"

@implementation PFPetRecord

- (id)initWithPetRecordDictionary:(NSDictionary*)dict
{
    if (self = [super init]) {
        NSString* identifier = [[dict objectForKey:kPFAPIIDKey] objectForKey:kPFAPIContentKey];
        NSString* shelterID = [[dict objectForKey:kPetRecordShelterIDKey] objectForKey:kPFAPIContentKey];
        NSString* shelterPetID = [[dict objectForKey:kPetRecordShelterPetIDIDKey] objectForKey:kPFAPIContentKey];
        NSString* name = [[dict objectForKey:kPFAPINameKey] objectForKey:kPFAPIContentKey];
        NSString* animal = [[dict objectForKey:kPetRecordAnimalKey] objectForKey:kPFAPIContentKey];
        NSDictionary* breeds = [dict objectForKey:kPetRecordBreedsKey];
        NSString* mix = [[dict objectForKey:kPetRecordMixKey] objectForKey:kPFAPIContentKey];
        NSString* age = [[dict objectForKey:kPetRecordAgeKey] objectForKey:kPFAPIContentKey];
        NSString* gender = [[dict objectForKey:kPetRecordSexKey] objectForKey:kPFAPIContentKey];
        NSString* size = [[dict objectForKey:kPetRecordSizeKey] objectForKey:kPFAPIContentKey];
        id options = [[dict objectForKey:kPetRecordOptionsKey] objectForKey:kPetRecordOptionKey];
        NSString* description = [[dict objectForKey:kPetRecordDescriptionKey] objectForKey:kPFAPIContentKey];
        NSDate* lastUpdate = [[dict objectForKey:kPetRecordLastUpdateKey] objectForKey:kPFAPIContentKey];
        NSString* status = [[dict objectForKey:kPFAPIStatusKey] objectForKey:kPFAPIContentKey];
        NSDictionary* media = [dict objectForKey:kPetRecordMediaKey];
        NSDictionary* contact = [dict objectForKey:kPetRecordContactKey];
        
        _petID = VALUE_OR_DEFAULT([PFPetIDType petIDTypeWithID:identifier], [PFPetIDType new]);
        _shelterID = VALUE_OR_DEFAULT([PFShelterIDType shelterIDTypeWithID:shelterID], [PFShelterIDType new]);
        _shelterPetID = VALUE_OR_DEFAULT(shelterPetID, kPFUnkown);
        _name = VALUE_OR_DEFAULT(name, kPFUnkown);
        _animalType = VALUE_OR_DEFAULT([PFAnimalType animalTypeWithAnimal:animal], [PFAnimalType new]);
        _breedsList = VALUE_OR_DEFAULT([PFBreedList breedListFromBreedsDictionary:breeds], [PFBreedList new]);
        _mix = VALUE_OR_DEFAULT(mix, kPFUnkown);
        _ageType = VALUE_OR_DEFAULT([PFPetAgeType ageTypeWithAge:age], [PFPetAgeType new]);
        _genderType = VALUE_OR_DEFAULT([PFPetGenderType genderTypeWithGender:gender], [PFPetGenderType new]);
        _sizeType = VALUE_OR_DEFAULT([PFPetSizeType sizeTypeWithSize:size], [PFPetSizeType new]);
        _optionsList = VALUE_OR_DEFAULT([PFPetOptionList optionsListFromOptions:options], [PFPetOptionList new]);
        _description = VALUE_OR_DEFAULT(description, kPFUnkown);
        _lastUpdate = lastUpdate; // Can be nil
        _statusType = VALUE_OR_DEFAULT([PFPetStatusType statusTypeWithStatus:status], [PFPetStatusType new]);
        _mediaType = VALUE_OR_DEFAULT([PFPetMediaType mediaTypeWithMediaDictionary:media], [PFPetMediaType new]);
        _shelter = VALUE_OR_DEFAULT([PFShelterRecord shelterRecordFromDictionary:contact], [PFShelterRecord new]);
    }
    return self;
}

+ (instancetype)petRecordFromDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithPetRecordDictionary:dict];
}

- (NSString*)fullAddress
{
    NSString* address = self.cityStateZip;
    if (self.shelter.address1.length > 0) {
        address = [self.shelter.address1 stringByAppendingFormat:@", %@", address];
    }
    return address;
}

- (NSString*)cityState
{
    NSString* cityState = @"";
    if (self.shelter.city.length > 0 && self.shelter.state.length > 0) {
        cityState = [self.shelter.city stringByAppendingFormat:@", %@", self.shelter.state];
    }
    return cityState;
}

- (NSString*)cityStateZip
{
    NSString* cityStateZip = @"";
    if (self.shelter.zip.length > 0) {
        cityStateZip = [self.cityState stringByAppendingFormat:@" %@", self.shelter.zip];
    }
    return cityStateZip;
}

- (void)setCoordinate:(CLLocationCoordinate2D)coordinate
{
    [self willChangeValueForKey:@"coordinate"];
    _coordinate = coordinate;
    [self didChangeValueForKey:@"coordinate"];
}

- (PFPetPhotoType*)defaultThumbnail
{
    for (PFPetPhotoType* photoType in self.mediaType.photos) {
        if ([photoType.size isEqualToString:kPetPhotoTKey]) {
            return photoType;
        }
    }
    return nil;
}

@end
