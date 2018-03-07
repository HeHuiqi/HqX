//
//  HqUser.h
//  HqX
//
//  Created by macpro on 2018/3/6.
//  Copyright © 2018年 macpro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HqUser : NSObject

@property (nonatomic,copy) NSString *idNum;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *nickname;
@property (nonatomic,assign) int age;
@property (nonatomic,assign) int height;
@property (nonatomic,copy) NSString *degree;
@property (nonatomic,copy) NSString *address;
@property (nonatomic,copy) NSString *mobile;


@end
