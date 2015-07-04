//
//  DataModel.h
//  Calculator
//
//  Created by intent on 21/06/15.
//  Copyright (c) 2015 almakaev iliyas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject

@property (strong, nonatomic) NSDictionary *components;

@property (readonly, nonatomic) NSArray *mkComponents;
@property (readonly, nonatomic) NSArray *sectionComponents;
@property (readonly, nonatomic) NSArray *dimensionsComponents;
@property (readonly, nonatomic) NSArray *sectionComponentsForMk;
@property (readonly, nonatomic) NSArray *dimensionsComponentsForSection;
@property (readonly, nonatomic) NSArray *weightForDimensions;

+(DataModel *)sharedInstance;

@end
