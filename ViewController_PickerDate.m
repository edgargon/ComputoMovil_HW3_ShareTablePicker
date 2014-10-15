//
//  ViewController_PickerDate.m
//  HW3_ShareInfo
//
//  Created by Edgar González on 12/10/14.
//  Copyright (c) 2014 Edgar González. All rights reserved.
//

#import "ViewController_PickerDate.h"

@interface ViewController_PickerDate ()

@property (strong, nonatomic) IBOutlet UIDatePicker *pickerDate_1;
@property (strong, nonatomic) IBOutlet UIDatePicker *pickerDate_2;
@property (strong, nonatomic) IBOutlet UILabel *lbl_diferencia;

@end

@implementation ViewController_PickerDate

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btn_CalcularDiferencia:(id)sender {
    
    long diff_seg = [[self.pickerDate_1 date] timeIntervalSinceDate:[self.pickerDate_2 date]];
    long diff_min;
    long diff_hrs;
    long diff_days;
    
    //days
    if(diff_seg/86400 >= 1)
    {
        diff_days = diff_seg/86400;
        diff_seg = diff_seg - (diff_days * 86400);
    }
    else
    {
        diff_days = 0;
    }
    
    //hrs
    if(diff_seg/3600 >= 1)
    {
        diff_hrs = diff_seg/3600;
        diff_seg = diff_seg - (diff_hrs * 3600);
    }
    else
    {
        diff_hrs = 0;
    }
    
    //min
    if(diff_seg/60 >= 1)
    {
        diff_min = diff_seg/60;
        diff_seg = diff_seg - (diff_min * 60);
    }
    else
    {
        diff_hrs = 0;
    }
    
    
    //seg
    
    
    NSString *string_seg = [NSString stringWithFormat:@"%ld",diff_seg];
    NSString *string_min = [NSString stringWithFormat:@"%ld",diff_min];
    NSString *string_hrs = [NSString stringWithFormat:@"%ld",diff_hrs];
    NSString *string_days = [NSString stringWithFormat:@"%ld",diff_days];
    
   //[NSString stringWithFormat:@"iOS UAG - Auto %@ fue seleccionado", lbl_Personaje[buttonPressed.tag]];
    
    self.lbl_diferencia.text = [NSString stringWithFormat: @"%@ días - %@ hrs - %@ min - %@ seg",string_days, string_hrs, string_min, string_seg];
}

- (IBAction)btnCompartir:(id)sender {
    NSString                    *strShareMsg;
    NSArray                     *aShareItems;
    //UIImage                     *imgShare;
    UIActivityViewController    *actViewController;
    
    strShareMsg = [NSString stringWithFormat:@"iOS UAG - Diferencia de tiempo %@", self.lbl_diferencia.text];
    //imgShare    = [UIImage imageNamed:img_Personaje[buttonPressed.tag]];
    aShareItems = @[strShareMsg];
    
    actViewController = [[UIActivityViewController alloc] initWithActivityItems:aShareItems applicationActivities:nil];
    
    actViewController.excludedActivityTypes = [NSArray arrayWithObjects:UIActivityTypePrint, UIActivityTypeAssignToContact, UIActivityTypeCopyToPasteboard, UIActivityTypeAirDrop, nil];
    
    [self presentViewController:actViewController animated:YES completion:nil];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
