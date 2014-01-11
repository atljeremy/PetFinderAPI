//
//  PFPetGetRandomRequest.m
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#import "PFPetGetRandomRequest.h"

@implementation PFPetGetRandomRequest

- (id)init {
    return [super initWithPath:@"pet.getRandom"];
}

- (void)setShelterid:(NSString *)shelterid
{
    _shelterid = shelterid;
    [self.params setObject:_shelterid forKey:kPetRecordShelterIDKey];
}

@end
