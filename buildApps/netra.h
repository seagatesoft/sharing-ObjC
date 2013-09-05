//
//  netra.h
//  buildApps
//
//  Created by Arie on 9/4/13.
//  Copyright (c) 2013 netra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface netra : NSObject

@property(nonatomic,strong) NSString * title;
@property(nonatomic,strong) NSString * excerpt;


-(id)initWithDictionary:(NSDictionary *)dictionary;
@end
