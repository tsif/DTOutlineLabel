/*
 *
 * DTOutlineLabel.h
 *
 */


#import <UIKit/UIKit.h>

@interface DTOutlineLabel : UILabel {
    
}

@property(nonatomic, strong) UIColor* outlineColour;
@property(nonatomic)         CGFloat  outlineWidth;

@property(nonatomic)         CGFloat  xOffset;
@property(nonatomic)         CGFloat  yOffset;

@end
