#import "ConverterController.h"

@interface ConverterController ()

@property (nonatomic, weak) IBOutlet UILabel *displayLabel;
@property (weak, nonatomic) IBOutlet UILabel *currencyLabel;

@end

@implementation ConverterController {
}

- (void)viewDidLoad {
	[super viewDidLoad];
	self.displayLabel.text = @"";
}

- (IBAction)buttonTouched:(id)sender {
//    self.displayLabel.text = [NSString stringWithFormat:@"%ld", (long)[sender tag]];
    NSLog(@"'%@' + '%ld'", self.displayLabel.text, (long)[sender tag]);
    
    if(self.displayLabel.text.length < 10 && ![self hasStartingZero:self.displayLabel.text]){
        NSMutableString *tmp = [[NSMutableString alloc] init];
        
        if(self.displayLabel.text)
            [tmp appendString:self.displayLabel.text];
        
        [tmp appendString:[NSString stringWithFormat:@"%ld", (long)[sender tag]]];
        
        self.displayLabel.text = tmp;
    }
    NSLog(@"->'%@'", self.displayLabel.text);

}

- (BOOL)hasStartingZero:(NSString*)text{
    return (text != nil && [text hasPrefix:@"0"]);
}
@end
