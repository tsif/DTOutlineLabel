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

#pragma mark - DRAWING

- (void)drawTextInRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();  
    
    CGContextSaveGState(context);
    CGContextSetTextDrawingMode(context, kCGTextFillStroke);
    
    /* draw sans outline */
    [super drawTextInRect:rect];
    
    CGImageRef image = CGBitmapContextCreateImage(context);
    
    CGContextSetLineWidth(context, _outlineWidth);
    CGContextSetLineJoin(context, kCGLineJoinBevel);
    CGContextSetTextDrawingMode(context, kCGTextStroke);
    
    /* color */
    self.textColor = _outlineColour;
    
    /* having these offsets makes for some interesting effects */
    [super drawTextInRect:CGRectMake(rect.origin.x + _xOffset, rect.origin.y + _yOffset, rect.size.width, rect.size.height)];
    
    // Draw image on top of the outline
    CGContextTranslateCTM(context, 0.0f, rect.size.height);
    CGContextScaleCTM(context, 1.0f, -1.0f);
    CGContextDrawImage(context, rect, image);
    
    CGImageRelease(image);
    
    return;
}

#pragma mark - CLEANUP CREW

- (void)dealloc {
    
#if __has_feature(objc_arc)
#else
    self.outlineColour = nil;
   [super dealloc];
#endif
    
}

