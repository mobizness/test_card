//
//  SocialManager.h
//  YepNoo
//
//  Created by ellisa on 3/8/14.
//  Copyright (c) 2014 Hualong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
@class SocialUser;
@class SocialFeed;
@class SocialNotification;



@interface SocialManager : NSObject


@property (strong, nonatomic) SocialUser * me;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLLocation *location;

@property (strong, nonatomic) NSString *tokenid;

@property (strong, nonatomic) NSString *filename;
@property (strong, nonatomic) NSString *extension;


//Functions
+(SocialManager *)sharedManager;



//Get image type from NSData

+ (NSString *)contentTypeForImageData:(NSData *)data;
//Sign In


- (void)GetThemes : (NSString*) _id
        successed : (void (^)(id))_success
          failure : (void (^)(NSError *))_failure;

- (void)GetAttachment : (NSString*)_field
        member_fields : (NSString*)_member_fields
                  key : (NSString*)_key
                token : (NSString*)_token
               cardid : (NSString*)_cardid
            successed : (void (^)(id))_success
              failure : (void (^)(NSError *))_failure;

@end
