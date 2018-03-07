//
//  NSDictionary+HqOrderDic.m
//  HqX
//
//  Created by macpro on 2018/3/7.
//  Copyright © 2018年 macpro. All rights reserved.
//

#import "NSDictionary+HqOrderDic.h"
#import <objc/runtime.h>
void * khqAllkeys = "hqAllkeys";

@implementation NSMutableDictionary (HqOrderDic)
- (NSMutableArray *)hqAllkeys{
    
    return objc_getAssociatedObject(self, khqAllkeys);
}
- (void)setHqAllkeys:(NSMutableArray *)hqAllkeys{
    objc_setAssociatedObject(self, khqAllkeys, hqAllkeys, OBJC_ASSOCIATION_RETAIN);
}
- (void)hqSetOjectValue:(id)value forKey:(NSString *)key{
    if (self.hqAllkeys==nil) {
        self.hqAllkeys = [[NSMutableArray alloc] initWithCapacity:0];
    }
    [self.hqAllkeys addObject:key];
    [self setObject:value  forKey:key];
}

- (id)hqGetValueWithIndex:(NSInteger)index{
    NSString *key = self.hqAllkeys[index];
    return [self objectForKey:key];
}

@end
