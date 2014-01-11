//
//  PFMacros.h
//  PetFinderAPI
//
//  Created by Jeremy Fox on 1/7/14.
//  Copyright (c) 2014 Jeremy Fox. All rights reserved.
//

#define VALUE_OR_DEFAULT(VALUE, DEFAULT) (VALUE && ![VALUE isKindOfClass:[NSNull class]]) ? VALUE : DEFAULT
