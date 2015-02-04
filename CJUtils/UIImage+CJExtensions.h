@interface UIImage (CJExtensions)
// Resize extensions
// Source: http://vocaro.com/trevor/blog/2009/10/12/resize-a-uiimage-the-right-way/
- (UIImage *)croppedImage:(CGRect)bounds;
- (UIImage *)resizedImage:(CGSize)newSize
     interpolationQuality:(CGInterpolationQuality)quality;
- (UIImage *)resizedImageWithContentMode:(UIViewContentMode)contentMode
                                  bounds:(CGSize)bounds
                    interpolationQuality:(CGInterpolationQuality)quality;
@end
