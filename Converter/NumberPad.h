//
//  NumberPad.h
//  Converter
//
//  Created by Alexander Vogel on 18.11.14.
//  Copyright (c) 2014 it-agile GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NumberPad : NSObject

@property (nonatomic, readonly) NSString *currentValue;

- (void)buttonTouched:(id)sender;
- (BOOL)hasStartingZero;
@end
