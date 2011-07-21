/* 

Cheatsheet for objective c code.

*/

#import "SomeFile.h"

#pragma mark -
#pragma mark === Constants ===
#pragma mark

#define kSomeConstant  30

// iPhone dimensions
#define kIPhoneWidth 320
#define kIPhoneHeight 480

#define kIPadWidth 640
#define kIPadHeight 960

#define kStatusBarHeight 20
#define kTopNavHeight 44
#define kTabBarHeight 49

#pragma mark -
#pragma mark === Static methods ===
#pragma mark

static void staticMethod(int someInt) {

}

#pragma mark -
#pragma mark === Contructors ===
#pragma mark

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
    }

    return self;
}

- (id)initWithInteger:(int)i
{
    self = [super init];
    if (self) {
        [self setInteger:i];
    }
    
    return self;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark -
#pragma mark === Decontructors ===
#pragma mark

- (void)dealloc
{
    [something release];
    [super dealloc];
}

#pragma mark -
#pragma mark === Setter/Getter methods ===
#pragma mark

- (SomeClass *)instanceName {
    if (!instanceName) {
        instanceName = [[SomeClass alloc] init];
    }
    
    return instanceName;
}

#pragma mark -
#pragma mark === Class definition ===
#pragma mark

// Interface
@interface SomeClass : ParentClass <ProtocolClass> {
    UIView *view;
    UILabel *label;
    
@private
    NSString *privateString;
}

- (void)someMethod;
- (NSString *)description; // String representation of the object (toString method)
+ (void)classMethod;

// To connect in interface builder
@property (nonatomic, retain) IBOutlet UIView *view;
// Normal property
@property (nonatomic, retain) UILabel *label;

@end



// Private interface
@interface SomeClass()

- (NSString *)someMethod;

@end

// Implementation
@implementation SomeClass

@synthesize view, label;

- (void)someMethod {
    // Implementation
}

@end

// Check class type of an instance
[myObject class] == [MyClass class];
[myObject isKindOfClass:[AnObject class]];

#pragma mark -
#pragma mark === UINavigation ===
#pragma mark

UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editButtonPress)];
self.navigationItem.rightBarButtonItem = editButton;
[editButton release];

UIBarButtonItem
– initWithBarButtonSystemItem:target:action:
– initWithCustomView:
– initWithImage:style:target:action:
– initWithTitle:style:target:action:

typedef enum {
   UIBarButtonSystemItemDone,
   UIBarButtonSystemItemCancel,
   UIBarButtonSystemItemEdit,
   UIBarButtonSystemItemSave,
   UIBarButtonSystemItemAdd,
   UIBarButtonSystemItemFlexibleSpace,
   UIBarButtonSystemItemFixedSpace,
   UIBarButtonSystemItemCompose,
   UIBarButtonSystemItemReply,
   UIBarButtonSystemItemAction,
   UIBarButtonSystemItemOrganize,
   UIBarButtonSystemItemBookmarks,
   UIBarButtonSystemItemSearch,
   UIBarButtonSystemItemRefresh,
   UIBarButtonSystemItemStop,
   UIBarButtonSystemItemCamera,
   UIBarButtonSystemItemTrash,
   UIBarButtonSystemItemPlay,
   UIBarButtonSystemItemPause,
   UIBarButtonSystemItemRewind,
   UIBarButtonSystemItemFastForward,
   UIBarButtonSystemItemUndo,        // iOS 3.0 and later
   UIBarButtonSystemItemRedo,        // iOS 3.0 and later
   UIBarButtonSystemItemPageCurl,    // iOS 4.0 and later
} UIBarButtonSystemItem;


// UIViewController: Add toolbar items
- (void)configureToolbarItems
{
    UIBarButtonItem *flexibleSpaceButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    // Info button
    UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
    [infoButton addTarget:self action:@selector(showInfo) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *infoButtonItem = [[UIBarButtonItem alloc] initWithCustomView:infoButton];

    // Set our toolbar items
    self.toolbarItems = [NSArray arrayWithObjects:flexibleSpaceButtonItem, infoButtonItem, nil];
    
    [infoButtonItem release];
    [flexibleSpaceButtonItem release];    
    
    // Show toolbar animated
    [self.navigationController setToolbarHidden:NO animated:YES];
}

#pragma mark -
#pragma mark === UILabel ===
#pragma mark

int i = 4;
UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
label.text = [NSString stringWithFormat:@"%d", i];
[superView addSubview:label];

#pragma mark -
#pragma mark === UIImage ===
#pragma mark

UIImage *image = [UIImage imageNamed:@"image.jpg"];

NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://www.something.com/image.jpg"]]; 
UIImage *imageFromData = [UIImage imageWithData:imageData];

#pragma mark -
#pragma mark === NSArray/NSMutableArray ===
#pragma mark

// Autoreleased
NSArray *emptyArray = [NSArray array];
NSArray *arrayWithArray = [NSArray arrayWithArray:someArray];
NSArray *arrayWithObject = [NSArray arrayWithObject:@"one"];
NSArray *arrayWithObjects = [NSArray arrayWithObjects:@"one", @"two", @"three", nil];

// Need to memory manage
NSArray *emptyArray = [[NSArray alloc] initWithArray:someArray];
// ...

[emptyArray count] // Number of elements


NSMutableArray *mutableArray = [NSMutableArray initWithCapacity:5];
[mutableArray insertObject:@"one" atIndex:0];
[mutableArray addObject:@"one"];

#pragma mark -
#pragma mark === NSDictionary/NSMutableDictionary ===
#pragma mark

NSDictionary *dictionary = [NSDictionary dictionary];
[dictionary allKeys];
[dictionary allValues];
[dictionary objectForKey:@"key"];

#pragma mark -
#pragma mark === UIView/UIViewController ===
#pragma mark

UIViewController *vc = [[UIViewController alloc] initWithNibName:@"nibName" bundle:nil];
vc.view; // Main view
vc.title; // Title used in navigation controllers
[vc presentModalViewController:viewController animated:YES];
[vc dismissModalViewControllerAnimated:YES];
[vc.view addSubview:view];
view.frame = CGRectMake(x, y, view.frame.size.width, view.frame.size.height);

// Animations

[UIView animateWithDuration:kAnimationDuration
     // The end result of the animation
     animations:^{
         // Shrink
         someView.frame = CGRectMake(someView.frame.origin.x, someView.frame.origin.y, 0, 0);
         imageView.alpha = 0;
     }
 
     // Done upon completion of animation
     completion:^(BOOL finished) {
         [someView removeFromSuperview];
     }
 ];
 
// Flip animation
// See UIViewAnimationOptions for more options
[UIView transitionWithView:someView duration:0.7 options:UIViewAnimationOptionTransitionFlipFromLeft 
     animations:^{
         
     }
     completion:NULL
];

// From http://iphonedevelopment.blogspot.com/2008/10/demystifying-cgaffinetransform.html
theView.transform = CGAffineTransformIdentity;
theView.transform = CGAffineTransformTranslate(theView.transform, 5.0, 10.0);
theView.transform = CGAffineTransformRotate(theView.transform, degreesToRadians(45)); // May need to #define degreesToRadians(x) (M_PI * x / 180.0)
theView.transform = CGAffineTransformScale(theView.transform, 2.0, 2.0);
// Inverting transformations 
CGAffineTransform inverse = CGAffineTransformInvert(CGAffineTransformMakeTranslation(5.0, 5.0));

#pragma mark -
#pragma mark === Downloading data ===
#pragma mark

NSString *url = @"http://somesite.com/data.json";
NSData *dataJSON = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];

// Also see: http://allseeing-i.com/ASIHTTPRequest/How-to-use

#pragma mark -
#pragma mark === Random numbers ===
#pragma mark

int ri = arc4random() % maxNum;


#pragma mark -
#pragma mark === Gestures ===
#pragma mark


// For iOS3.0+ (also see http://stackoverflow.com/questions/150446/how-do-i-detect-when-someone-shakes-an-iphone/1111983)
// Put inside view controller
{
    - (void) viewDidAppear:(BOOL)animated {
        // To handle gestures
        [self becomeFirstResponder];
    }

    - (void) viewWillDisappear:(BOOL)animated {
        [self resignFirstResponder];
        [super viewWillDisappear:animated];
    }
    
    - (BOOL)canBecomeFirstResponder { 
        return YES; 
    }

    - (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
        if (event.subtype == UIEventSubtypeMotionShake) {
            // Code to handle shake
        }

        if ( [super respondsToSelector:@selector(motionEnded:withEvent:)] )
            [super motionEnded:motion withEvent:event];
    }

}

#pragma mark -
#pragma mark === Threading ===
#pragma mark

// 1. Create the new thread:
[NSThread detachNewThreadSelector:@selector(myMethod) toTarget:self withObject:nil];

// or to run in background thread
[self performSelectorInBackground:@selector(myMethod) withObject:nil];

// 2. Create the method that is called by the new thread:

- (void)myMethod 
{ 
   NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init]; 
   // Thread code here
   [pool release]; 
}

// If you need to do something to the main thread from inside your new thread
[self performSelectorOnMainThread:@selector(myMethod) withObject:nil waitUntilDone:NO];

// Sleep
[NSThread sleepForTimeInterval:1]; // 1 second

#pragma mark -
#pragma mark === Debugging ===
#pragma mark

// Recursively check subviews [http://stackoverflow.com/questions/5150186/how-do-i-inspect-the-view-hierarchy-in-ios/5150281#5150281]
po [[UIWindow keyWindow] recursiveDescription];

// Print to console
NSLog(@"Debug message: %@", someString);
