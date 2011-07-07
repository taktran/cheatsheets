/* 

Cheatsheet for objective c code.

*/

#pragma mark -
#pragma mark === Contructors  ===
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
#pragma mark === Setter/Getter methods  ===
#pragma mark

- (SomeClass *)instanceName {
	if (!instanceName) {
		instanceName = [[SomeClass alloc] init];
	}
	
	return instanceName;
}

#pragma mark -
#pragma mark === Debugging  ===
#pragma mark

// Recursively check subviews [http://stackoverflow.com/questions/5150186/how-do-i-inspect-the-view-hierarchy-in-ios/5150281#5150281]
po [[UIWindow keyWindow] recursiveDescription];

// Print to console
NSLog(@"Debug message");
