#import "ConverterController.h"

@interface ConverterController ()

@property (nonatomic, weak) IBOutlet UILabel *displayLabel;
@property (weak, nonatomic) IBOutlet UILabel *currencyLabel;

@end

@implementation ConverterController {
}

- (void)viewDidLoad {
	[super viewDidLoad];
	self.displayLabel.text = @"0";
}

- (IBAction)buttonTouched:(id)sender {
//    self.displayLabel.text = [NSString stringWithFormat:@"%ld", (long)[sender tag]];

    NSMutableString *tmp = [[NSMutableString alloc] init];
    if(self.displayLabel.text)
        [tmp appendString:self.displayLabel.text];
    
    [tmp appendString:[NSString stringWithFormat:@"%ld", (long)[sender tag]]];
    
    self.displayLabel.text = tmp;
}


@end
