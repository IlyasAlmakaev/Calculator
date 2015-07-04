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
@property NSInteger *indexMk;
@property NSInteger *indexSection;

@property (readonly, nonatomic) NSArray *mkComponents;
@property (readonly, nonatomic) NSArray *sectionComponents;
@property (readonly, nonatomic) NSArray *dimensionsComponents;
@property (readonly, nonatomic) NSArray *dimensionsComponentsForSection;
@property (readonly, nonatomic) NSArray *weightForDimensions;

+(DataModel *)sharedInstance;
- (NSArray *) sectionComponentsForMk: (int)mkComponent;
- (NSArray *) dimensionsComponentsForSection: (int)sectionComponent;

@end
