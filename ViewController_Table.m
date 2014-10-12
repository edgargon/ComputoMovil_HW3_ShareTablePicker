//
//  ViewController_Table.m
//  HW3_ShareInfo
//
//  Created by Edgar González on 12/10/14.
//  Copyright (c) 2014 Edgar González. All rights reserved.
//

#import "ViewController_Table.h"
#import "Cell_Table.h"

@interface ViewController_Table ()

@end

@implementation ViewController_Table

NSMutableArray *lbl_Personaje;
NSMutableArray *img_Personaje;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    lbl_Personaje = [NSMutableArray arrayWithObjects: @"Audi A3", @"Atittude", @"Dart", @"Fiesta", @"Fusion", @"Ibiza", @"Leon", @"Mazda 3", @"Sentra", @"Sonic", nil];
    //leon, Sentra, sonic, Ibiza, fiesta, mazda3, dart,
    img_Personaje =  [NSMutableArray arrayWithObjects: @"A3.jpg", @"Atittude.jpg", @"Dart.jpg", @"Fiesta.jpg", @"fusion.jpg", @"Ibiza.jpg", @"Leon.jpg", @"Mazda3.jpg", @"Nissan.jpg", @"Sonic.jpg", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**********************************************************************************************
 Table Functions
 **********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell_Table";
    
    Cell_Table *cell = (Cell_Table *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[Cell_Table alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.imgCell.image =  [UIImage imageNamed:img_Personaje[indexPath.row]];
    cell.lblCell.text  =  lbl_Personaje[indexPath.row];
    
    cell.btnCell.tag = indexPath.row;

    return cell;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnPressed_Share:(id)sender {
    UIButton *buttonPressed = (UIButton *)sender;
    
    NSString                    *strShareMsg;
    NSArray                     *aShareItems;
    UIImage                     *imgShare;
    UIActivityViewController    *actViewController;
    
    strShareMsg = [NSString stringWithFormat:@"iOS UAG - Auto %@ fue seleccionado", lbl_Personaje[buttonPressed.tag]];
    imgShare    = [UIImage imageNamed:img_Personaje[buttonPressed.tag]];
    aShareItems = @[imgShare,strShareMsg];
    
    actViewController = [[UIActivityViewController alloc] initWithActivityItems:aShareItems applicationActivities:nil];
    
    actViewController.excludedActivityTypes = [NSArray arrayWithObjects:UIActivityTypePrint, UIActivityTypeAssignToContact, UIActivityTypeCopyToPasteboard, UIActivityTypeAirDrop, nil];
    
    [self presentViewController:actViewController animated:YES completion:nil];

}

- (IBAction)btnPressed_ShareAll:(id)sender {
    NSString                    *strShareMsg;
    NSArray                     *aShareItems;
    UIImage                     *imgShare;
    UIActivityViewController    *actViewController;
    
    strShareMsg = @"iOS UAG - Hay 10 elementos en la lista";
    imgShare    = [UIImage imageNamed:@"batimovil2014.jpg"];
    aShareItems = @[imgShare,strShareMsg];
    
    actViewController = [[UIActivityViewController alloc] initWithActivityItems:aShareItems applicationActivities:nil];
    
    actViewController.excludedActivityTypes = [NSArray arrayWithObjects:UIActivityTypePrint, UIActivityTypeAssignToContact, UIActivityTypeCopyToPasteboard, UIActivityTypeAirDrop, nil];
    
    [self presentViewController:actViewController animated:YES completion:nil];
}

@end
