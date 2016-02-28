//
//  PetFinderAPITV.h
//  PetFinderAPITV
//
//  Created by Jeremy Fox on 1/26/16.
//  Copyright © 2016 Jeremy Fox. All rights reserved.
//

//! Project version number for PetFinderAPITV.
//FOUNDATION_EXPORT double PetFinderAPITVVersionNumber;

//! Project version string for PetFinderAPITV.
//FOUNDATION_EXPORT const unsigned char PetFinderAPITVVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <PetFinderAPITV/PublicHeader.h>

// Constants
#import <PetFinderAPITV/PFConstants.h>

//Categories
#import <PetFinderAPITV/NSObject+Extras.h>
#import <PetFinderAPITV/NSDictionary+Extras.h>
#import <PetFinderAPITV/NSString+Extras.h>
#import <PetFinderAPITV/NSArray+Extras.h>
#import <PetFinderAPITV/NSDate+Extras.h>

// Models
#import <PetFinderAPITV/PFExceptions.h>
#import <PetFinderAPITV/PFError.h>
#import <PetFinderAPITV/PFAnimalType.h>
#import <PetFinderAPITV/PFPetIDType.h>
#import <PetFinderAPITV/PFPetIDList.h>
#import <PetFinderAPITV/PFBreedType.h>
#import <PetFinderAPITV/PFBreedList.h>
#import <PetFinderAPITV/PFPetStatusType.h>
#import <PetFinderAPITV/PFPetGenderType.h>
#import <PetFinderAPITV/PFPetAgeType.h>
#import <PetFinderAPITV/PFPetSizeType.h>
#import <PetFinderAPITV/PFPetOptionType.h>
#import <PetFinderAPITV/PFPetOptionList.h>
#import <PetFinderAPITV/PFPetIDList.h>
#import <PetFinderAPITV/PFPetPhotoType.h>
#import <PetFinderAPITV/PFPetVideoType.h>
#import <PetFinderAPITV/PFPetMediaType.h>
#import <PetFinderAPITV/PFPetRecordList.h>
#import <PetFinderAPITV/PFShelterIDType.h>
#import <PetFinderAPITV/PFShelterRecordList.h>
#import <PetFinderAPITV/PFShelterRecord.h>
#import <PetFinderAPITV/PFPetContactType.h>
#import <PetFinderAPITV/PFPetRecord.h>
// Service
#import <PetFinderAPITV/PFBaseRequest.h>
#import <PetFinderAPITV/PFPetFindRequest.h>
#import <PetFinderAPITV/PFBreedListRequest.h>
#import <PetFinderAPITV/PFPetGetRequest.h>
#import <PetFinderAPITV/PFPetGetRandomRequest.h>
#import <PetFinderAPITV/PFShelterFindRequest.h>
#import <PetFinderAPITV/PFShelterGetRequest.h>
#import <PetFinderAPITV/PFShelterGetPetsRequest.h>
#import <PetFinderAPITV/PFShelterListByBreedRequest.h>
#import <PetFinderAPITV/PFClient.h>