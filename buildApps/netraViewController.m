//
//  netraViewController.m
//  buildApps
//
//  Created by Arie on 8/28/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import "netraViewController.h"
#import "netra.h"
@interface netraViewController ()

@end

@implementation netraViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		self.view.backgroundColor=[UIColor whiteColor];
		self.title =@"tableView";
		main_tableview =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height-44)];
		main_tableview.delegate=self;
		main_tableview.dataSource=self;
		[self.view addSubview:main_tableview];
		
		netra_array=[[NSMutableArray alloc]init];
		
		[self fetchData];
	}
	return self;
}
- (void)viewDidLoad
{

    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
-(void)fetchData{
		NSString *baseUrl=[NSString stringWithFormat:@"http://www.wego.co.id/berita/v1/api/get_recent_posts/"];
	
	NSURL *URL=[NSURL URLWithString:baseUrl];
	
	AFHTTPClient * httpClient = [[AFHTTPClient alloc] initWithBaseURL:URL];
	
	NSMutableURLRequest * request = [httpClient requestWithMethod:@"GET" path:baseUrl parameters:nil];
    [httpClient registerHTTPOperationClass:[AFJSONRequestOperation class]];
	
    AFJSONRequestOperation *operation=[[AFJSONRequestOperation alloc] initWithRequest:request];
	
    //AFHTTPRequestOperation * operation =[[AFHTTPRequestOperation alloc] initWithRequest:request];
	[operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
		
		///////
		NSLog(@"responseObject->%@",responseObject);
		for(id netraDictionary in [responseObject objectForKey:@"posts"]){
			
			netra *jsonData=[[netra alloc] initWithDictionary:netraDictionary];
			
			if (![netra_array containsObject:jsonData]) {
                [netra_array addObject:jsonData];
				
            }
			[main_tableview reloadData];
		}
		////////
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
	}];
    
	[operation start];

}
///tableview

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView  :(NSInteger)section
{
	
    return netra_array.count;
	
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	
	 netra *kacrut=[netra_array objectAtIndex:indexPath.row];
	
	UITableViewCell *Cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"vanbungkring"];
	if (Cell == nil)
	{
		Cell= [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
		//cell=[[[NetraCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier ]autorelease];
	}
	Cell.textLabel.text=kacrut.title;
	return Cell;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
