#import "ConverterController.h"

#import "NumberPad.h"

@interface ConverterController ()

@property (nonatomic, weak) IBOutlet UILabel *displayLabel;
@property (weak, nonatomic) IBOutlet UILabel *currencyLabel;
@property (nonatomic) NumberPad *numberPad;
@end

@implementation ConverterController {
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
    self.numberPad = [[NumberPad alloc] init];
    self.displayLabel.text = self.numberPad.currentValue;
}

- (IBAction)buttonTouched:(id)sender {
    [self.numberPad buttonTouched:sender];
    self.displayLabel.text = [self.numberPad currentValue];
}
@end
