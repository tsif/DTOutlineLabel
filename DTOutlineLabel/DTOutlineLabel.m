/*
 *
 * DTOutlineLabel.m
 *
 */


#import <QuartzCore/QuartzCore.h>

#import "DTOutlineLabel.h"

@interface DTOutlineLabel () {

    UIColor *_outlineColour;
    CGFloat _outlineWidth;
    
    CGFloat _xOffset;
    CGFloat _yOffset;
}

@end

@implementation DTOutlineLabel

@synthesize outlineColour = _outlineColour;
@synthesize outlineWidth  = _outlineWidth;

@synthesize xOffset       = _xOffset;
@synthesize yOffset       = _yOffset;

#pragma mark - LIFECYCLE

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        _outlineColour = [[UIColor darkGrayColor] retain];
        _outlineWidth  = 3.0f;
        
        _xOffset       = 0.0f;
        _yOffset       = 0.0f;
    }
    return self;
}

- (void) awakeFromNib {
    
    _outlineColour = [[UIColor darkGrayColor] retain];
    _outlineWidth  = 3.0f;
    
    _xOffset       = 0.0f;
    _yOffset       = 0.0f;
    
    [super awakeFromNib];
}

#pragma mark - CLEANUP CREW

- (void)dealloc {
    
#if __has_feature(objc_arc)
#else
    self.outlineColour = nil;
   [super dealloc];
#endif
    
}

