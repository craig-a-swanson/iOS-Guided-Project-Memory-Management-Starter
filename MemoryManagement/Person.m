//
//  Person.m
//  iOS9-MemoryManagement
//
//  Created by Paul Solt on 11/13/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

#import "Person.h"
#import "Car.h"
#import "LSILog.h"

@implementation Person

- (instancetype)initWithCar:(Car *)car
{
    self = [super init];
    if (self) {
        NSLog(@"-[Person init]: %@", _car);
        // TODO: Implement initWithCar with MRC
        _car = [car retain];
    }
    return self;
}

- (void)dealloc
{
    // TODO: Implement dealloc with MRC (order is important)

    NSLog(@"-[Person dealloc]: %@", _car);
    [_car release];
    [super dealloc];
}

// TODO: Implement setCar with MRC
- (void)setCar:(Car *)car
{
    // not the best option
//    [_car release];
//    _car = [car retain];
    
    // Better alternative
    [car retain];
    [_car release];
    _car = car;
    
    // another decent alternative
//    if (_car != car) {
//        [_car release];
//        _car = car;
//    }
}

/*
 // Is the object autoreleased? Why?
 NSString *name = [NSString stringWithFormat:@"%@ %@", @"John", @"Miller"];
 YES (auto-released)
 
 NSDate *today = [NSDate date];
 YES
 
 NSDate *now = [NSDate new];
 NO (not auto-released)
 
 NSDate *tomorrow2 = [NSDate dateWithTimeIntervalSinceNow:60*60*24];
 YES
 
 NSDate *nextTomorrow = [tomorrow2 copy]; // retain: 1
 NO
 
 NSArray *words = [@"This sentence is the bomb" componentsSeparatedByString:@" "];
 YES
 
 NSString *idea = [[NSString alloc] initWithString:@"Hello Ideas"];
 NO
 
 Car *redCar = [Car car];
 YES
 
 NSString *idea2 = [[[NSString alloc] initWithString:@"Hello Ideas"] autorelease];
 YES
 
 NSString *idea3 = [[NSString alloc] initWithString:@"Hello Ideas"];
 NO
 [idea3 autorelease];
 YES
 
 */

@end
