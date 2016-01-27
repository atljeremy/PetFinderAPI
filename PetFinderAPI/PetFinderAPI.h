//
//  PetFinderAPI.h
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/26/16.
//  Copyright © 2016 Jeremy Fox. All rights reserved.
//

//! Project version number for PetFinderAPI.
//FOUNDATION_EXPORT double PetFinderAPIVersionNumber;

//! Project version string for PetFinderAPI.
//FOUNDATION_EXPORT const unsigned char PetFinderAPIVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <PetFinderAPI/PublicHeader.h>

// Constants
#import <PetFinderAPI/PFConstants.h>

//Categories
#import <PetFinderAPI/NSObject+Extras.h>
#import <PetFinderAPI/NSDictionary+Extras.h>
#import <PetFinderAPI/NSString+Extras.h>
#import <PetFinderAPI/NSArray+Extras.h>
#import <PetFinderAPI/NSDate+Extras.h>

// Models
#import <PetFinderAPI/PFExceptions.h>
#import <PetFinderAPI/PFError.h>
#import <PetFinderAPI/PFAnimalType.h>
#import <PetFinderAPI/PFPetIDType.h>
#import <PetFinderAPI/PFPetIDList.h>
#import <PetFinderAPI/PFBreedType.h>
#import <PetFinderAPI/PFBreedList.h>
#import <PetFinderAPI/PFPetStatusType.h>
#import <PetFinderAPI/PFPetGenderType.h>
#import <PetFinderAPI/PFPetAgeType.h>
#import <PetFinderAPI/PFPetSizeType.h>
#import <PetFinderAPI/PFPetOptionType.h>
#import <PetFinderAPI/PFPetOptionList.h>
#import <PetFinderAPI/PFPetIDList.h>
#import <PetFinderAPI/PFPetPhotoType.h>
#import <PetFinderAPI/PFPetVideoType.h>
#import <PetFinderAPI/PFPetMediaType.h>
#import <PetFinderAPI/PFPetRecordList.h>
#import <PetFinderAPI/PFShelterIDType.h>
#import <PetFinderAPI/PFShelterRecordList.h>
#import <PetFinderAPI/PFShelterRecord.h>
#import <PetFinderAPI/PFPetContactType.h>
#import <PetFinderAPI/PFPetRecord.h>
// Service
#import <PetFinderAPI/PFBaseRequest.h>
#import <PetFinderAPI/PFPetFindRequest.h>
#import <PetFinderAPI/PFBreedListRequest.h>
#import <PetFinderAPI/PFPetGetRequest.h>
#import <PetFinderAPI/PFPetGetRandomRequest.h>
#import <PetFinderAPI/PFShelterFindRequest.h>
#import <PetFinderAPI/PFShelterGetRequest.h>
#import <PetFinderAPI/PFShelterGetPetsRequest.h>
#import <PetFinderAPI/PFShelterListByBreedRequest.h>
#import <PetFinderAPI/PFClient.h>