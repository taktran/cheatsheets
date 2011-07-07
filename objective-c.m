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