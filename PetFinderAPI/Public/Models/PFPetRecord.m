//
//  PFPetRecord.m
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import "PFPetRecord.h"

@interface PFPetRecord()
@property (nonatomic, strong) PFPetPhotoType* defaultThumbnailPhoto;
@property (nonatomic, strong) PFPetPhotoType* defaultHiResPhoto;
@property (nonatomic, strong) PFPetPhotoType* defaultMedResPhoto;
@property (nonatomic, strong) NSArray* internalThumbnailPhotos;
@property (nonatomic, strong) NSArray* internalHiResPhotos;
@property (nonatomic, strong) NSArray* internalMedResPhotos;
@end

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
        NSString* lastUpdate = [[dict objectForKey:kPetRecordLastUpdateKey] objectForKey:kPFAPIContentKey];
        NSDate* lastUpdateDate;
        if (lastUpdate) {
            NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
            [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
            lastUpdateDate = [dateFormatter dateFromString:lastUpdate];
        }
        NSString* status = [[dict objectForKey:kPFAPIStatusKey] objectForKey:kPFAPIContentKey];
        NSDictionary* media = [dict objectForKey:kPetRecordMediaKey];
        NSDictionary* contact = [dict objectForKey:kPetRecordContactKey];
        
        _petID = VALUE_OR_DEFAULT([PFPetIDType petIDTypeWithID:identifier], [PFPetIDType new]);
        _shelterID = VALUE_OR_DEFAULT([PFShelterIDType shelterIDTypeWithID:shelterID], [PFShelterIDType new]);
        _shelterPetID = VALUE_OR_DEFAULT(shelterPetID, kPFUnknown);
        _name = VALUE_OR_DEFAULT(name, kPFUnknown);
        _animalType = VALUE_OR_DEFAULT([PFAnimalType animalTypeWithAnimal:animal], [PFAnimalType new]);
        _breedsList = VALUE_OR_DEFAULT([PFBreedList breedListFromBreedsDictionary:breeds], [PFBreedList new]);
        _mix = VALUE_OR_DEFAULT(mix, kPFUnknown);
        _ageType = VALUE_OR_DEFAULT([PFPetAgeType ageTypeWithAge:age], [PFPetAgeType new]);
        _genderType = VALUE_OR_DEFAULT([PFPetGenderType genderTypeWithGender:gender], [PFPetGenderType new]);
        _sizeType = VALUE_OR_DEFAULT([PFPetSizeType sizeTypeWithSize:size], [PFPetSizeType new]);
        _optionsList = VALUE_OR_DEFAULT([PFPetOptionList optionsListFromOptions:options], [PFPetOptionList new]);
        _petDescription = VALUE_OR_DEFAULT(description, kPFUnknown);
        _lastUpdate = VALUE_OR_DEFAULT(lastUpdateDate, [NSDate date]);
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

#if TARGET_OS_IOS
- (void)setCoordinate:(CLLocationCoordinate2D)coordinate
{
    [self willChangeValueForKey:@"coordinate"];
    _coordinate = coordinate;
    [self didChangeValueForKey:@"coordinate"];
}
#endif

- (PFPetPhotoType*)defaultThumbnail
{
    if (self.defaultThumbnailPhoto) {
        return self.defaultThumbnailPhoto;
    }
    
    for (PFPetPhotoType* photoType in self.mediaType.photos) {
        if ([photoType.size isEqualToString:kPetPhotoFPMKey]) {
            self.defaultThumbnailPhoto = photoType;
            return photoType;
        }
    }
    
    return nil;
}

- (PFPetPhotoType*)defaultMedRes
{
    if (self.defaultMedResPhoto) {
        return self.defaultMedResPhoto;
    }
    
    for (PFPetPhotoType* photoType in self.mediaType.photos) {
        if ([photoType.size isEqualToString:kPetPhotoPNKey]) {
            self.defaultMedResPhoto = photoType;
            return photoType;
        }
    }
    
    return nil;
}

- (PFPetPhotoType*)defaultHiRes
{
    if (self.defaultHiResPhoto) {
        return self.defaultHiResPhoto;
    }
    
    for (PFPetPhotoType* photoType in self.mediaType.photos) {
        if ([photoType.size isEqualToString:kPetPhotoXKey]) {
            self.defaultHiResPhoto = photoType;
            return photoType;
        }
    }
    
    return nil;
}

- (NSArray*)hiResPhotos
{
    if (self.internalHiResPhotos) {
        return self.internalHiResPhotos;
    }
    
    self.internalHiResPhotos = [self photosForSize:kPetPhotoXKey];
    
    return self.internalHiResPhotos;
}

- (NSArray*)mediumResPhotos
{
    if (self.internalHiResPhotos) {
        return self.internalHiResPhotos;
    }
    
    self.internalHiResPhotos = [self photosForSize:kPetPhotoPNKey];
    
    return self.internalHiResPhotos;
}

- (NSArray*)lowResPhotos
{
    if (self.internalHiResPhotos) {
        return self.internalHiResPhotos;
    }
    
    self.internalHiResPhotos = [self photosForSize:kPetPhotoFPMKey];
    
    return self.internalHiResPhotos;
}

- (NSArray*)photosForSize:(NSString*)size {
    NSMutableArray* photos = [@[] mutableCopy];
    
    for (PFPetPhotoType* photoType in self.mediaType.photos) {
        if ([photoType.size isEqualToString:size]) {
            [photos addObject:photoType];
        }
    }
    
    return photos;
}

@end
