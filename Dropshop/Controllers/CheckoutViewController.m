//
//  CheckoutViewController.m
//  Dropshop
//
//  Created by scs on 1/6/17.
//  Copyright © 2017 Robert. All rights reserved.
//

#import "CheckoutViewController.h"
#import "ItemTableViewCell.h"
#import "AsyncImageView.h"

@interface CheckoutViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation CheckoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tblCard.delegate = self;
    _tblCard.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate-

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _arrSelected.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *strTableIdentifier = @"ItemTableViewCell";
    ItemTableViewCell* cell = (ItemTableViewCell*) [tableView dequeueReusableCellWithIdentifier:strTableIdentifier];
    
    if (cell == nil) {
        cell = [[ItemTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strTableIdentifier];
    }
    int index = [[_arrSelected objectAtIndex:indexPath.row] intValue];
    NSMutableDictionary *dic = [_arrThemeData objectAtIndex:index];
    cell.lblTitle.text = [dic objectForKey:@"name"];
    
    [cell.btnDelete addTarget:self action:@selector(removeCart:) forControlEvents:UIControlEventTouchUpInside];
    cell.btnDelete.tag = indexPath.row + 10;
    
    NSString *strUrl = [dic objectForKey:@"url"];
    NSURL *urlImage = [NSURL URLWithString:strUrl];
    [[AsyncImageLoader sharedLoader] cancelLoadingImagesForTarget:cell.imgCard.image];
    
    if ([[[dic objectForKey:@"badges"] objectForKey:@"attachments"] intValue] == 0) {
        cell.imgCard.image = [UIImage imageNamed:@"loading.png"];
    }
    else {
        cell.imgCard.imageURL = urlImage;
    }
    
    return cell;
    
}

-(void)removeCart:(UIButton*)sender
{
    [_arrSelected removeObjectAtIndex:sender.tag - 10];
    [_tblCard reloadData];
}

- (IBAction)OnBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)OnReload:(id)sender {
}

- (IBAction)OnPay:(id)sender {
    [_arrPaid addObjectsFromArray: [_arrSelected mutableCopy]];
    [_arrSelected removeAllObjects];
    [_tblCard reloadData];
}
@end
