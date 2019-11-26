//
//  CProtocol.h
//  DemoZuJianHua
//
//  Created by hrt03 on 2019/11/26.
//  Copyright © 2019 chao jie deng. All rights reserved.
//

#ifndef CProtocol_h
#define CProtocol_h


@protocol CProtocol <NSObject>

- (void)gotoCAimControllerWithName:(NSString *)name callBack:(void (^)(void))callBack;

@end

#endif /* CProtocol_h */
