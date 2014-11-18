//
//  NumberPad.m
//  Converter
//
//  Created by Alexander Vogel on 18.11.14.
//  Copyright (c) 2014 it-agile GmbH. All rights reserved.
//

#import "NumberPad.h"

@interface NumberPad ()
@property (nonatomic, copy) NSString *currentValue;
@end

@implementation NumberPad

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
