//
//  NSMutableData+Host2Network.h
//  BigAndLittleEndian
//
//  Created by Snow Wu on 1/28/16.
//  Copyright © 2016 Snow Wu. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface NSMutableData (Host2Network)

- (void)sw_appendInt64:(long long)value;
- (void)sw_appendInt32:(int)value;
- (void)sw_appendInt16:(short)value;
- (void)sw_appendInt8:(char)value;
- (void)sw_appendString:(NSString *)string;

@end
NS_ASSUME_NONNULL_END