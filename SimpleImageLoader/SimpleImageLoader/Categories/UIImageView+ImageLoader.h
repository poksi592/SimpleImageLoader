//
//  UIImageView+ImageLoader.h
//  SimpleImageLoader
//
//  Created by Mladen Despotovic on 26/11/14.
//  Copyright (c) 2014 Mladen Despotovic. All rights reserved.
//


@interface UIImageView (ImageLoader)

- (void)setImageWithURLString:(NSString*)paramURLString
             placeholderImage:(UIImage*)paramImage
              completionBlock:(void (^)(NSError *paramError))paramBlock;

@end
