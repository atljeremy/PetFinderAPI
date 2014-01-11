Pet Finder API iOS Framework
=============================

This is the source code project for the Pet Finder API iOS Framework.

Online Documentation is available [here](http://atljeremy.github.io/PetFinderAPI/).

How to Install this Framework:
----------------------------

- Download the pre-compiled framework here: TBD
- Drag it into your Xcode project

How to Use This Framework:
--------------------------

### Step 1: Initialize the PFClient

```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [PFClient initializeWithAPIKey:@"YourAPIKeyHere"];
    return YES;
}
```

### Step 2: Create and execute requests

```objective-c
/**
 * Request a list of breeds
 */
PFBreedListRequest* request = [PFBreedListRequest breedListRequestForAnimal:@"dog"];
[PFClient executePFBreedListRequest:request success:^(PFBreedList* breedList, PFBreedListRequest *request) {
    NSLog(@"Breed List: %@", breedList);
} failure:^(PFBreedListRequest *request, NSError *error) {
    NSLog(@"Error: %@", error.localizedDescription);
}];

```

```objective-c
/**
 * Request a specific pet details
 */
PFPetGetRequest* request = [PFPetGetRequest petGetRequestWithPetID:@27864848];
[PFClient executePFPetGetRequest:request success:^(PFPetRecord *petRecord, PFPetGetRequest *request) {
    NSLog(@"Pet Record: %@", petRecord);
} failure:^(PFPetGetRequest *request, NSError *error) {
    NSLog(@"Error: %@", error.localizedDescription);
}];
```

```objective-c
/**
 * Request a random pet
 */
PFPetGetRandomRequest* request = [PFPetGetRandomRequest new];
request.animal = @"dog";// type of animal (barnyard, bird, cat, dog, horse, pig, reptile, smallfurry)
request.breed = @"";    // breed of animal (use PFBreedListRequest for a list of valid breeds)
request.size = @"";     // size of animal (S=small, M=medium, L=large, XL=extra-large)
request.size = @"";     // M=male, F=female
request.location = @""; // the ZIP/postal code or city and state where the search should begin
request.shelterid = @"";// ID of the shelter that posted the pet
[PFClient executePFPetGetRandomRequest:request success:^(PFPetRecord *petRecord, PFPetGetRandomRequest *request) {
    NSLog(@"Pet Record: %@", petRecord);
} failure:^(PFPetGetRandomRequest *request, NSError *error) {
    NSLog(@"Error: %@", error.localizedDescription);
}];
```

```objective-c
/**
 * Find pets that match specified request criteria
 */
PFPetFindRequest* request = [PFPetFindRequest new];
request.animal = @"dog";     // type of animal (barnyard, bird, cat, dog, horse, pig, reptile, smallfurry)
//request.breed = @"";       // breed of animal (use PFBreedListRequest for a list of valid breeds)
request.size = @"L";         // size of animal (S=small, M=medium, L=large, XL=extra-large)
request.sex = @"M";          // M=male, F=female
request.location = @"30666"; // the ZIP/postal code or city and state where the search should begin
request.age = @"Young";      // age of the animal (Baby, Young, Adult, Senior)
//request.offset = @"";      // set this to the value of lastOffset returned by a previous PFPetFindRequest
request.count = @25;         // how many records to return for this particular API call (default is 25)
[PFClient executePFPetFindRequest:request success:^(PFPetRecordList *petRecordList, PFPetFindRequest *request) {
    NSLog(@"Pet Record List: %@", petRecordList);
} failure:^(PFPetFindRequest *request, NSError *error) {
    NSLog(@"Error: %@", error.localizedDescription);
}];
```

```objective-c
/**
 * Find shelters that match specify request criteria
 */
PFShelterFindRequest* request = [PFShelterFindRequest new];
request.location = @"30666"; // the ZIP/postal code or city and state where the search should begin
//request.name = @"";        // full or partial shelter name
//request.offset = @"";      // set this to the value of lastOffset returned by a previous PFPetFindRequest
request.count = @25;         // how many records to return for this particular API call (default is 25)
[PFClient executePFShelterFindRequest:request success:^(PFShelterRecordList *shelterRecordList, PFShelterFindRequest *request) {
    NSLog(@"Shelter Record List: %@", shelterRecordList);
} failure:^(PFShelterFindRequest *request, NSError *error) {
    NSLog(@"Error: %@", error.localizedDescription);
}];
```

```objective-c
/**
 * Request a specific shelter details
 */
PFShelterGetRequest* request = [PFShelterGetRequest shelterGetRequestWithShelterID:@"GA160"];
[PFClient executePFShelterGetRequest:request success:^(PFShelterRecord *shelterRecord, PFShelterGetRequest *request) {
    NSLog(@"Shelter Record: %@", shelterRecord);
} failure:^(PFShelterGetRequest *request, NSError *error) {
    NSLog(@"Error: %@", error.localizedDescription);
}];
```

```objective-c
/**
 * Request a list of pets available for specific request criteria for a specific shelter
 */
PFShelterGetPetsRequest* request = [PFShelterGetPetsRequest new];
request.shelterID = @"GA160";
request.status = @"A";        // A=adoptable, H=hold, P=pending, X=adopted/removed
//request.offset = @"";       // set this to the value of lastOffset returned by a previous PFPetFindRequest
request.count = @25;          // how many records to return for this particular API call (default is 25)
[PFClient executePFShelterGetPetsRequest:request success:^(PFPetRecordList *petRecordList, PFShelterGetPetsRequest *request) {
    NSLog(@"Pet Record List: %@", petRecordList);
} failure:^(PFShelterGetPetsRequest *request, NSError *error) {
    NSLog(@"Error: %@", error.localizedDescription);
}];
```

```objective-c
/**
 * Request a list of pets by breed for specific request criteria
 */
PFShelterListByBreedRequest* request = [PFShelterListByBreedRequest new];
request.animal = @"dog";          // type of animal (barnyard, bird, cat, dog, horse, pig, reptile, smallfurry)
request.breed = @"Affenpinscher"; // breed of animal (use PFBreedListRequest for a list of valid breeds)
//request.offset = @"";           // set this to the value of lastOffset returned by a previous PFPetFindRequest
request.count = @25;              // how many records to return for this particular API call (default is 25)
[PFClient executePFShelterListByBreedRequest:request success:^(PFShelterRecordList* shelterRecordList, PFShelterListByBreedRequest *request) {
    NSLog(@"Shelter Record List: %@", shelterRecordList);
} failure:^(PFShelterListByBreedRequest *request, NSError *error) {
    NSLog(@"Error: %@", error.localizedDescription);
}];
```
