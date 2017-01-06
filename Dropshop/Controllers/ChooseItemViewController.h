//
//  EventListViewController.h
//  Veux
//
//  Created by mac on 19/02/16.
//  Copyright © 2016 Jonas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DraggableView.h"

@interface ChooseItemViewController : UIViewController<DraggableViewDelegate> {
    NSMutableArray* eventSearchResult;
    NSMutableArray* arrThemeData;
    
    int nSelIdx;
    int nIdx;
    UIImage* tempImg;
    NSDate* currentDate;
    
    NSString* strItemCount;
    
    NSMutableArray* eventImgArray;

    NSMutableArray* allEvents;
    NSMutableArray *loadedEvents; //%%% the array of card loaded (change max_buffer_size to increase or decrease the number of cards this holds)
    
    int nDislikedIdx;
    
    NSString* strThemeId;
    NSString* strThemeName;
    NSString* strDescription;
    NSString* strImageUrl;
    
}

@property (strong, nonatomic) IBOutlet DraggableView *eventView;
@property (weak, nonatomic) IBOutlet UILabel *lblItemCount;
@property (strong, nonatomic) IBOutlet UITableView *tblCard;
@property (strong, nonatomic) IBOutlet NSMutableArray *arrSelected;
@property (strong, nonatomic) IBOutlet NSMutableArray *arrPaid;

- (IBAction)OnReload:(id)sender;
- (IBAction)OnPay:(id)sender;

@end
