//
//  AppData.h
//  Dopple
//
//  Created by Mitchell Williams on 21/08/2015.
//  Copyright (c) 2015 Mitchell Williams. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppData : NSObject

+ (AppData*) sharedData;


//User Info
@property (nonatomic, retain) NSString* strLongitude;
@property (nonatomic, retain) NSString* strLatitude;

@property (nonatomic) BOOL bPushNotification;


@property (nonatomic) int  nSelectedCategoryIdx;
@property (nonatomic) int  nSortType;
@property (nonatomic) int  nTypeGender;
@property (nonatomic) int  nSizeType;

@property (nonatomic, retain) NSMutableArray* arrServiceName;
@property (nonatomic, retain) NSMutableArray* arrSelectColorInfo;
@property (nonatomic, retain) NSMutableDictionary* dicAppointment;





@property (nonatomic, retain) NSString* strUserid;
@property (nonatomic, retain) NSString* strSelectedProductId;
@property (nonatomic, retain) NSString* strCountCart;
@property (nonatomic, retain) NSString* strCountWishlist;
@property (nonatomic, retain) NSString* strUserName;
@property (nonatomic, retain) NSString* strFullName;
@property (nonatomic, retain) NSString* strUserImage;
@property (nonatomic, retain) NSString* strEmail;
@property (nonatomic, retain) NSString* strBirth;
@property (nonatomic, retain) NSString* strStripeToken;
@property (nonatomic, retain) NSString* strForLastFour;


@property (nonatomic) BOOL bLoggedIn;

@property (nonatomic) int  nSelectedProductId;
@property (nonatomic, retain) NSMutableArray* arrProductData;
@property (nonatomic, retain) NSMutableArray* arrWishlistData;
@property (nonatomic, retain) NSMutableArray* arrCartData;
@property (nonatomic, retain) NSMutableArray* arrCategoryData;
@property (nonatomic, retain) NSMutableArray* arrCommentData;
@property (nonatomic, retain) NSMutableArray* arrAddress;


@property (nonatomic, retain) NSMutableDictionary* dicProductData;

@property (nonatomic, retain) NSMutableDictionary* dicCardData;

@end
