//
//  NSMutableData+Host2Network.m
//  BigAndLittleEndian
//
//  Created by Snow Wu on 1/28/16.
//  Copyright © 2016 Snow Wu. All rights reserved.
//

#import "NSMutableData+Host2Network.h"

NS_ASSUME_NONNULL_BEGIN
@implementation NSMutableData (Host2Network)

- (void)sw_appendInt64:(long long)value
{
    value = htonll(value);
    [self appendBytes:&value length:8];
}

- (void)sw_appendInt32:(int)value
{
    value = htonl(value);
    [self appendBytes:&value length:4];
}

- (void)sw_appendInt16:(short)value
{
    value = htons(value);
    [self appendBytes:&value length:2];
}

- (void)sw_appendInt8:(char)value
{
    [self appendBytes:&value length:1];
}

- (void)sw_appendString:(NSString *)string
{
    const char *cString = [string UTF8String];
    [self appendBytes:cString length:strlen(cString) + 1];
}
@end
NS_ASSUME_NONNULL_END