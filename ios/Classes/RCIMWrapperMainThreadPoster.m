//
//  RCIMWrapperMainThreadPoster.m
//  im_interface_wrapper_flutter
//
//  Created by RongCloud on 2022/5/9.
//

#import "RCIMWrapperMainThreadPoster.h"

void dispatch_to_main_queue(dispatch_block_t block) {
  if ([[NSThread currentThread] isMainThread]) {
    block();
  } else {
    dispatch_async(dispatch_get_main_queue(), ^{
      block();
    });
  }
}
