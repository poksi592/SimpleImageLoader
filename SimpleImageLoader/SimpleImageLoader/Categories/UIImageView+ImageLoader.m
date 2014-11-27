//
//  UIImageView+ImageLoader.m
//  SimpleImageLoader
//
//  Created by Mladen Despotovic on 26/11/14.
//  Copyright (c) 2014 Mladen Despotovic. All rights reserved.
//

#import "UIImageView+ImageLoader.h"
#import "UIImage+Extensions.h"
#import <objc/runtime.h>


static NSInteger activityCount = 0;
static NSString * const AddedTaskKey = @"taskKey";

@implementation UIImageView (ImageLoader)

- (void)setImageWithURLString:(NSString*)paramURLString
             placeholderImage:(UIImage*)paramImage
              completionBlock:(void (^)(NSError *paramError))paramBlock
{
    self.image = paramImage;
    
    NSURLSession *simpleSession = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:paramURLString];
    NSURLRequest *requestURL = [NSURLRequest requestWithURL:url];
    NSCachedURLResponse *cachedResponse = [[NSURLCache sharedURLCache] cachedResponseForRequest:requestURL];
    
    
    NSURLSessionDataTask *currentDataTask = [self addedDataTask];
    [currentDataTask cancel];
    objc_setAssociatedObject(self, &AddedTaskKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    if (cachedResponse) {
        
        self.image = [[UIImage imageWithData:cachedResponse.data] scaleToSizeOfView:self];
        [self setNeedsLayout];
    }
    else {
        
        __weak typeof (self) weakSelf = self;
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        activityCount++;
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0), ^{
            
            NSURLSessionDataTask *dataTask = nil;

            dataTask = [simpleSession dataTaskWithRequest:requestURL
                          completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                              
                              if (!error) {
                                  
                                  NSCachedURLResponse *cachedResponse = [[NSCachedURLResponse alloc] initWithResponse:response data:data];
                                  [[NSURLCache sharedURLCache] storeCachedResponse:cachedResponse forRequest:requestURL];
                                  
                                  dispatch_async(dispatch_get_main_queue(), ^{
                                      
                                      __strong UIImageView *strongSelf = weakSelf;
                                      strongSelf.image = [[UIImage imageWithData:data] scaleToSizeOfView:strongSelf];
                                      [strongSelf setNeedsLayout];
                                      activityCount--;
                                      if (activityCount == 0) {
                                          
                                          [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                                      }
                                  });
                              }
                              
                              if (paramBlock) {
                                  
                                  paramBlock (error);
                              }
                              
                          }];
            
            objc_setAssociatedObject(self, &AddedTaskKey, dataTask, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            [dataTask resume];
            
        });
        
    }

}

- (id)addedDataTask
{
    return objc_getAssociatedObject(self, &AddedTaskKey);
}


@end




