//
//  ViewController.m
//  MemoryManagement
//
//  Created by Paul Solt on 1/29/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "ViewController.h"
#import "Car.h"
#import "Person.h"
#import "LSILog.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // TODO: Disable ARC in settings
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    for (NSInteger index = 0; index < 10; index += 1) {
        NSMutableString *string = [[NSMutableString alloc] initWithString:@"Starting Value"];
        
        [array addObject:string];
        
        [string release];
    }
    
    NSMutableString *firstString = [array objectAtIndex:0];
    [firstString retain];
    
    [array release];
    
    NSLog(@"%@", firstString);
    [firstString release];
    
//    CFArrayRef arrayRefference = (CFArrayRef)array;
//    CFRelease(arrayRefference);
    
    // Exampe with Core Foundation types (same thing with Quartz and "C" API's)
    CFArrayRef arrayRef = CFArrayCreate(NULL, NULL, 0, NULL);
    CFRelease(arrayRef);
    
    NSMutableString *make = [[NSMutableString alloc] initWithString:@"Civic Si"];
    
    Person *me = [[Person alloc] init];
    Car *honda = [[Car alloc] initWithMake:@"Civic Si"];
    me.car = honda;
    
    [honda release];
    
    [make replaceOccurrencesOfString:@"Si" withString:@"Sport" options:0 range:NSMakeRange(0, make.length)];
    [me release];
    
    [make release];
}


@end
