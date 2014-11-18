//
//  NumberPad.m
//  Converter
//
//  Created by Alexander Vogel on 18.11.14.
//  Copyright (c) 2014 it-agile GmbH. All rights reserved.
//

#import "NumberPad.h"

@interface NumberPad ()
@property (nonatomic) NSString *currentValue;
@end

@implementation NumberPad

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.currentValue = @"";
    }
    return self;
}

- (void)buttonTouched:(id)sender{
   // self.currentValue = [NSString stringWithFormat:@"%ld", (long)[sender tag]];
    NSLog(@"'%@' + '%ld'", self.currentValue, (long)[sender tag]);
    
    if(self.currentValue.length < 10 && ![self hasStartingZero]){
        NSMutableString *tmp = [[NSMutableString alloc] init];
        
        if(self.currentValue)
            [tmp appendString:self.currentValue];
        
        [tmp appendString:[NSString stringWithFormat:@"%ld", (long)[sender tag]]];
        
        self.currentValue = tmp;
    }
    NSLog(@"->'%@'", self.currentValue);
}
- (BOOL)hasStartingZero{
    return (self.currentValue != nil && [self.currentValue hasPrefix:@"0"]);
}
@end
