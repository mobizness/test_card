//
//  AppDelegate.h
//  Trigger
//
//  Created by mac on 10/10/15.
//  Copyright (c) 2015 Jonas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>


@interface AppDelegate : UIResponder <UIApplicationDelegate, CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
    CLLocation *currentLocation;
    NSString *strUserLatitude, *strUserLongitude;
}


@property (strong, nonatomic) UIWindow *window;
@property (nonatomic) BOOL isPush;

-(NSDate*)getLocalDateAndTime;

@end

