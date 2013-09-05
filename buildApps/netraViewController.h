//
//  netraViewController.h
//  buildApps
//
//  Created by Arie on 8/28/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface netraViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
	UITableView *main_tableview;
	NSMutableArray *netra_array;
}

@end
