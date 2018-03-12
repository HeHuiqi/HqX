//
//  NSDictionary+HqOrderDic.h
//  HqX
//
//  Created by macpro on 2018/3/7.
//  Copyright © 2018年 macpro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (HqOrderDic)

@property (nonatomic,strong) NSMutableArray *hqAllkeys;

- (void)hqSetObjectValue:(id)value forKey:(NSString *)key;
- (id)hqGetValueWithIndex:(NSInteger)index;
@end
