//
//  HSection.m
//  chartee
//
//  Created by Tcy vinech on 12-8-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "HSection.h"

@implementation HSection

@synthesize hidden;
@synthesize isInitialized;
@synthesize paging; 
@synthesize selectedIndex;
@synthesize frame;
@synthesize paddingLeft;
@synthesize paddingRight;
@synthesize paddingTop;
@synthesize paddingBottom;
@synthesize padding;
@synthesize series;
@synthesize yAxises;
@synthesize xAxises;

-(void)addYAxis:(int)pos{
    HYAxis *yaix = [[HYAxis alloc] init];
	yaix.pos = pos;
	[self.yAxises addObject:yaix];
}

-(void)removeYAxis:(int)index{
    [self.yAxises removeObjectAtIndex:index];
}

-(void)addYAxises:(int)num at:(int)pos{
    
}

-(void)removeYAxises{
    [self.yAxises removeAllObjects];
}

-(void)initYAxises{
    for(int i=0;i<[self.yAxises count];i++){
	    [[self.yAxises objectAtIndex:i] setIsUsed:NO];
	}
}

-(void)nextPage{
	if(self.selectedIndex < [self.series count] - 1){
		self.selectedIndex++;
	}else{
		self.selectedIndex = 0;
	}
	[self initYAxises];
}

- (id)init{
	self = [super init];
    if (self) {
		self.hidden          = NO;
		self.isInitialized   = NO;
		self.paging          = NO;
		self.selectedIndex   = 0;
		self.paddingLeft     = 60;
		self.paddingRight    = 0;
		self.paddingTop      = 20;
		self.paddingBottom   = 0;
		self.padding         = nil;
		NSMutableArray *sers = [[NSMutableArray alloc] init];
		self.series          = sers; 
		NSMutableArray *yas = [[NSMutableArray alloc] init];
		self.yAxises        = yas; 
		NSMutableArray *xas = [[NSMutableArray alloc] init];
		self.xAxises        = xas; 
        
        
    }
	return self;
}


@end
