/* 

Cheatsheet for objective c code.

*/

#import "SomeFile.h"

#pragma mark -
#pragma mark === Constants ===
#pragma mark

#define kSomeConstant  30


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
#pragma mark === Debugging ===
#pragma mark

// Recursively check subviews [http://stackoverflow.com/questions/5150186/how-do-i-inspect-the-view-hierarchy-in-ios/5150281#5150281]
po [[UIWindow keyWindow] recursiveDescription];

// Print to console
NSLog(@"Debug message: %@", someString);
