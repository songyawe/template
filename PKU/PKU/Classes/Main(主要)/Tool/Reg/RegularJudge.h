//
//  RegularJudge.h
//  ChoiskycnApp
//
//  Created by mac on 14-9-24.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegularJudge : NSObject
/**
 *  邮箱
 *
 *  @param email 邮箱
 *
 *  @return BOOL
 */
+(BOOL)validateEmail:(NSString *)email;

/**
 *  手机号码验证
 *
 *  @param mobile 手机号码验证
 *
 *  @return BOOL
 */
+(BOOL)validateMobile:(NSString *)mobile;

/**
 *  用户名
 *
 *  @param name 用户名
 *
 *  @return BOOL
 */
+(BOOL)validateUserName:(NSString *)name;

/**
 *  车牌号验证
 *
 *  @param carNo 车牌号验证
 *
 *  @return BOOL
 */
+ (BOOL) validateCarNo:(NSString *)carNo;

/**
 *  车型
 *
 *  @param CarType 车型
 *
 *  @return BOOL
 */
+ (BOOL) validateCarType:(NSString *)CarType;

/**
 *  密码
 *
 *  @param passWord 密码
 *
 *  @return BOOL
 */
+ (BOOL) validatePassword:(NSString *)passWord;

/**
 *  昵称
 *
 *  @param nickname 昵称
 *
 *  @return BOOL
 */
+ (BOOL) validateNickname:(NSString *)nickname;

/**
 *  身份证号
 *
 *  @param identityCard 身份证号
 *
 *  @return BOOL
 */
+ (BOOL) validateIdentityCard: (NSString *)identityCard;
+(BOOL)isQQ:(NSString *)qq;
@end
