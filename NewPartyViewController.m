//
//  NewPartyViewController.m
//  fazendoMinhaFesta
//
//  Created by Fabio Gelbcke on 2/19/14.
//  Copyright (c) 2[NSNumber numberWithInt:0]14 Fabio Gelbcke. All rights reserved.
//

#import "NewPartyViewController.h"

@interface NewPartyViewController ()

@property (strong, nonatomic) NSMutableArray *doneArray;
@property (nonatomic) NSInteger eventsSaved;

@end

@implementation NewPartyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)backToMenu {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)viewDidAppear:(BOOL)animated{
    if (![self isBeingPresented]) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)viewDidLoad
{
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap)];
    [self.view addGestureRecognizer:singleTap];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(void)handleSingleTap{
    [self.childrenqty resignFirstResponder];
    [self.adultqty resignFirstResponder];
    [self.partyName resignFirstResponder];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
    textField.text = @"";
    return YES;
}

-(BOOL) textFieldShouldEndEditing :(UITextField *)textField{
    if ([textField.text isEqualToString: @""]){
        textField.text = @"0";
    }
    return YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createParty {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    ChecklistViewController *checklist = (ChecklistViewController *) [storyboard instantiateViewControllerWithIdentifier:@"Checklist"];
    EditViewController *edit = (EditViewController *) [storyboard instantiateViewControllerWithIdentifier:@"Edit"];
    PartyCalcViewController *calc = (PartyCalcViewController *)[storyboard instantiateViewControllerWithIdentifier:@"PartyCalc"];
    self.doneArray = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0], nil];
    NSNumber *eventosSalvos;
    eventosSalvos=0;
    //NSMutableArray *idArray = [[NSMutableArray alloc]initWithObjects: nil];
    self.eventsSaved=0;
    NSMutableArray *parameters = [NSMutableArray arrayWithObjects:self.partyName.text, self.datePicker.date, self.childrenqty.text, self.adultqty.text, [NSNumber numberWithBool:self.partyType.isOn], self.doneArray, @"false"/*, idArray,*/, nil];
    /*
     0-party name - string
     1-party date - NSDate
     2-quantity of adults - NSString
     3-quantity of children - NSString
     4-party type - NSNumber numberWithBool
     5-done array (checkboxes array) - NSMutableArray
     6-false or true (are events saved on calendar?) - NSString
     7-idArray - event id's for the calendar - NSMutableArray of 
     */
    NSArray *controllers = [NSArray arrayWithObjects:checklist, edit, calc, nil];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (![defaults objectForKey:@"paramsarray"]){
        NSMutableArray *paramsarray = [NSMutableArray arrayWithObject:parameters];
        [defaults setObject:paramsarray forKey:@"paramsarray"];
        [defaults synchronize];
        edit.partyIndex = 0;
        checklist.partyIndex=0;
        calc.partyIndex=0;
    }
    else{
        NSMutableArray *paramsarray = [[defaults objectForKey:@"paramsarray"] mutableCopy];
        edit.partyIndex = [paramsarray count];
        checklist.partyIndex = [paramsarray count];
        calc.partyIndex = [paramsarray count];
        [paramsarray addObject:parameters];
        [defaults setObject:paramsarray forKey:@"paramsarray"];
        NSLog(@"else");
        [defaults synchronize];
    }
    UITabBarController *tabController = [[UITabBarController alloc] init];
    [tabController setViewControllers:controllers];
    [self presentViewController:tabController animated:YES completion:nil];
    
}
- (IBAction)cancel {
}

@end
