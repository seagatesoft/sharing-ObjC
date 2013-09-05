//
//  netra.m
//  buildApps
//
//  Created by Arie on 9/4/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import "netra.h"

@implementation netra
@synthesize title;
@synthesize excerpt;
-(id) initWithDictionary:(NSDictionary *) dictionary
{
	self=[super init];
    
	if(self){
		
        self.title        =[dictionary objectForKey:@"title"];
		self.excerpt      =[dictionary objectForKey:@"excerpt"];
	}
	return self;
}

@end
