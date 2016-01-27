//
//  PFClient.m
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import "PFClient.h"

typedef NS_ENUM(NSInteger, kPFClientAPIKeyStatus) {
    kPFClientAPIKeyStatusActive,
    kPFClientAPIKeyStatusInvalid
};

static NSString* const kPFClientKeyCurrentKey = @"current_api_key_key";
static NSString* const kPFClientKeyStatusKey = @"current_api_key_status_key";

@interface PFClient()
@property (nonatomic, strong, readwrite) NSString* apiKey;
@property (nonatomic, strong, readwrite) NSString* backupKey;
@property (nonatomic, assign, getter = isUsingBackupKey) BOOL usingBackupKey;
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

- (id)initWithAPIKey:(NSString*)apiKey
{
    return [self initWithAPIKey:apiKey backupKey:nil];
}

- (id)initWithAPIKey:(NSString*)apiKey backupKey:(NSString*)backupKey
{
    NSParameterAssert(apiKey);
    
    if (self = [super init]) {
        _apiKey = apiKey;
        _backupKey= backupKey;
        _usingBackupKey = NO;
    }
    return self;
}

+ (instancetype)initializeWithAPIKey:(NSString *)apiKey
{
    return [self initializeWithAPIKey:apiKey backupKey:nil];
}

+ (instancetype)initializeWithAPIKey:(NSString*)apiKey backupKey:(NSString*)backupKey
{
    if (_sharedInstance) {
        @throw [PFExceptions invalidInitializationExceptionPFCLient];
    }
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] initWithAPIKey:apiKey backupKey:backupKey];
    });
    
    return _sharedInstance;
}

#pragma mark ----------------------
#pragma mark Key Exchange
#pragma mark ----------------------

- (BOOL)exchangeAPIKey
{
    BOOL retVal = NO;
    if (self.backupKey) {
        NSString* apiKey = self.apiKey;
        NSString* backupKey = self.backupKey;
        self.backupKey = apiKey;
        self.apiKey = backupKey;
        self.usingBackupKey = !self.usingBackupKey;
        retVal = YES;
    }
    
    return retVal;
}

#pragma mark ----------------------
#pragma mark Request Handling
#pragma mark ----------------------

+ (void)cancelAllRequests
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.operationQueue cancelAllOperations];
}

+ (void)cancelRequest:(PFBaseRequest*)request
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    for (NSOperation *operation in [manager.operationQueue operations]) {
        if (![operation isKindOfClass:[NSURLSessionTask class]]) {
            continue;
        }
        
        BOOL hasMatchingPath = [((NSURLSessionTask *)operation).originalRequest.URL.path isEqualToString:request.urlWithParams];
        
        if (hasMatchingPath) {
            [operation cancel];
        }
    }
}

+ (void)executePFBreedListRequest:(PFBreedListRequest*)request
                          success:(void (^)(PFBreedList* breedList, PFBreedListRequest* request))success
                          failure:(void (^)(PFBreedListRequest* request, NSError *error))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:request.urlWithParams parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSDictionary* petFinderDict = [responseObject objectForKey:kPFAPIPetFinderKey];
        NSDictionary* breedsDict = [petFinderDict objectForKey:kPetBreedListBreedsKey];
        PFBreedList* breedList = [PFBreedList breedListFromBreedsDictionary:breedsDict];
        if (success) success(breedList, request);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        if (!PFClient.sharedInstance.isUsingBackupKey && [[PFClient sharedInstance] exchangeAPIKey]) {
            [self executePFBreedListRequest:request success:success failure:failure];
        } else {
            if (failure) failure(request, error);
            if (PFClient.sharedInstance.isUsingBackupKey) {
                [[PFClient sharedInstance] exchangeAPIKey];
            }
        }
    }];
}

+ (void)executePFPetGetRequest:(PFPetGetRequest*)request
                       success:(void (^)(PFPetRecord* petRecord, PFPetGetRequest* request))success
                       failure:(void (^)(PFPetGetRequest* request, NSError *error))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:request.urlWithParams parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSDictionary* petFinderDict = [responseObject objectForKey:kPFAPIPetFinderKey];
        NSDictionary* petDict = [petFinderDict objectForKey:kPetRecordPetKey];
        PFPetRecord* petRecord = [PFPetRecord petRecordFromDictionary:petDict];
        if (petRecord.petID.identifier && petRecord.petID.identifier.length > 0) {
            if (success) success(petRecord, request);
        } else {
            if (failure) failure(request, [PFError errorForNoPetRecordAvailable]);
        }
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        if (!PFClient.sharedInstance.isUsingBackupKey && [[PFClient sharedInstance] exchangeAPIKey]) {
            [self executePFPetGetRequest:request success:success failure:failure];
        } else {
            if (failure) failure(request, error);
            if (PFClient.sharedInstance.isUsingBackupKey) {
                [[PFClient sharedInstance] exchangeAPIKey];
            }
        }
    }];
}

+ (void)executePFPetGetRandomRequest:(PFPetGetRandomRequest*)request
                             success:(void (^)(PFPetRecord* petRecord, PFPetGetRandomRequest* request))success
                             failure:(void (^)(PFPetGetRandomRequest* request, NSError *error))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:request.urlWithParams parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSDictionary* petFinderDict = [responseObject objectForKey:kPFAPIPetFinderKey];
        id petRecords = [petFinderDict objectForKey:kPetRecordPetKey];
        if ([petRecords isKindOfClass:[NSDictionary class]]) {
            PFPetRecord* petRecord = [PFPetRecord petRecordFromDictionary:petRecords];
            if (petRecord.petID.identifier && petRecord.petID.identifier.length > 0) {
                if (success) success(petRecord, request);
            } else {
                if (failure) failure(request, [PFError errorForNoPetRecordAvailable]);
            }
        } else {
            PFPetRecord* petRecord = [PFPetRecord petRecordFromDictionary:[petRecords randomObject]];
            if (petRecord.petID.identifier && petRecord.petID.identifier.length > 0) {
                if (success) success(petRecord, request);
            } else {
                if (failure) failure(request, [PFError errorForNoPetRecordAvailable]);
            }
        }
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        if (!PFClient.sharedInstance.isUsingBackupKey && [[PFClient sharedInstance] exchangeAPIKey]) {
            [self executePFPetGetRandomRequest:request success:success failure:failure];
        } else {
            if (failure) failure(request, error);
            if (PFClient.sharedInstance.isUsingBackupKey) {
                [[PFClient sharedInstance] exchangeAPIKey];
            }
        }
    }];
}

+ (void)executePFPetFindRequest:(PFPetFindRequest*)request
                        success:(void (^)(PFPetRecordList* petRecordList, PFPetFindRequest* request))success
                        failure:(void (^)(PFPetFindRequest* request, NSError *error))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:request.urlWithParams parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSDictionary* petFinderDict = [responseObject objectForKey:kPFAPIPetFinderKey];
        PFPetRecordList* petRecordList = [PFPetRecordList petRecordListFromDictionary:petFinderDict];
        
#warning TODO: Remove this section of code if PetFinder ever gets their shit together and fixes the damn gender filter bug!
///////////////////////////////////////////////////////////////////////////////////
        NSMutableArray* petsCopy = [petRecordList.pets mutableCopy];
        NSMutableArray* recordsToRemove = [@[] mutableCopy];
        NSString* sex = request.params[kPetRecordSexKey];
        if (sex && sex.length > 0) {
            [petsCopy enumerateObjectsUsingBlock:^(PFPetRecord* record, NSUInteger idx, BOOL *stop) {
                if (![record.genderType.gender isEqualToString:sex]) {
                    [recordsToRemove addObject:record];
                }
            }];
            [petsCopy removeObjectsInArray:recordsToRemove];
            petRecordList = [PFPetRecordList petRecordListWithPets:petsCopy andLastOffset:petRecordList.lastOffset];
        }
///////////////////////////////////////////////////////////////////////////////////
        
        if (success) success(petRecordList, request);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        if (!PFClient.sharedInstance.isUsingBackupKey && [[PFClient sharedInstance] exchangeAPIKey]) {
            [self executePFPetFindRequest:request success:success failure:failure];
        } else {
            if (failure) failure(request, [PFError errorForSearchFailure]);
            if (PFClient.sharedInstance.isUsingBackupKey) {
                [[PFClient sharedInstance] exchangeAPIKey];
            }
        }
    }];
}

+ (void)executePFShelterFindRequest:(PFShelterFindRequest*)request
                            success:(void (^)(PFShelterRecordList* shelterRecordList, PFShelterFindRequest* request))success
                            failure:(void (^)(PFShelterFindRequest* request, NSError *error))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:request.urlWithParams parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSDictionary* petFinderDict = [responseObject objectForKey:kPFAPIPetFinderKey];
        PFShelterRecordList* shelterRecordList = [PFShelterRecordList shelterRecordListFromDictionary:petFinderDict];
        if (success) success(shelterRecordList, request);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        if (!PFClient.sharedInstance.isUsingBackupKey && [[PFClient sharedInstance] exchangeAPIKey]) {
            [self executePFShelterFindRequest:request success:success failure:failure];
        } else {
            if (failure) failure(request, error);
            if (PFClient.sharedInstance.isUsingBackupKey) {
                [[PFClient sharedInstance] exchangeAPIKey];
            }
        }
    }];
}

+ (void)executePFShelterGetRequest:(PFShelterGetRequest*)request
                           success:(void (^)(PFShelterRecord* shelterRecord, PFShelterGetRequest* request))success
                           failure:(void (^)(PFShelterGetRequest* request, NSError *error))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:request.urlWithParams parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSDictionary* petFinderDict = [responseObject objectForKey:kPFAPIPetFinderKey];
        NSDictionary* shelterDict = [petFinderDict objectForKey:kShelterRecordShelterKey];
        PFShelterRecord* shelterRecord = [PFShelterRecord shelterRecordFromDictionary:shelterDict];
        if (success) success(shelterRecord, request);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        if (!PFClient.sharedInstance.isUsingBackupKey && [[PFClient sharedInstance] exchangeAPIKey]) {
            [self executePFShelterGetRequest:request success:success failure:failure];
        } else {
            if (failure) failure(request, error);
            if (PFClient.sharedInstance.isUsingBackupKey) {
                [[PFClient sharedInstance] exchangeAPIKey];
            }
        }
    }];
}

+ (void)executePFShelterGetPetsRequest:(PFShelterGetPetsRequest*)request
                               success:(void (^)(PFPetRecordList* petRecordList, PFShelterGetPetsRequest* request))success
                               failure:(void (^)(PFShelterGetPetsRequest* request, NSError *error))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:request.urlWithParams parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSDictionary* petFinderDict = [responseObject objectForKey:kPFAPIPetFinderKey];
        PFPetRecordList* petRecordList = [PFPetRecordList petRecordListFromDictionary:petFinderDict];
        if (success) success(petRecordList, request);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        if (!PFClient.sharedInstance.isUsingBackupKey && [[PFClient sharedInstance] exchangeAPIKey]) {
            [self executePFShelterGetPetsRequest:request success:success failure:failure];
        } else {
            if (failure) failure(request, error);
            if (PFClient.sharedInstance.isUsingBackupKey) {
                [[PFClient sharedInstance] exchangeAPIKey];
            }
        }
    }];
}

+ (void)executePFShelterListByBreedRequest:(PFShelterListByBreedRequest*)request
                                   success:(void (^)(PFShelterRecordList* shelterRecordList, PFShelterListByBreedRequest* request))success
                                   failure:(void (^)(PFShelterListByBreedRequest* request, NSError *error))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:request.urlWithParams parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSDictionary* petFinderDict = [responseObject objectForKey:kPFAPIPetFinderKey];
        PFShelterRecordList* shelterRecordList = [PFShelterRecordList shelterRecordListFromDictionary:petFinderDict];
        if (success) success(shelterRecordList, request);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        if (!PFClient.sharedInstance.isUsingBackupKey && [[PFClient sharedInstance] exchangeAPIKey]) {
            [self executePFShelterListByBreedRequest:request success:success failure:failure];
        } else {
            if (failure) failure(request, error);
            if (PFClient.sharedInstance.isUsingBackupKey) {
                [[PFClient sharedInstance] exchangeAPIKey];
            }
        }
    }];
}

@end
