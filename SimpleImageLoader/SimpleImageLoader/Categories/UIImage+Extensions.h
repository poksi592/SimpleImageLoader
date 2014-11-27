//
//  UIImage+Extensions.h
//  SimpleImageLoader
//
//  Created by Mladen Despotovic on 26/11/14.
//  Copyright (c) 2014 Mladen Despotovic. All rights reserved.
//


@interface UIImage (Extensions)

- (UIImage*)scaleToSizeOfView:(UIView*)paramView;

- (UIImage*)scaleToSize:(CGSize)newSize;

@end
