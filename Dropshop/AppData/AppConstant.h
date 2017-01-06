//
//  AppConstant.h
//  Dopple
//
//  Created by Mitchell Williams on 21/08/2015.
//  Copyright (c) 2015 Mitchell Williams. All rights reserved.
//

#ifndef AppConstant_h
#define AppConstant_h


#pragma mark - constant

#define kLongitude              @"longitude"
#define kLatitude               @"latitude"

#define kPushNotification       @"onoff_pushnotification"
#define kNSelectedCategoryNum   @"selected_categorynum"
#define kNSortType              @"selected_sorttype"
#define kNGenderType            @"selected_gendertype"
#define kNSizeType              @"selected_sizetype"
#define kArrService             @"service_name"
#define kArrSelectColorInfo     @"select_colorinfo"
#define kDicAppointment         @"dic_appointment"


#define kStrUserid              @"id_user"
#define kLoggedIn               @"loggedin"
#define kProductId              @"id_selected_product"

#define kArrProductData         @"arr_productdata"
#define kArrWishlistData        @"arr_wishlistdata"
#define kArrCartData            @"arr_cartdata"
#define kArrCategoryData        @"arr_categorydata"
#define kArrCommentData         @"arr_commentdata"
#define kArrAddress             @"arr_address"

#define kDicProductDetail       @"dic_productdetail"
#define kDicCardData            @"dic_carddata"


#define kStrSelectedProductId   @"product_id"
#define kStrCountCart           @"count_cart"
#define kStrCountWishlist       @"count_wishlist"
#define kStrUserName            @"str_username"
#define kStrFullName            @"str_fullname"
#define kStrUserImage           @"str_userimage"
#define kStrEmail               @"str_email"
#define kStrBirth               @"str_birth"
#define kStrStripeToken         @"str_stripetoken"
#define kStrForLastFour         @"str_strforlastfour"

#define kBAddress               @"b_address"


#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)


typedef enum {
    Sort_Popular = 0,
    Sort_Viewed,
    Sort_Recent
}SortType;

typedef enum {
    Type_Unisex = 0,
    Type_Men,
    Type_Women
}Type_Gender;

typedef enum {
    Size_XS = 0,
    Size_S,
    Size_M,
    Size_L,
    Size_XL
}SizeType;

#endif
