//
//  PFClient.h
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PFClient : NSObject

@property (nonatomic, strong, readonly) NSString* apiKey;

/**
 * @return Use this static method to initialize the PFClient. You must provide a PetFinder API Key or an PFInvalidPFCLientInitializationException will be thrown.
 */
+ (instancetype)initializeWithAPIKey:(NSString*)apiKey;

/**
 * @return Used to access the single isntance of PFCLient. Note, you must initialize PFClient using initializeWithAPIKey: BEFORE trying to access the sharedInstance;
 */
+ (instancetype)sharedInstance;

/**
 * @return Use this to cancel all current requests. All request types that have been started but not complete will be cancelled.
 */
+ (void)cancelAllRequests;

/**
 * @return Cancels a single request.
 * @param The request to be cancelled.
 */
+ (void)cancelRequest:(PFBaseRequest*)request;

+ (void)executePFBreedListRequest:(PFBreedListRequest*)request
                          success:(void (^)(PFBreedList* breedList, PFBreedListRequest* request))success
                          failure:(void (^)(PFBreedListRequest* request, NSError *error))failure;

+ (void)executePFPetGetRequest:(PFPetGetRequest*)request
                       success:(void (^)(PFPetRecord* petRecord, PFPetGetRequest* request))success
                       failure:(void (^)(PFPetGetRequest* request, NSError *error))failure;

+ (void)executePFPetGetRandomRequest:(PFPetGetRandomRequest*)request
                             success:(void (^)(PFPetRecord* petRecord, PFPetGetRandomRequest* request))success
                             failure:(void (^)(PFPetGetRandomRequest* request, NSError *error))failure;

+ (void)executePFPetFindRequest:(PFPetFindRequest*)request
                        success:(void (^)(PFPetRecordList* petRecordList, PFPetFindRequest* request))success
                        failure:(void (^)(PFPetFindRequest* request, NSError *error))failure;

+ (void)executePFShelterFindRequest:(PFShelterFindRequest*)request
                            success:(void (^)(PFShelterRecordList* shelterRecordList, PFShelterFindRequest* request))success
                            failure:(void (^)(PFShelterFindRequest* request, NSError *error))failure;

+ (void)executePFShelterGetRequest:(PFShelterGetRequest*)request
                           success:(void (^)(PFShelterRecord* shelterRecord, PFShelterGetRequest* request))success
                           failure:(void (^)(PFShelterGetRequest* request, NSError *error))failure;

+ (void)executePFShelterGetPetsRequest:(PFShelterGetPetsRequest*)request
                               success:(void (^)(PFPetRecordList* petRecordList, PFShelterGetPetsRequest* request))success
                               failure:(void (^)(PFShelterGetPetsRequest* request, NSError *error))failure;

+ (void)executePFShelterListByBreedRequest:(PFShelterListByBreedRequest*)request
                                   success:(void (^)(PFShelterRecordList* shelterRecordList, PFShelterListByBreedRequest* request))success
                                   failure:(void (^)(PFShelterListByBreedRequest* request, NSError *error))failure;

@end
