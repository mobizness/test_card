//
//  AppData.m
//  Dopple
//
//  Created by Mitchell Williams on 21/08/2015.
//  Copyright (c) 2015 Mitchell Williams. All rights reserved.
//

#import "AppData.h"

@implementation AppData

#pragma mark - Initialization
+ (AppData*) sharedData
{
    static AppData *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[[self class] alloc]init];
    });
    return sharedInstance;
}

- (id) init
{
    self = [super init];
    if (self)
    {
        
    }
    
    return self;
}

#pragma mark - Getter and Setter
#pragma mark- NSString
- (void) setStrUserid:(NSString*)strUserid
{
    [[NSUserDefaults standardUserDefaults] setValue:strUserid forKey:kStrUserid];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString*) strUserid
{
    return [[NSUserDefaults standardUserDefaults] valueForKey:kStrUserid];
}

- (void) setStrSelectedProductId:(NSString*)strSelectedProductId
{
    [[NSUserDefaults standardUserDefaults] setValue:strSelectedProductId forKey:kStrSelectedProductId];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString*) strSelectedProductId
{
    return [[NSUserDefaults standardUserDefaults] valueForKey:kStrSelectedProductId];
}

- (void) setStrCountCart:(NSString*)strCountCart
{
    [[NSUserDefaults standardUserDefaults] setValue:strCountCart forKey:kStrCountCart];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString*) strCountCart
{
    return [[NSUserDefaults standardUserDefaults] valueForKey:kStrCountCart];
}

- (void) setStrCountWishlist:(NSString*)strCountWishlist
{
    [[NSUserDefaults standardUserDefaults] setValue:strCountWishlist forKey:kStrCountWishlist];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString*) strCountWishlist
{
    return [[NSUserDefaults standardUserDefaults] valueForKey:kStrCountWishlist];
}

- (void) setStrUserName:(NSString*)strUserName
{
    [[NSUserDefaults standardUserDefaults] setValue:strUserName forKey:kStrUserName];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


- (NSString*) strUserName
{
    return [[NSUserDefaults standardUserDefaults] valueForKey:kStrUserName];
}


- (void) setStrUserImage:(NSString*)strUserImage
{
    [[NSUserDefaults standardUserDefaults] setValue:strUserImage forKey:kStrUserImage];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


- (NSString*) strUserImage
{
    return [[NSUserDefaults standardUserDefaults] valueForKey:kStrUserImage];
}


- (void) setStrFullName:(NSString*)strFullName
{
    [[NSUserDefaults standardUserDefaults] setValue:strFullName forKey:kStrFullName];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


- (NSString*) strFullName
{
    return [[NSUserDefaults standardUserDefaults] valueForKey:kStrFullName];
}

- (void) setStrEmail:(NSString*)strEmail
{
    [[NSUserDefaults standardUserDefaults] setValue:strEmail forKey:kStrEmail];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


- (NSString*) strEmail
{
    return [[NSUserDefaults standardUserDefaults] valueForKey:kStrEmail];
}

- (void) setStrBirth:(NSString*)strBirth
{
    [[NSUserDefaults standardUserDefaults] setValue:strBirth forKey:kStrBirth];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


- (NSString*) strBirth
{
    return [[NSUserDefaults standardUserDefaults] valueForKey:kStrBirth];
}

- (void) setStrStripeToken:(NSString*)strStripeToken
{
    [[NSUserDefaults standardUserDefaults] setValue:strStripeToken forKey:kStrStripeToken];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


- (NSString*) strStripeToken
{
    return [[NSUserDefaults standardUserDefaults] valueForKey:kStrStripeToken];
}

- (void) setStrForLastFour:(NSString*)strForLastFour
{
    [[NSUserDefaults standardUserDefaults] setValue:strForLastFour forKey:kStrForLastFour];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


- (NSString*) strForLastFour
{
    return [[NSUserDefaults standardUserDefaults] valueForKey:kStrForLastFour];
}







- (void) setStrLongitude:(NSString *)strLongitude
{
    [[NSUserDefaults standardUserDefaults] setValue:strLongitude forKey:kLongitude];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString*) strLongitude
{
    return [[NSUserDefaults standardUserDefaults] valueForKey:kLongitude];
}

- (void) setStrLatitude:(NSString *)strLatitude
{
    [[NSUserDefaults standardUserDefaults] setValue:strLatitude forKey:kLatitude];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString*) strLatitude
{
    return [[NSUserDefaults standardUserDefaults] valueForKey:kLatitude];
}

#pragma mark- BOOL
- (void) setBLoggedIn:(BOOL)bLoggedIn
{
    [[NSUserDefaults standardUserDefaults] setBool:bLoggedIn forKey:kLoggedIn];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (BOOL) bLoggedIn
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:kLoggedIn];
}


- (void) setBAddress:(BOOL)bAddress
{
    [[NSUserDefaults standardUserDefaults] setBool:bAddress forKey:kBAddress];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (BOOL) bAddress
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:kBAddress];
}



- (void) setBPushNotification:(BOOL)bPushNotification
{
    [[NSUserDefaults standardUserDefaults] setBool:bPushNotification forKey:kPushNotification];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (BOOL) bPushNotification
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:kPushNotification];
}


#pragma mark- int

- (void) setNSelectedCategoryIdx:(int)nSelectedCategoryIdx
{
    [[NSUserDefaults standardUserDefaults] setInteger:nSelectedCategoryIdx forKey:kNSelectedCategoryNum];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (int) nSelectedCategoryIdx
{
    return (int)[[NSUserDefaults standardUserDefaults] integerForKey:kNSelectedCategoryNum];
}

- (void) setNSortType:(int)nSortType
{
    [[NSUserDefaults standardUserDefaults] setInteger:nSortType forKey:kNSortType];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (int) nSortType
{
    return (int)[[NSUserDefaults standardUserDefaults] integerForKey:kNSortType];
}

- (void) setNTypeGender:(int)nTypeGender
{
    [[NSUserDefaults standardUserDefaults] setInteger:nTypeGender forKey:kNGenderType];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (int) nTypeGender
{
    return (int)[[NSUserDefaults standardUserDefaults] integerForKey:kNGenderType];
}

- (void) setNSizeType:(int)nSizeType
{
    [[NSUserDefaults standardUserDefaults] setInteger:nSizeType forKey:kNSizeType];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (int) nSizeType
{
    return (int)[[NSUserDefaults standardUserDefaults] integerForKey:kNSizeType];
}

- (void) setNSelectedProductId:(int)nSelectedProductId
{
    [[NSUserDefaults standardUserDefaults] setInteger:nSelectedProductId forKey:kProductId];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (int) nSelectedProductId
{
    return (int)[[NSUserDefaults standardUserDefaults] integerForKey:kProductId];
}


#pragma mark- NSArray
- (void) setArrServiceName:(NSMutableArray *)arrServiceName
{
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:arrServiceName];
    
    [[NSUserDefaults standardUserDefaults] setObject:encodedObject forKey:kArrService];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSMutableArray*) arrServiceName
{
    NSData *encodedObject = [[NSUserDefaults standardUserDefaults] objectForKey:kArrService];
    
    NSArray* arrTemp = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    
    NSMutableArray* arrResult = nil;
    if (!arrTemp)
    {
        arrResult = [NSMutableArray new];
    }
    else
    {
        arrResult = [[NSMutableArray alloc] initWithArray:arrTemp];
    }
    
    return arrResult;
}

- (void) setArrSelectColorInfo:(NSMutableArray *)arrSelectColorInfo
{
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:arrSelectColorInfo];
    
    [[NSUserDefaults standardUserDefaults] setObject:encodedObject forKey:kArrSelectColorInfo];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSMutableArray*) arrSelectColorInfo
{
    NSData *encodedObject = [[NSUserDefaults standardUserDefaults] objectForKey:kArrSelectColorInfo];
    
    NSArray* arrTemp = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    
    NSMutableArray* arrResult = nil;
    if (!arrTemp)
    {
        arrResult = [NSMutableArray new];
    }
    else
    {
        arrResult = [[NSMutableArray alloc] initWithArray:arrTemp];
    }
    
    return arrResult;
}

- (void) setArrProductData:(NSMutableArray *)arrProductData
{
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:arrProductData];
    
    [[NSUserDefaults standardUserDefaults] setObject:encodedObject forKey:kArrProductData];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSMutableArray*) arrProductData
{
    NSData *encodedObject = [[NSUserDefaults standardUserDefaults] objectForKey:kArrProductData];
    
    NSArray* arrTemp = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    
    NSMutableArray* arrResult = nil;
    if (!arrTemp)
    {
        arrResult = [NSMutableArray new];
    }
    else
    {
        arrResult = [[NSMutableArray alloc] initWithArray:arrTemp];
    }
    
    return arrResult;
}


- (void) setArrWishlistData:(NSMutableArray *)arrWishlistData
{
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:arrWishlistData];
    
    [[NSUserDefaults standardUserDefaults] setObject:encodedObject forKey:kArrWishlistData];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSMutableArray*) arrWishlistData
{
    NSData *encodedObject = [[NSUserDefaults standardUserDefaults] objectForKey:kArrWishlistData];
    
    NSArray* arrTemp = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    
    NSMutableArray* arrResult = nil;
    if (!arrTemp)
    {
        arrResult = [NSMutableArray new];
    }
    else
    {
        arrResult = [[NSMutableArray alloc] initWithArray:arrTemp];
    }
    
    return arrResult;
}

- (void) setArrCartData:(NSMutableArray *)arrCartData
{
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:arrCartData];
    
    [[NSUserDefaults standardUserDefaults] setObject:encodedObject forKey:kArrCartData];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSMutableArray*) arrCartData
{
    NSData *encodedObject = [[NSUserDefaults standardUserDefaults] objectForKey:kArrCartData];
    
    NSArray* arrTemp = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    
    NSMutableArray* arrResult = nil;
    if (!arrTemp)
    {
        arrResult = [NSMutableArray new];
    }
    else
    {
        arrResult = [[NSMutableArray alloc] initWithArray:arrTemp];
    }
    
    return arrResult;
}


- (void) setArrCategoryData:(NSMutableArray *)arrCategoryData
{
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:arrCategoryData];
    
    [[NSUserDefaults standardUserDefaults] setObject:encodedObject forKey:kArrCategoryData];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSMutableArray*) arrCategoryData
{
    NSData *encodedObject = [[NSUserDefaults standardUserDefaults] objectForKey:kArrCategoryData];
    
    NSArray* arrTemp = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    
    NSMutableArray* arrResult = nil;
    if (!arrTemp)
    {
        arrResult = [NSMutableArray new];
    }
    else
    {
        arrResult = [[NSMutableArray alloc] initWithArray:arrTemp];
    }
    
    return arrResult;
}

- (void) setArrCommentData:(NSMutableArray *)arrCommentData
{
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:arrCommentData];
    
    [[NSUserDefaults standardUserDefaults] setObject:encodedObject forKey:kArrCommentData];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSMutableArray*) arrCommentData
{
    NSData *encodedObject = [[NSUserDefaults standardUserDefaults] objectForKey:kArrCommentData];
    
    NSArray* arrTemp = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    
    NSMutableArray* arrResult = nil;
    if (!arrTemp)
    {
        arrResult = [NSMutableArray new];
    }
    else
    {
        arrResult = [[NSMutableArray alloc] initWithArray:arrTemp];
    }
    
    return arrResult;
}


- (void) setArrAddress:(NSMutableArray *)arrAddress
{
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:arrAddress];
    
    [[NSUserDefaults standardUserDefaults] setObject:encodedObject forKey:kArrAddress];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSMutableArray*) arrAddress
{
    NSData *encodedObject = [[NSUserDefaults standardUserDefaults] objectForKey:kArrAddress];
    
    NSArray* arrTemp = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    
    NSMutableArray* arrResult = nil;
    if (!arrTemp)
    {
        arrResult = [NSMutableArray new];
    }
    else
    {
        arrResult = [[NSMutableArray alloc] initWithArray:arrTemp];
    }
    
    return arrResult;
}


#pragma mark- NSDictionary

- (void) setDicAppointment:(NSMutableDictionary *)dicAppointment
{
    [[NSUserDefaults standardUserDefaults] setValue:dicAppointment forKey:kDicAppointment];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSMutableDictionary*) dicAppointment
{
    NSMutableDictionary* dicTemp = [NSMutableDictionary dictionaryWithDictionary:[[NSUserDefaults standardUserDefaults] valueForKey:kDicAppointment]];
    
    return dicTemp;
}

- (void) setDicProductDetail:(NSMutableDictionary *)dicProductDetail
{
    [[NSUserDefaults standardUserDefaults] setValue:dicProductDetail forKey:kDicProductDetail];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSMutableDictionary*) dicProductData
{
    NSMutableDictionary* dicTemp = [NSMutableDictionary dictionaryWithDictionary:[[NSUserDefaults standardUserDefaults] valueForKey:kDicProductDetail]];
    
    return dicTemp;
}

- (void) setDicCardData:(NSMutableDictionary *)dicCardData
{
    [[NSUserDefaults standardUserDefaults] setValue:dicCardData forKey:kDicCardData];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSMutableDictionary*) dicCardData
{
    NSMutableDictionary* dicTemp = [NSMutableDictionary dictionaryWithDictionary:[[NSUserDefaults standardUserDefaults] valueForKey:kDicCardData]];
    
    return dicTemp;
}

@end
