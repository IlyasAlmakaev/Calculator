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

- (NSArray *) sectionComponentsForMk: (int)mkComponent
{
  //  if ([[self.components objectForKey:@"mkComponent"] objectAtIndex:0])
        self.indexMaterial = mkComponent;
    NSLog(@"%i", self.indexMaterial);
        return [[self.components objectForKey:@"sectionComponent"] objectAtIndex:mkComponent];
}

- (NSArray *) dimensionsComponentsForSection: (int)sectionComponent
{
    int count;
      if ((self.indexMaterial == 0) && (sectionComponent == 0))
      {
          count = 0;
      }
      else if ((self.indexMaterial == 0) && (sectionComponent == 1))
      {
          count = 1;
      }
    return [[self.components objectForKey:@"dimensionsComponent"] objectAtIndex:count];
}

- (NSArray *) weightForDimensions
{
    //  if ([[self.components objectForKey:@"mkComponent"] objectAtIndex:0])
    
    return [[self.components objectForKey:@"weight"] objectAtIndex:0];
}


@end



