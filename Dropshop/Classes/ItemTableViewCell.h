//
//  ItemTableViewCell.h
//  Dropshop
//
//  Created by scs on 1/6/17.
//  Copyright © 2017 Robert. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *imgCard;
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) IBOutlet UIButton *btnDelete;
@end
