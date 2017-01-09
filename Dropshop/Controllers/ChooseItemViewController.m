//
//  EventListViewController.m
//  Veux
//
//  Created by mac on 19/02/16.
//  Copyright © 2016 Desmond. All rights reserved.
//

#import "ChooseItemViewController.h"
#import "AppDelegate.h"
#import "AsyncImageView.h"
#import "ItemTableViewCell.h"
#import "CheckoutViewController.h"

static const int MAX_BUFFER_SIZE = 2; //%%% max number of cards loaded at any given time, must be greater than 1

@interface ChooseItemViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    int cardindex;
}

@property (nonatomic, strong) NSArray* arrImgName;
@end


// use arrImgName instead of eventSearchResult
@implementation ChooseItemViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    
    nSelIdx = 0;
    cardindex = 0;
    eventSearchResult = [[NSMutableArray alloc] init];
    [self getThemeList];
    _arrSelected = [[NSMutableArray alloc] init];
    _arrPaid = [[NSMutableArray alloc] init];
    
    _tblCard.delegate = self;
    _tblCard.dataSource = self;
    

}

- (void) viewDidAppear:(BOOL)animated {
    [_tblCard reloadData];
}

- (void) getThemeList {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    cardindex = 0;
    void (^successed)(id _responseObject) = ^(id _responseObject)
    {
        if ([_responseObject isEqual:nil])
        {
            [self showAlertTips:@"Connection Problem"];
            return ;
        }
        
        
        //Register in Success
        NSLog(@"%@",_responseObject);
        NSMutableArray* responseArray = (NSMutableArray*) _responseObject;
        int key = 0;
        for (NSMutableDictionary *responseDic in responseArray) {
//            if ([[[responseDic objectForKey:@"badges"] objectForKey:@"attachments"] intValue] > 0) {
                [self getAttachment: responseDic key:key];
//            }
            key++;
        }
        
        arrThemeData = [responseArray mutableCopy];
        
        eventImgArray = [[NSMutableArray alloc] init];
        
        allEvents = [[NSMutableArray alloc] init];
        loadedEvents = [[NSMutableArray alloc] init];
        
        
//        [self loadEvents];


        [MBProgressHUD hideHUDForView:self.view animated:YES];
    };
    void (^failure)(NSError *_error) = ^(NSError *_error)
    {
        //error
        [self showAlertTips:@"Internet Connection Error!"];
    };
    
    [[SocialManager sharedManager] GetThemes:nil
                                          successed:successed
                                            failure:failure];
}

- (void) getAttachment:(NSMutableDictionary*)cardid key:(int)key {
//    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    void (^successed)(id _responseObject) = ^(id _responseObject)
    {
        cardindex++;
        if ([_responseObject isEqual:nil])
        {
            [self showAlertTips:@"Connection Problem"];
            return ;
        }
        
        //Register in Success
        NSLog(@"%@",_responseObject);
        if ([_responseObject count] > 0) {
            NSMutableDictionary *dic = [_responseObject objectAtIndex:0];
            NSString *url = [dic objectForKey:@"url"];
            NSMutableDictionary *cardinfo = [cardid mutableCopy];
            [cardinfo setObject:url forKey:@"url"];
            [arrThemeData replaceObjectAtIndex:key withObject:cardinfo];

        }
        if (cardindex >= arrThemeData.count) {
            [self loadEvents];
            cardindex = 0;
        }
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    };
    void (^failure)(NSError *_error) = ^(NSError *_error)
    {
        //error
        [self showAlertTips:@"Internet Connection Error!"];
    };
    
    [[SocialManager sharedManager] GetAttachment:@"name,url"
                                   member_fields:@"fullname"
                                             key:@"b02ffe63117eb625ab2fc0d802c0f97a"
                                           token:@"db6507d11324f59fe4519ce716a81d37e200e54aed43c6a8819125bbb8336a4c"
                                          cardid:[cardid objectForKey:@"id"]
                                   successed:successed
                                     failure:failure];
}


-(DraggableView *)createDraggableViewWithDataAtIndex:(NSInteger)index
{
    DraggableView *draggableView = [[DraggableView alloc]initWithFrame:self.eventView.frame];
//    tempImg = [UIImage imageNamed:self.arrImgName[index]];
    draggableView.information.image = [UIImage imageNamed:@"loading"];
    
    NSMutableDictionary* resultDic = [arrThemeData objectAtIndex:(int)index];
    strThemeName = [resultDic objectForKey:@"name"];
    int theme_id = [[resultDic objectForKey:@"id"] intValue];
    strImageUrl = [resultDic objectForKey:@"url"];
    NSURL *urlImage = [NSURL URLWithString:strImageUrl];
    [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:draggableView.information.image];
    
    draggableView.information.imageURL = urlImage;

    
    draggableView.lblName.text = strThemeName;
//    draggableView.information.image = tempImg; //%%% placeholder for card-specific information
    draggableView.delegate = self;
    draggableView.backgroundColor = [UIColor clearColor];
    return draggableView;
}

-(void)loadEvents
{
    [allEvents removeAllObjects];
    [loadedEvents removeAllObjects];
    if([arrThemeData count] > 0) {
        NSInteger numLoadedCardsCap =(([arrThemeData count] > MAX_BUFFER_SIZE)?MAX_BUFFER_SIZE:[eventSearchResult count]);
        //%%% if the buffer size is greater than the data size, there will be an array error, so this makes sure that doesn't happen
        
        //%%% loops through the exampleCardsLabels array to create a card for each label.  This should be customized by removing "exampleCardLabels" with your own array of data
        for (int i = 0; i<[arrThemeData count]; i++) {
            DraggableView* newCard = [self createDraggableViewWithDataAtIndex:i];
            [allEvents addObject:newCard];
            
            if (i<numLoadedCardsCap) {
                //%%% adds a small number of cards to be loaded
                [loadedEvents addObject:newCard];
            }
        }
        
        //%%% displays the small number of loaded cards dictated by MAX_BUFFER_SIZE so that not all the cards
        // are showing at once and clogging a ton of data
        for (int i = 0; i<[loadedEvents count]; i++) {
            if (i>0) {
                [self.view insertSubview:[loadedEvents objectAtIndex:i] belowSubview:[loadedEvents objectAtIndex:i-1]];
            } else {
                [self.view addSubview:[loadedEvents objectAtIndex:i]];
            }
            nIdx++; //%%% we loaded a card into loaded cards, so we have to increment
        }
    }
}

-(void)cardSwipedLeft:(UIView *)card;
{
    //do whatever you want with the card that was swiped
    
    [loadedEvents removeObjectAtIndex:0]; //%%% card was swiped, so it's no longer a "loaded card"
    if (nIdx < [allEvents count] && [loadedEvents count] > 0) { //%%% if we haven't reached the end of all cards, put another into the loaded cards
        
        [loadedEvents addObject:[allEvents objectAtIndex:nIdx]];
        nIdx++;             //%%% loaded a card, so have to increment count
        [self.view insertSubview:[loadedEvents objectAtIndex:(MAX_BUFFER_SIZE-1)] belowSubview:[loadedEvents objectAtIndex:(MAX_BUFFER_SIZE-2)]];
    }
    [self setDislikeEvent];
}

-(void)cardSwipedRight:(UIView *)card
{
    //do whatever you want with the card that was swiped
  
    [loadedEvents removeObjectAtIndex:0]; //%%% card was swiped, so it's no longer a "loaded card"
    if (nIdx < [allEvents count] && [loadedEvents count] > 0) { //%%% if we haven't reached the end of all cards, put another into the loaded cards
        [loadedEvents addObject:[allEvents objectAtIndex:nIdx]];
        nIdx++;//%%% loaded a card, so have to increment count
        [self.view insertSubview:[loadedEvents objectAtIndex:(MAX_BUFFER_SIZE-1)] belowSubview:[loadedEvents objectAtIndex:(MAX_BUFFER_SIZE-2)]];
    }
    [self setLikeEvent];
}

-(void)swipeRight
{
    DraggableView *dragView = [loadedEvents firstObject];
    dragView.overlayView.mode = GGOverlayViewModeRight;
    [UIView animateWithDuration:0.8 animations:^{
        dragView.overlayView.alpha = 1;
    }];
    [dragView rightClickAction];
}

//%%% when you hit the left button, this is called and substitutes the swipe
-(void)swipeLeft
{
    DraggableView *dragView = [loadedEvents firstObject];
    dragView.overlayView.mode = GGOverlayViewModeLeft;
    [UIView animateWithDuration:0.8 animations:^{
        dragView.overlayView.alpha = 1;
    }];
    [dragView leftClickAction];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

-(AppDelegate*)appDelegate{
    return (AppDelegate*)[[UIApplication sharedApplication] delegate];
}

- (void) setDislikeEvent {
    //eventSearchResult, nSelIdx
    
    if (nSelIdx + 1 >= [arrThemeData count]) {
        [[[UIAlertView alloc] initWithTitle:@"Final theme!" message:@"This theme is the last one!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];

        return;
    } else {
        nSelIdx++;
    }
    strItemCount = [NSString stringWithFormat:@"%d of %d",nSelIdx+1, (int)arrThemeData.count];
    self.lblItemCount.text = strItemCount;
}

-(void)removeCart:(UIButton*)sender
{
    if (sender.tag >= 1000) {
        [_arrPaid removeObjectAtIndex:sender.tag - 1000];
    }
    else {
        [_arrSelected removeObjectAtIndex:sender.tag - 10];
    }
    
    [_tblCard reloadData];
}



- (IBAction)OnReload:(id)sender {
    for (DraggableView *loadedEvent in loadedEvents) {
        [loadedEvent removeFromSuperview];
    }
    
    nSelIdx = 0;
    nIdx = 0;
//    [self loadEvents];
//    [arrThemeData removeAllObjects];
    [self getThemeList];
    
//    [_tblCard reloadData];
}

- (IBAction)OnPay:(id)sender {
    CheckoutViewController* checkoutVC = [self.storyboard instantiateViewControllerWithIdentifier:@"CheckoutViewController"];
    checkoutVC.arrThemeData = arrThemeData;
    checkoutVC.arrSelected = _arrSelected;
    checkoutVC.arrPaid = _arrPaid;

    [self.navigationController pushViewController:checkoutVC animated:YES];
}

- (void) setLikeEvent {
    if (nSelIdx + 1 >= [arrThemeData count]) {
        [[[UIAlertView alloc] initWithTitle:@"Final theme!" message:@"This theme is the last one!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];

        [_arrSelected addObject:[NSNumber numberWithInt:nSelIdx]];
        [_tblCard reloadData];
        return;
    } else {
        [_arrSelected addObject:[NSNumber numberWithInt:nSelIdx]];
        nSelIdx++;
    }

    strItemCount = [NSString stringWithFormat:@"%d of %d",nSelIdx+1, (int)arrThemeData.count];
    self.lblItemCount.text = strItemCount;
    
    [_tblCard reloadData];
}

#pragma mark - UITableViewDelegate-
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return _arrSelected.count;
    }
    else {
        return _arrPaid.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *strTableIdentifier = @"ItemTableViewCell";
    ItemTableViewCell* cell = (ItemTableViewCell*) [tableView dequeueReusableCellWithIdentifier:strTableIdentifier];
    
    if (cell == nil) {
        cell = [[ItemTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strTableIdentifier];
    }
    int index;
    if (indexPath.section == 0) {
        index = [[_arrSelected objectAtIndex:indexPath.row] intValue];
        cell.btnDelete.tag = indexPath.row + 10;
    }
    else {
        index = [[_arrPaid objectAtIndex:indexPath.row] intValue];
        cell.btnDelete.tag = indexPath.row + 1000;
    }
    
    NSMutableDictionary *dic = [arrThemeData objectAtIndex:index];
    cell.lblTitle.text = [dic objectForKey:@"name"];
    
    NSString *strUrl = [dic objectForKey:@"url"];
    NSURL *urlImage = [NSURL URLWithString:strUrl];
    [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:cell.imgCard.image];
    if ([[[dic objectForKey:@"badges"] objectForKey:@"attachments"] intValue] == 0) {
        cell.imgCard.image = [UIImage imageNamed:@"loading.png"];
    }
    else {
        cell.imgCard.imageURL = urlImage;
    }
    
    [cell.btnDelete addTarget:self action:@selector(removeCart:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(1, 50, 276, 30)];
    headerView.backgroundColor = [UIColor colorWithRed:203/255.0f green:59/255.0f blue:230/255.0f alpha:1.0f];
    UILabel *labelView = [[UILabel alloc] initWithFrame:CGRectMake(14, 15, 276, 24)];
    
    if (section == 0) {
        labelView.text = @"Cart";
    }
    else {
        labelView.text = @"Paid items";
    }
    
    [headerView addSubview:labelView];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 60;
}

#pragma mark-AlertView
- (void)showAlertTips:(NSString *)_message
{
    UIAlertView *messageView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                          message:_message
                                                         delegate:self
                                                cancelButtonTitle:@"Ok"
                                                otherButtonTitles:nil, nil];
    messageView.tag = 1;
    [messageView show];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    int nIdxOK = (int)alertView.firstOtherButtonIndex;
    
    if (alertView.tag != 1) {
        if (buttonIndex == nIdxOK) {

        }
    }
}

@end
