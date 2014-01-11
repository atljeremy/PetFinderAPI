//
//  PFClient.m
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import "PFClient.h"

@interface PFClient()
@property (nonatomic, strong, readwrite) NSString* apiKey;
@end

@implementation PFClient

static PFClient* _sharedInstance = nil;

#pragma mark ----------------------
#pragma mark Initialization
#pragma mark ----------------------

+ (instancetype)sharedInstance
{
    if (!_sharedInstance) {
        @throw [PFExceptions invalidInitializationExceptionPFCLient];
    }
    return _sharedInstance;
}

- (id)initWithAPIKey:(NSString*)apiKey {
    if (self = [super init]) {
        _apiKey = apiKey;
    }
    return self;
}

+ (instancetype)initializeWithAPIKey:(NSString *)apiKey
{
    if (_sharedInstance) {
        @throw [PFExceptions invalidInitializationExceptionPFCLient];
    }
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] initWithAPIKey:apiKey];
    });
    
    return _sharedInstance;
}

+ (void)executePFBreedListRequest:(PFBreedListRequest*)request
                          success:(void (^)(PFBreedList* breedList, PFBreedListRequest* request))success
                          failure:(void (^)(PFBreedListRequest* request, NSError *error))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:request.urlWithParams parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary* petFinderDict = [responseObject objectForKey:kPFAPIPetFinderKey];
        NSDictionary* breedsDict = [petFinderDict objectForKey:kPetBreedListBreedsKey];
        PFBreedList* breedList = [PFBreedList breedListFromBreedsDictionary:breedsDict];
        if (success) success(breedList, request);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) failure(request, error);
    }];
}

+ (void)executePFPetGetRequest:(PFPetGetRequest*)request
                       success:(void (^)(PFPetRecord* petRecord, PFPetGetRequest* request))success
                       failure:(void (^)(PFPetGetRequest* request, NSError *error))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:request.urlWithParams parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary* petFinderDict = [responseObject objectForKey:kPFAPIPetFinderKey];
        NSDictionary* petDict = [petFinderDict objectForKey:kPetRecordPetKey];
        PFPetRecord* petRecord = [PFPetRecord petRecordFromDictionary:petDict];
        if (petRecord.petID.identifier && petRecord.petID.identifier.length > 0) {
            if (success) success(petRecord, request);
        } else {
            if (failure) failure(request, [PFErrors errorForNoPetRecordAvailable]);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) failure(request, error);
    }];
}

+ (void)executePFPetGetRandomRequest:(PFPetGetRandomRequest*)request
                             success:(void (^)(PFPetRecord* petRecord, PFPetGetRandomRequest* request))success
                             failure:(void (^)(PFPetGetRandomRequest* request, NSError *error))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:request.urlWithParams parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary* petFinderDict = [responseObject objectForKey:kPFAPIPetFinderKey];
        NSArray* petRecords = [petFinderDict objectForKey:kPetRecordPetKey];
        PFPetRecord* petRecord = [PFPetRecord petRecordFromDictionary:[petRecords randomObject]];
        if (petRecord.petID.identifier && petRecord.petID.identifier.length > 0) {
            if (success) success(petRecord, request);
        } else {
            if (failure) failure(request, [PFErrors errorForNoPetRecordAvailable]);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) failure(request, error);
    }];
}

+ (void)executePFPetFindRequest:(PFPetFindRequest*)request
                        success:(void (^)(PFPetRecordList* petRecordList, PFPetFindRequest* request))success
                        failure:(void (^)(PFPetFindRequest* request, NSError *error))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:request.urlWithParams parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary* petFinderDict = [responseObject objectForKey:kPFAPIPetFinderKey];
        PFPetRecordList* petRecordList = [PFPetRecordList petRecordListFromDictionary:petFinderDict];
        if (petRecordList.pets && petRecordList.pets.count > 0) {
            if (success) success(petRecordList, request);
        } else {
            if (failure) failure(request, [PFErrors errorForNoPetRecordAvailable]);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) failure(request, error);
    }];
}

+ (void)executePFShelterFindRequest:(PFShelterFindRequest*)request
                            success:(void (^)(PFShelterRecordList* shelterRecordList, PFShelterFindRequest* request))success
                            failure:(void (^)(PFShelterFindRequest* request, NSError *error))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:request.urlWithParams parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary* petFinderDict = [responseObject objectForKey:kPFAPIPetFinderKey];
        PFShelterRecordList* shelterRecordList = [PFShelterRecordList shelterRecordListFromDictionary:petFinderDict];
        if (shelterRecordList.shelters && shelterRecordList.shelters.count > 0) {
            if (success) success(shelterRecordList, request);
        } else {
            if (failure) failure(request, [PFErrors errorForNoPetRecordAvailable]);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) failure(request, error);
    }];
}

+ (void)executePFShelterGetRequest:(PFShelterGetRequest*)request
                           success:(void (^)(PFShelterRecord* shelterRecord, PFShelterGetRequest* request))success
                           failure:(void (^)(PFShelterGetRequest* request, NSError *error))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:request.urlWithParams parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary* petFinderDict = [responseObject objectForKey:kPFAPIPetFinderKey];
        NSDictionary* shelterDict = [petFinderDict objectForKey:kShelterRecordShelterKey];
        PFShelterRecord* shelterRecord = [PFShelterRecord shelterRecordFromDictionary:shelterDict];
        if (shelterRecord.shelterID.identifier && shelterRecord.shelterID.identifier.length > 0) {
            if (success) success(shelterRecord, request);
        } else {
            if (failure) failure(request, [PFErrors errorForNoPetRecordAvailable]);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) failure(request, error);
    }];
}

+ (void)executePFShelterGetPetsRequest:(PFShelterGetPetsRequest*)request
                               success:(void (^)(PFPetRecordList* petRecordList, PFShelterGetPetsRequest* request))success
                               failure:(void (^)(PFShelterGetPetsRequest* request, NSError *error))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:request.urlWithParams parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary* petFinderDict = [responseObject objectForKey:kPFAPIPetFinderKey];
        PFPetRecordList* petRecordList = [PFPetRecordList petRecordListFromDictionary:petFinderDict];
        if (petRecordList.pets && petRecordList.pets.count > 0) {
            if (success) success(petRecordList, request);
        } else {
            if (failure) failure(request, [PFErrors errorForNoPetRecordAvailable]);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) failure(request, error);
    }];
}

+ (void)executePFShelterListByBreedRequest:(PFShelterListByBreedRequest*)request
                                   success:(void (^)(PFShelterRecordList* shelterRecordList, PFShelterListByBreedRequest* request))success
                                   failure:(void (^)(PFShelterListByBreedRequest* request, NSError *error))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:request.urlWithParams parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary* petFinderDict = [responseObject objectForKey:kPFAPIPetFinderKey];
        PFShelterRecordList* shelterRecordList = [PFShelterRecordList shelterRecordListFromDictionary:petFinderDict];
        if (shelterRecordList.shelters && shelterRecordList.shelters.count > 0) {
            if (success) success(shelterRecordList, request);
        } else {
            if (failure) failure(request, [PFErrors errorForNoPetRecordAvailable]);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) failure(request, error);
    }];
}

@end
