//
//  RCIMWrapperMainThreadPoster.h
//  im_interface_wrapper_flutter
//
//  Created by RongCloud on 2022/5/9.
//

#ifndef RCIMWrapperMainThreadPoster_h
#define RCIMWrapperMainThreadPoster_h

#import <Foundation/Foundation.h>

#ifdef __cplusplus
extern "C" {
#endif

void dispatch_to_main_queue(dispatch_block_t block);

#ifdef __cplusplus
}
#endif

#endif /* RCIMWrapperMainThreadPoster_h */
