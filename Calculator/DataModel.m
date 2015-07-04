//
//  DataModel.m
//  Calculator
//
//  Created by intent on 21/06/15.
//  Copyright (c) 2015 almakaev iliyas. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel

- (id)init
{
    self = [super init];
    if (self)
    {
        self.components = [[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Components" ofType:@"plist"]];
    }
    return self;
}

+ (DataModel *)sharedInstance
{
    static DataModel *instance = nil;
    if (instance == nil)
    {
        instance = [[DataModel alloc] init];
    }
    return instance;
}

- (NSArray *) mkComponents
{
    return [self.components objectForKey:@"mkComponent"];
}

- (NSArray *) sectionComponents
{
    return [self.components objectForKey:@"sectionComponent"];
}

- (NSArray *) dimensionsComponents
{
    return [self.components objectForKey:@"dimensionsComponent"];
}

- (NSArray *) sectionComponentsForMk
{
  //  if ([[self.components objectForKey:@"mkComponent"] objectAtIndex:0])
    
        return [[self.components objectForKey:@"sectionComponent"] objectAtIndex:0];
}

- (NSArray *) dimensionsComponentsForSection
{
    //  if ([[self.components objectForKey:@"mkComponent"] objectAtIndex:0])
    
    return [[self.components objectForKey:@"dimensionsComponent"] objectAtIndex:0];
}

- (NSArray *) weightForDimensions
{
    //  if ([[self.components objectForKey:@"mkComponent"] objectAtIndex:0])
    
    return [[self.components objectForKey:@"weight"] objectAtIndex:0];
}


@end



