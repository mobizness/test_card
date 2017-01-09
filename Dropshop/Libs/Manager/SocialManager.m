//
//  SocialManager.m
//  YepNoo
//
//  Created by ellisa on 3/8/14.
//  Copyright (c) 2014 Hualong. All rights reserved.
//

#import "SocialManager.h"
#import "AFHTTPClient.h"
#import "AFHTTPRequestOperation.h"

#import "SocialUser.h"
#import "SocialFeed.h"
#import "SocialNotification.h"



//Defines

//Web Services


//local
//#define API_BASE_URL                @"http://10.0.1.139:9800/api/"
#define API_BASE_URL                  @"https://api.trello.com/1/"

#define API_GET_THEMES                              @"lists/58730a293b5a6abf4aec3912/cards"




@interface SocialManager()<CLLocationManagerDelegate>

- (void)sendToService : (NSDictionary *) _params
              success : (void (^) (id _responseObject)) _success
              failure : (void (^) (NSError *_error)) _failure
               suffix : (NSString *)_suffix;

- (void)sendToService : (NSDictionary *) _params
                photo : (NSData *) _photo
              success : (void (^) (id))_success
              failure : (void (^) (NSError *))_failure
               suffix : (NSString *)_suffix;

@end

@implementation SocialManager

@synthesize me;
@synthesize location;
@synthesize locationManager;
@synthesize tokenid;
@synthesize filename;
@synthesize extension;

#pragma mark - Shared Functions

+ (SocialManager *)sharedManager
{
    __strong static SocialManager *sharedObject = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        sharedObject = [[SocialManager alloc] init];
        
    });
    
    return sharedObject;
    
}

+ (NSString *)contentTypeForImageData:(NSData *)data
{
    uint8_t c;
    
    [data getBytes:&c length:1];
    
    switch (c) {
        case 0xFF:
            return @"image/jpeg";
            break;
        case 0x89:
            return @"image/png";
            break;
        case 0x47:
            return @"image/gif";
            break;
        case 0x49:
            break;
        case 0x4D:
            return @"image/tiff";
            break;
            
        default:
            break;
    }
    return nil;
}

- (id)init
{
    if (self = [super init])
    {
        
        //        CLLocationManager *manager = [[CLLocationManager alloc] init];
        //
        //        [manager setDelegate:self];
        //        [manager setDesiredAccuracy:kCLLocationAccuracyBest];
        //        [manager startUpdatingLocation];
        //
        //        [self setLocation:nil];
        //        [self setLocationManager:manager];
        //
        tokenid = @"19d2dd0f933588dbedb7c9462ed945ac30bebb7c47017f314cb2c735c70a79f1";
    }
    
    return self;
}


#pragma mark - Location Delegate

- (void)locationManager: (CLLocationManager *)_manager didupdateLocation:(CLLocation *) _newLocation fromLocation:(CLLocation *)_oldLocation
{
    self.location = _newLocation;
    
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"Invalid  Position");
}

#pragma mark - Web Service

- (void)sendToService:(NSDictionary *)_params
              success:(void (^)(id))_success
              failure:(void (^)(NSError *))_failure
               suffix:(NSString *)_suffix
{
    NSURL     *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",API_BASE_URL,_suffix]];
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:url];
    NSMutableURLRequest *request = [client requestWithMethod:@"GET" path:nil parameters:_params];
    
    AFHTTPRequestOperation  *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    [client registerHTTPOperationClass:[AFHTTPRequestOperation class]];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *_operation, id _responseObject){
        
        NSString *string = [[NSString alloc] initWithData:_responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"%@",string);
        
        //Response Object
        
        id responseObject = [NSJSONSerialization JSONObjectWithData:_responseObject
                                                            options:kNilOptions
                                                              error:nil];
        
        //Success
        
        if (_success)
        {
            _success(responseObject);
        }
        
    }failure:^(AFHTTPRequestOperation *_operation, NSError *_error) {
        NSLog(@"%@",_error.description);
        //Failure
        
        if (_failure)
        {
            _failure(_error);
        }
    }];
    
    [operation start];
    
}

- (void)sendToService:(NSDictionary *)_params
                photo:(NSData *)_photo
              success:(void (^)(id))_success
              failure:(void (^)(NSError *))_failure
               suffix:(NSString *)_suffix
{
    
    
    
    
    NSURL     *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",API_BASE_URL,_suffix]];
    AFHTTPClient  *client = [[AFHTTPClient alloc] initWithBaseURL:url];
    
    //    NSLog(@"%@----%@",filename,extension);
    
    NSString *fileType  = [[NSString alloc] init];
    
    if ([extension isEqualToString:@"JPG"])
    {
        fileType = @"jpeg";
    }
    else
    {
        fileType = @"png";
    }
    
    NSMutableURLRequest   *request = [client multipartFormRequestWithMethod:@"POST"
                                                                       path:nil
                                                                 parameters:_params
                                                  constructingBodyWithBlock:^(id<AFMultipartFormData> _formData) {
                                                      if (_photo)
                                                      {
                                                          [_formData appendPartWithFileData:_photo
                                                                                       name:@"photo"
                                                                                   fileName:@"post.jpeg"
                                                                                   mimeType:@"image/jpeg"];
                                                      }
                                                  }];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [client registerHTTPOperationClass:[AFHTTPRequestOperation class]];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *_operation, id _responseObject) {
        
        NSString *str = [[NSString alloc] initWithData:_responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"%@",str);
        
        //Response Object
        
        id responseObject = [NSJSONSerialization JSONObjectWithData:_responseObject
                                                            options:kNilOptions
                                                              error:nil];
        //success
        
        if (_success)
        {
            _success(responseObject);
        }
        
        
    } failure:^(AFHTTPRequestOperation *_operation, NSError *_error) {
        NSLog(@"%@",_error.description);
        
        //Failure
        if (_failure)
        {
            _failure(_error);
        }
        
    }];
    
    [operation start];
}


-(void)GetThemes:(NSString*) _id
                 successed:(void (^)(id))_success
                   failure:(void (^)(NSError *))_failure
{
    [self sendToService:nil
                success:_success
                failure:_failure
                 suffix:API_GET_THEMES];
    
}

- (void)GetAttachment : (NSString*)_field
        member_fields : (NSString*)_member_fields
                  key : (NSString*)_key
                token : (NSString*)_token
               cardid : (NSString*)_cardid
            successed : (void (^)(id))_success
              failure : (void (^)(NSError *))_failure
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    [params setObject:_field forKey:@"field"];
    [params setObject:_member_fields forKey:@"member_fields"];
    [params setObject:_key forKey:@"key"];
    [params setObject:_token forKey:@"token"];
    
    [self sendToService:params
                success:_success
                failure:_failure
                 suffix:[NSString stringWithFormat:@"cards/%@/attachments", _cardid]];
}

@end
