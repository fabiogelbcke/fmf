//
//  LoadPartyViewController.m
//  fazendoMinhaFesta
//
//  Created by Fabio Gelbcke on 3/14/14.
//  Copyright (c) 2014 Fabio Gelbcke. All rights reserved.
//


// problema no editar nome, verificar se está apagando eventos do calendário, ícone, mickey, iphone 6/plus


#import "LoadPartyViewController.h"
#import "ChecklistViewController.h"
#import "EditViewController.h"
#import "PartyCalcViewController.h"

@interface LoadPartyViewController ()
@property (nonatomic, strong) NSUserDefaults *defaults;
@property (nonatomic, strong) NSMutableArray *parties;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation LoadPartyViewController{
    double partynumber;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    self.defaults = [NSUserDefaults standardUserDefaults];
    self.parties = [self.defaults objectForKey:@"paramsarray"];
    NSInteger n = self.parties.count;
    return n;
}


- (void)viewDidLoad
{
    
    [super viewDidLoad];
    self.tableView.allowsMultipleSelectionDuringEditing = NO;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backToMenu:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier= @"PartyCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PartyCell"];
    }
    cell.textLabel.text = [[self.parties objectAtIndex:indexPath.row] objectAtIndex:0];
    
   cell.detailTextLabel.text = [NSDateFormatter localizedStringFromDate:(NSDate *)[[self.parties objectAtIndex:indexPath.row] objectAtIndex:1] dateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterNoStyle];
    cell.tag = indexPath.row;
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(loadParty:)];
    [cell addGestureRecognizer:singleTap];
    return cell;

}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


-(void)viewDidAppear:(BOOL)animated{
    if (![self isBeingPresented]){
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

-(void)loadParty:(UITapGestureRecognizer *)sender{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    ChecklistViewController *checklist = (ChecklistViewController *) [storyboard instantiateViewControllerWithIdentifier:@"Checklist"];
    //checklist.tabBarItem.image = [UIImage imageNamed:@"checklisticon.png"];
    EditViewController *edit = (EditViewController *) [storyboard instantiateViewControllerWithIdentifier:@"Edit"];
    //edit.tabBarItem.image = [UIImage imageNamed:@"edit.png"];
    PartyCalcViewController *calc = (PartyCalcViewController *)[storyboard instantiateViewControllerWithIdentifier:@"PartyCalc"];
    //calc.tabBarItem.image = [UIImage imageNamed:@"Calculator.png"];
    NSArray *controllers = [NSArray arrayWithObjects:checklist, calc, edit, nil];
    checklist.partyIndex= sender.view.tag;
    edit.partyIndex = sender.view.tag;
    calc.partyIndex = sender.view.tag;
    UITabBarController *tabController = [[UITabBarController alloc] init];
    [tabController setViewControllers:controllers];
    [self presentViewController:tabController animated:YES completion:nil];


}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        self.defaults = [NSUserDefaults standardUserDefaults];
        self.parties = [[self.defaults objectForKey:@"paramsarray"] mutableCopy];
        [self.parties removeObjectAtIndex:indexPath.row];
        [self.defaults setObject:self.parties forKey:@"paramsarray"];
        [self.defaults synchronize];
        [self.tableView reloadData];
        //add code here for when you hit delete
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
