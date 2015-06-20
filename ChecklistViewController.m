//
//  ChecklistViewController.m
//  fazendoMinhaFesta
//
//  Created by Fabio Gelbcke on 2/20/14.
//  Copyright (c) 2014 Fabio Gelbcke. All rights reserved.
//

#import "ChecklistViewController.h"
#import "ChecklistTableViewCell.h"
#import <EventKit/EventKit.h>
#import "EditViewController.h"
@import GoogleMobileAds;


@interface ChecklistViewController ()
@property (strong, nonatomic) IBOutlet UINavigationBar *navBar;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *tableDistanceToBottom;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *tableHeight;
@property (weak, nonatomic) IBOutlet UIButton *backButton;


@end

@implementation ChecklistViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)backToMenu:(UIBarButtonItem *)sender {
    [self.tabBarController dismissViewControllerAnimated:NO completion:nil];
    
    

}


- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    //[self.check1 setImages];
    [self.scrollView setContentSize:CGSizeMake(320, 1000)];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.tableView.allowsMultipleSelectionDuringEditing = NO;
    if (self.partyIndex>=0){
        self.parameters = [[[defaults objectForKey:@"paramsarray"] objectAtIndex:self.partyIndex] mutableCopy];
        self.navBar.topItem.title=[self.parameters objectAtIndex:0];
        self.backButton.alpha=0;
    }
    else {
        self.parameters = [[NSMutableArray alloc] init];
        for (int i =0; i<5; i++){
            [self.parameters addObject:@"placeholder"];
        }
        [self.parameters insertObject:[NSMutableArray arrayWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0], nil] atIndex:5];
    }
    
    int i;
    for (i=0; i<[[self.cview subviews]count]; i++){
        if ([[[self.cview subviews] objectAtIndex:i] isKindOfClass:[Checkbox class]]) {
            //if (defaults objectForKey:@"check)
            [[[self.cview subviews] objectAtIndex:i] setImages];
        }
    }
    
   
	// Do any additional setup after loading the view.
}

-(void) viewWillAppear:(BOOL)animated{
    if (self.partyIndex>=0){
        self.navBar.topItem.title=[self.parameters objectAtIndex:0];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        self.parameters = [[[defaults objectForKey:@"paramsarray"] objectAtIndex:self.partyIndex] mutableCopy];
        [self.tableView reloadData];
        if (![[self.parameters objectAtIndex:6] isEqualToString:@"true"] && ![[self.parameters objectAtIndex:6] isEqualToString:@"no"])[self addToCalendar];
    }
    
    if (self.partyIndex==-1){
        self.navBar.alpha=0;
        self.tableHeight.constant=518;
        self.tableDistanceToBottom.constant=0;
        
    }
    else {
        self.tableHeight.constant=454;
        self.tableDistanceToBottom.constant=50;
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    /*int i = 0;
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateStyle:NSDateFormatterShortStyle];
    
    while ([[format dateFromString:[self getActionDate:i]] compare:[NSDate date]] == NSOrderedAscending  && i < 27)
    {
        NSLog([NSString stringWithFormat:@"%d", i]);
        i++;
    }
    i--;
    
    return 27 - i;*/
    
    //DIMINUIR NUMBERO DE SEÇOES
    return 27;

}

-(NSString *)dateFor:(NSInteger)days daysBefore:(NSDate *)partyDate
{
    
    return [NSDateFormatter localizedStringFromDate:[(NSDate *)partyDate dateByAddingTimeInterval:(-1)*days*24*60*60] dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterNoStyle];
}


-(NSString *)getActionDate:(NSInteger)section{
    NSString *sectionName;
    switch(section)
    {
        case 0:
            sectionName = [self dateFor:90 daysBefore:[self.parameters objectAtIndex:1]];
            break;
        case 1:
            sectionName = [self dateFor:85 daysBefore:[self.parameters objectAtIndex:1]];
            break;
            // ...
        case 2:
            sectionName = [self dateFor:70 daysBefore:[self.parameters objectAtIndex:1]];
            break;
        case 3:
            sectionName = [self dateFor:60 daysBefore:[self.parameters objectAtIndex:1]];
            break;
            // ...
        case 4:
            sectionName = [self dateFor:55 daysBefore:[self.parameters objectAtIndex:1]];
            break;
        case 5:
            sectionName = [self dateFor:50 daysBefore:[self.parameters objectAtIndex:1]];
            break;
            // ...
        case 6:
            sectionName = [self dateFor:45 daysBefore:[self.parameters objectAtIndex:1]];
            break;
        case 7:
            sectionName = [self dateFor:40 daysBefore:[self.parameters objectAtIndex:1]];
            break;
            // ...
        case 8:
            sectionName = [self dateFor:35 daysBefore:[self.parameters objectAtIndex:1]];
            break;
        case 9:
            sectionName = [self dateFor:30 daysBefore:[self.parameters objectAtIndex:1]];
            break;
            // ...
        case 10:
            sectionName = [self dateFor:28 daysBefore:[self.parameters objectAtIndex:1]];
            break;
        case 11:
            sectionName = [self dateFor:25 daysBefore:[self.parameters objectAtIndex:1]];
            break;
            // ...
            
        case 12:
            sectionName = [self dateFor:23 daysBefore:[self.parameters objectAtIndex:1]];
            break;
        case 13:
            sectionName = [self dateFor:20 daysBefore:[self.parameters objectAtIndex:1]];
            break;
            // ...
        case 14:
            sectionName = [self dateFor:18 daysBefore:[self.parameters objectAtIndex:1]];
            break;
        case 15:
            sectionName = [self dateFor:15 daysBefore:[self.parameters objectAtIndex:1]];
            break;
            // ...
        case 16:
            sectionName = [self dateFor:10 daysBefore:[self.parameters objectAtIndex:1]];
            break;
        case 17:
            sectionName = [self dateFor:8 daysBefore:[self.parameters objectAtIndex:1]];
            break;
            // ...
        case 18:
            sectionName = [self dateFor:7 daysBefore:[self.parameters objectAtIndex:1]];
            break;
        case 19:
            sectionName = [self dateFor:5 daysBefore:[self.parameters objectAtIndex:1]];
            break;
            // ...
        case 20:
            sectionName = [self dateFor:4 daysBefore:[self.parameters objectAtIndex:1]];
            break;
        case 21:
            sectionName = [self dateFor:3 daysBefore:[self.parameters objectAtIndex:1]];
            break;
        case 22:
            sectionName = [self dateFor:2 daysBefore:[self.parameters objectAtIndex:1]];
            break;
        case 23:
            sectionName = [self dateFor:1 daysBefore:[self.parameters objectAtIndex:1]];
            break;
        case 24:
            sectionName = [self dateFor:0 daysBefore:[self.parameters objectAtIndex:1]];
            break;
        case 25:
            sectionName = [self dateFor:-3 daysBefore:[self.parameters objectAtIndex:1]];
            break;
            // ...
        case 26:
            sectionName = [self dateFor:-7 daysBefore:[self.parameters objectAtIndex:1]];
            break;
        default:
            sectionName = [self dateFor:0 daysBefore:[self.parameters objectAtIndex:1]];
            break;
    }
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateStyle:NSDateFormatterShortStyle];
    if ([[format dateFromString:sectionName] compare:[NSDate date]] == NSOrderedAscending)
    {
        return @"Hoje!";
    }
    return sectionName;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 3) {
        return 190.0;
    }
    if(indexPath.section == 7) {
        return 100;
    }
    if(indexPath.section == 8){
        return 120;
    }
    if(indexPath.section == 12 && indexPath.row == 0) {
        return 200;
    }
    if(indexPath.section == 16 && indexPath.row == 1) {
        return 90;
    }
    if(indexPath.section == 23 && indexPath.row == 0) {
        return 90;
    }
    
    
    // "Else"
    return 78;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionName;
    if (self.partyIndex>=0){
        sectionName = [self getActionDate:section];
    }
    else{
        switch (section)
        {
            case 0:
                sectionName = @"90 dias antes da festa";
                break;
            case 1:
                sectionName = @"85 dias antes da festa";
                break;
                // ...
            case 2:
                sectionName = @"70 dias antes da festa";
                break;
            case 3:
                sectionName = @"60 dias antes da festa";
                break;
                // ...
            case 4:
                sectionName = @"55 dias antes da festa";
                break;
            case 5:
                sectionName = @"50 dias antes da festa";
                break;
                // ...
            case 6:
                sectionName = @"45 dias antes da festa";
                break;
            case 7:
                sectionName = @"40 dias antes da festa";
                break;
                // ...
            case 8:
                sectionName = @"35 dias antes da festa";
                break;
            case 9:
                sectionName = @"30 dias antes da festa";
                break;
                // ...
            case 10:
                sectionName = @"28 dias antes da festa";
                break;
            case 11:
                sectionName = @"25 dias antes da festa";
                break;
                // ...
                
            case 12:
                sectionName = @"23 dias antes da festa";
                break;
            case 13:
                sectionName = @"20 dias antes da festa";
                break;
                // ...
            case 14:
                sectionName = @"18 dias antes da festa";
                break;
            case 15:
                sectionName = @"15 dias antes da festa";
                break;
                // ...
            case 16:
                sectionName = @"10 dias antes da festa";
                break;
            case 17:
                sectionName = @"8 dias antes da festa";
                break;
                // ...
            case 18:
                sectionName = @"7 dias antes da festa";
                break;
            case 19:
                sectionName = @"5 dias antes da festa";
                break;
                // ...
            case 20:
                sectionName = @"4 dias antes da festa";
                break;
            case 21:
                sectionName = @"3 dias antes da festa";
                break;
                // ...
            case 22:
                sectionName = @"2 dias antes da festa";
                break;
            case 23:
                sectionName = @"1 dias antes da festa";
                break;
                // ...
            case 24:
                sectionName = @"No dia da festa";
                break;
            case 25:
                sectionName = @"3 dias após da festa";
                break;
                // ...
            case 26:
                sectionName =@"7 dias após a festa";
                break;
            default:
                sectionName = @"No dia da festa";
                break;
        }
    }
        
    return sectionName;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0 || section == 4 || section == 8 || section == 12 ||section ==  13|| section == 15 || section == 16 || section == 23){
        return 2;
    }
    else if( section==1 || section == 2 || section == 3 || section == 5 || section == 6 || section == 7 || section == 9 || section == 10 || section == 11 || section == 14 || section == 17 || section == 18 || section == 19 || section == 20 || section == 21 || section == 22 || section == 25 || section == 26){
        return 1;
    }
    else if (section == 24){  return 7;}
    return 0;
}

-(NSString *)getTitleInSection:(NSInteger)section forRow:(NSInteger)row{
    NSString *text;
    switch (section)
    {
        case 0:
            switch (row) {
                case 0:
                    text=@"Escolher data e hora";
                    break;
                case 1:
                    text=@"Reservar Salão e Buffet";
                    break;
                default:
                    break;
            }
            
            
            break;
        case 1:
            switch (row) {
                case 0:
                    text=@"Escolher o tema";
                    break;
                    
                default:
                    break;
            }
            
            
            break;
        case 2:
            switch (row) {
                case 0:
                    text=@"Fazer a lista de convidados";
                    break;
                    
                default:
                    break;
            }
            
            
            break;
        case 3:
            switch (row) {
                case 0:
                    text=@"Contratar o entretenimento: DJ, mágico, palhaço, cama elástica, piscina de bolinhas, pintura artística, contação de história, escultura de balões, apresentação de personagens";
                    break;
                    
                default:
                    break;
            }
            
            
            break;
        case 4:
            switch (row) {
                case 0:
                    text=@"Contratar o fotógrafo";
                    break;
                case 1:
                    text=@"Separar as fotos para retrospectiva e reservar o telão e o projetor";
                    break;
                default:
                    break;
            }
            
            
            break;
        case 5:
            switch (row) {
                case 0:
                    text=@"Começar a fazer ou encomendar os convites";
                    break;
                default:
                    break;
            }
            
            
            break;
        case 6:
            switch (row) {
                case 0:
                    text=@"Começar a fazer ou encomendar lembrancinhas";
                    break;
                default:
                    break;
            }
            
            
            break;
        case 7:
            switch (row) {
                case 0:
                    text=@"Enviar um “guarde a data” por email para os convidados, já informando a data e horário da festa";
                    break;
                default:
                    break;
            }
            
            
            break;
        case 8:
            switch (row) {
                case 0:
                    text=@"Comprar suprimentos de decoração: descartáveis, enfeites, painéis, toalhas, balões";
                    break;
                case 1:
                    text=@"Comprar suprimentos de lembrancinhas: papel, tinta para impressora, cola e material";
                    break;
                default:
                    break;
            }
            
            
            break;
        case 9:
            switch (row) {
                case 0:
                    text=@"Enviar os convites, pedindo que as pessoas confirmem a presença";
                    break;
                default:
                    break;
            }
            
            
            break;
        case 10:
            switch (row) {
                case 0:
                    text=@"Comece a fazer todos os Kits Personalizados e Kit Toilet";
                    break;
                default:
                    break;
            }
            
            
            break;
        case 11:
            switch (row) {
                case 0:
                    text=@"Verificar se que comprou/alugou todos os suprimentos de lebrancinha e decoração";
                    break;
                default:
                    break;
            }
            
            
            break;
        case 12:
            switch (row) {
                case 0:
                    text=@"Festas em casa: solicitar ajuda de familiares e amigos (para arrumar as mesas, limpar, ajudar nos jogos, tirar fotos, atender telefones/interfones e portas, colocar nome nos presentes, entregar lembrancinhas)";
                    break;
                case 1:
                    text=@"Festas em Buffet, confirmar todos os serviços contratados";
                    break;
                default:
                    break;
            }
            
            
            break;
        case 13:
            switch (row) {
                case 0:
                    text=@"Encomende o bolo e escolha/compre a vela";
                    break;
                case 1:
                    text=@"Encomende a comida (salgados e doces). USE NOSSA CALCULADORA";
                    break;
                default:
                    break;
            }
            
            
            break;
        case 14:
            switch (row) {
                case 0:
                    text=@"Imprima as plaquinhas com frases divertidas para fotos";
                    break;
                default:
                    break;
            }
            
            
            break;
        case 15:
            switch (row) {
                case 0:
                    text=@"Confirme todos os serviços contratados.";
                    break;
                case 1:
                    text=@"Envie um email para os convidados, com indicações do endereço da festa";
                    break;
                default:
                    break;
            }
            
            
            break;
        case 16:
            switch (row) {
                case 0:
                    text=@"Compre os ingredientes da comida se for fazer em casa";
                    break;
                case 1:
                    text=@"Verificar se a quantidade de lembrancinhas é suficiente para o número de convidados";
                    break;
                default:
                    break;
            }
            
            
            break;
        case 17:
            switch (row) {
                case 0:
                    text=@"Confirme com os familiares e amigos suas funções no dia da festa";
                    break;
                default:
                    break;
            }
            
            
            break;
        case 18:
            switch (row) {
                case 0:
                    text=@"Envie emails para confirmar presença";
                default:
                    break;
            }
            
            
            break;
        case 19:
            switch (row) {
                case 0:
                    text=@"Terminar as lembrancinhas";
                    break;
                default:
                    break;
            }
            
            
            break;
        case 20:
            switch (row) {
                case 0:
                    text=@"Compras as bebidas: USE NOSSA CALCULADORA";
                    break;
                default:
                    break;
            }
            
            
            break;
        case 21:
            switch (row) {
                case 0:
                    text=@"Separar cartões de memória e baterias para câmera fotográfica";
                    break;
                default:
                    break;
            }
            
            
            break;
        case 22:
            switch (row) {
                case 0:
                    text=@"Finalize todos os personalizados comestíveis";
                    break;
                default:
                    break;
            }
            
            
            break;
        case 23:
            switch (row) {
                case 0:
                    text=@"festas em casa: prepare a comida, limpe a casa e comece a decoração com balões";
                    break;
                case 1:
                    text=@"festas em buffet: entregue todas as lembrancinhas e materiais de decoração";
                    break;
                default:
                    break;
            }
            
            
            break;
        case 24:
            switch (row) {
                case 0:
                    text=@"Pegar o bolo";
                    break;
                case 1:
                    text=@"Arrumar as mesas";
                    break;
                case 2:
                    text=@"Deixar as bebidas disponíveis (se não tiver garçom)";
                    break;
                case 3:
                    text=@"Arrume as crianças, e depois se arrume";
                    break;
                case 4:
                    text=@"Verifique com familiares e amigos suas funções";
                    break;
                case 5:
                    text=@"Não se estressar";
                    break;
                case 6:
                    text=@"DIVIRTA-SE E BOA FESTA!";
                    //cell.tickbox.hidden=YES;
                    break;
                default:
                    break;
            }
            break;
            
            
        case 25:
            switch (row) {
                case 0:
                    text=@"Enviar notas de agradecimento aos familiares e amigos ajudantes";
                    break;
                default:
                    break;
            }
            break;
        case 26:
            switch (row) {
                case 0:
                    text=@"Enviar notas de agradecimento aos convidados";
                    break;
                default:
                    break;
            }
            
            
            break;
    }
    return text;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier= @"ChecklistCell";
    
    ChecklistTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[ChecklistTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.task.text = [self getTitleInSection:indexPath.section forRow:indexPath.row];
    
    long int i;
    i = [self numberOfSectionsInTableView:tableView];
    [cell sizeToFit];
    
    switch (indexPath.section)
    {
        case 0:
            switch (indexPath.row) {
                case 0:
                    cell.tickbox.tag = 0;
                    break;
                case 1:
                    cell.tickbox.tag = 1;
                    break;
                default:
                    break;
            }
            
            
            break;
        case 1:
            switch (indexPath.row) {
                case 0:
                    cell.tickbox.tag = 2;
                    break;
                    
                default:
                    break;
            }
            
            
            break;
        case 2:
            switch (indexPath.row) {
                case 0:
                    cell.tickbox.tag = 3;
                    break;
                    
                default:
                    break;
            }
            
            
            break;
        case 3:
            switch (indexPath.row) {
                case 0:
                    cell.tickbox.tag = 4;
                    break;
                    
                default:
                    break;
            }
            
            
            break;
        case 4:
            switch (indexPath.row) {
                case 0:
                    cell.tickbox.tag = 5;
                    break;
                case 1:
                    cell.tickbox.tag = 6;
                    break;
                default:
                    break;
            }
            
            
            break;
        case 5:
            switch (indexPath.row) {
                case 0:
                    cell.tickbox.tag = 7;
                    break;
                default:
                    break;
            }
            
            
            break;
        case 6:
            switch (indexPath.row) {
                case 0:
                    cell.tickbox.tag = 8;
                    break;
                default:
                    break;
            }
            
            
            break;
        case 7:
            switch (indexPath.row) {
                case 0:
                    cell.tickbox.tag = 9;
                    break;
                default:
                    break;
            }
            
            
            break;
        case 8:
            switch (indexPath.row) {
                case 0:
                    cell.tickbox.tag = 10;
                    break;
                case 1:
                    cell.tickbox.tag = 11;
                    break;
                default:
                    break;
            }
            
            
            break;
        case 9:
            switch (indexPath.row) {
                case 0:
                    cell.tickbox.tag = 12;
                    break;
                default:
                    break;
            }
            
            
            break;
        case 10:
            switch (indexPath.row) {
                case 0:
                    cell.tickbox.tag = 13;
                    break;
                default:
                    break;
            }
            
            
            break;
        case 11:
            switch (indexPath.row) {
                case 0:
                    cell.tickbox.tag = 14;
                    break;
                default:
                    break;
            }
            
            
            break;
        case 12:
            switch (indexPath.row) {
                case 0:
                    cell.tickbox.tag = 15;
                    break;
                case 1:
                    cell.tickbox.tag = 16;
                    break;
                default:
                    break;
            }
            
            
            break;
        case 13:
            switch (indexPath.row) {
                case 0:
                    cell.tickbox.tag = 17;
                    break;
                case 1:
                    cell.tickbox.tag = 18;
                    break;
                default:
                    break;
            }
            
            
            break;
        case 14:
            switch (indexPath.row) {
                case 0:
                    cell.tickbox.tag = 19;
                    break;
                default:
                    break;
            }
            
            
            break;
        case 15:
            switch (indexPath.row) {
                case 0:
                    cell.tickbox.tag = 20;
                    break;
                case 1:
                    cell.tickbox.tag = 21;
                    break;
                default:
                    break;
            }
            
            
            break;
        case 16:
            switch (indexPath.row) {
                case 0:
                    cell.tickbox.tag = 22;
                    break;
                case 1:
                    cell.tickbox.tag = 23;
                    break;
                default:
                    break;
            }
            
            
            break;
        case 17:
            switch (indexPath.row) {
                case 0:
                    cell.tickbox.tag = 24;
                    break;
                default:
                    break;
            }
            
            
            break;
        case 18:
            switch (indexPath.row) {
                case 0:
                    cell.tickbox.tag = 25;
                    break;
                default:
                    break;
            }
            
            
            break;
        case 19:
            switch (indexPath.row) {
                case 0:
                    cell.tickbox.tag = 26;
                    break;
                default:
                    break;
            }
            
            
            break;
        case 20:
            switch (indexPath.row) {
                case 0:
                    cell.tickbox.tag = 27;
                    break;
                default:
                    break;
            }
            
            
            break;
        case 21:
            switch (indexPath.row) {
                case 0:
                    cell.tickbox.tag = 28;
                    break;
                default:
                    break;
            }
            
            
            break;
        case 22:
            switch (indexPath.row) {
                case 0:
                    cell.tickbox.tag = 29;
                    break;
                default:
                    break;
            }
            
            
            break;
        case 23:
            switch (indexPath.row) {
                case 0:
                    cell.tickbox.tag = 30;
                    break;
                case 1:
                    cell.tickbox.tag = 31;
                    break;
                default:
                    break;
            }
            
            
            break;
        case 24:
            switch (indexPath.row) {
                case 0:
                    cell.tickbox.tag = 32;
                    break;
                case 1:
                    cell.tickbox.tag = 33;
                    break;
                case 2:
                    cell.tickbox.tag = 34;
                    break;
                case 3:
                    cell.tickbox.tag = 35;
                    break;
                case 4:
                    cell.tickbox.tag = 36;
                    break;
                case 5:
                    cell.tickbox.tag = 37;
                    break;
                case 6:
                    cell.tickbox.tag = 38;
                    //cell.tickbox.hidden=YES;
                    break;
                default:
                    break;
            }
            break;
            
            
        case 25:
            switch (indexPath.row) {
                case 0:
                    cell.tickbox.tag = 39;
                    break;
                default:
                    break;
            }
            break;
        case 26:
            switch (indexPath.row) {
                case 0:
                    cell.tickbox.tag = 40;
                    break;
                default:
                    break;
            }
            
            
            break;
    }
    
    NSLog([NSString stringWithFormat:@"Count: %d",self.parameters.count]);
        if ([[self.parameters objectAtIndex:5] objectAtIndex:cell.tickbox.tag]==[NSNumber numberWithInt:1]){
           [cell.tickbox setSelected:YES];
        }
        else{
            [cell.tickbox setSelected:NO];
        }
        cell.tickbox.cellPath=indexPath;
        
       // UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(loadParty)];
        //[cell addGestureRecognizer:singleTap];
    
    return cell;
    
}



-(void)addToCalendar{
    
    if ([[self.parameters objectAtIndex:6] isEqualToString:@"false"]  && self.partyIndex>=0){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Deseja adicionar alertas ao calendário?" message:nil delegate:self cancelButtonTitle:@"Não" otherButtonTitles:@"Sim", nil];
        [alert show];
        
        
    }
    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    // the user clicked OK
    if (buttonIndex == 1) {
        NSLog(@"rodando calendário");
        
        EKEventStore *store = [[EKEventStore alloc] init];
        [store requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error) {
            if (!granted) { return; }
            int i,j;
                for (i=0; i<[self.tableView numberOfSections]; i++){
                    for (j=0; j<[self.tableView numberOfRowsInSection:i]; j++){
                        //NSLog([NSString stringWithFormat:@"section: %d - row %d - name %@", i,j, [self getTitleInSection:i forRow:j]]);
                        NSString *title =[self getTitleInSection:i forRow:j];
                        NSLog(title);
                        //NSLog(@"for");
                        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
                        [formatter setDateStyle:NSDateFormatterShortStyle];
                        NSDate *myDate = [formatter dateFromString:[self getActionDate:i]];
                        myDate = [myDate dateByAddingTimeInterval:8*60*60];
                        
                        //NSLog(@"granted");
                        EKEvent *event = [EKEvent eventWithEventStore:store];
                        event.title = title;
                        event.startDate = myDate; //today
                        event.endDate = [event.startDate dateByAddingTimeInterval:60*60];
                        event.alarms = [NSArray arrayWithObject:[EKAlarm alarmWithRelativeOffset:0]];//set 1 hour meeting
                        [event setCalendar:[store defaultCalendarForNewEvents]];
                        NSError *err = nil;
                        [store saveEvent:event span:EKSpanThisEvent commit:YES error:&err];
                       // NSLog(err);
                        //NSLog(event.eventIdentifier);
                        if (self.parameters.count==7){
                            NSMutableArray *eventIdArray = [[NSMutableArray alloc] init];
                            [self.parameters addObject:eventIdArray];
                        }
                        NSLog([NSString stringWithFormat:@"count %d", self.parameters.count]);
                        [[self.parameters objectAtIndex:7] addObject:event.eventIdentifier];
                        //ERROOOOOOOOOOOOOO
                        ((EditViewController *)[self.tabBarController.viewControllers objectAtIndex:1]).parameters=self.parameters; //this is so you can access this event later
                    }
                }
        }];
        [self.parameters replaceObjectAtIndex:6 withObject:@"true"];
        NSUserDefaults *pref = [NSUserDefaults standardUserDefaults];
        // [[pref objectForKey:@"paramsarray"] replaceObjectAtIndex:self.partyIndex withObject:self.parameters];
        NSMutableArray *temp = [[pref objectForKey:@"paramsarray"] mutableCopy];
        [temp replaceObjectAtIndex:self.partyIndex withObject:self.parameters];
        [pref setObject:temp forKey:@"paramsarray"];
        NSLog(@"SAVED");
        [pref synchronize];
        
        [self performSelector:(@selector(save)) withObject:nil afterDelay:2];
        
    }
    else {
        [self.parameters replaceObjectAtIndex:6 withObject:@"no"];
    }
}


-(void)save
{
    NSUserDefaults *pref = [NSUserDefaults standardUserDefaults];
    // [[pref objectForKey:@"paramsarray"] replaceObjectAtIndex:self.partyIndex withObject:self.parameters];
    NSMutableArray *temp = [[pref objectForKey:@"paramsarray"] mutableCopy];
    [temp replaceObjectAtIndex:self.partyIndex withObject:self.parameters];
    [pref setObject:temp forKey:@"paramsarray"];
    NSLog(@"SAVED");
    [pref synchronize];
}

- (IBAction)buttonPressed:(Checkbox *)sender
{
    if ([[self.parameters objectAtIndex:5] objectAtIndex:sender.tag]==[NSNumber numberWithInt:1]){
        [sender setSelected:NO];
        //if(self.partyIndex>=0){
            NSMutableArray *doneArray = [self.parameters objectAtIndex:5];
        
        [doneArray replaceObjectAtIndex:sender.tag withObject:[NSNumber numberWithInt:0]];
            [self.parameters replaceObjectAtIndex:5 withObject:doneArray];}
    //}
    else{
        [sender setSelected:YES];
        //if(self.partyIndex>=0){
            NSMutableArray *doneArray = [[self.parameters objectAtIndex:5] mutableCopy];
        [doneArray replaceObjectAtIndex:sender.tag withObject:[NSNumber numberWithInt:1]];
            [self.parameters replaceObjectAtIndex:5 withObject:doneArray];}
   // }
    if (self.partyIndex>=0){NSUserDefaults *pref = [NSUserDefaults standardUserDefaults];
       // [[pref objectForKey:@"paramsarray"] replaceObjectAtIndex:self.partyIndex withObject:self.parameters];
    NSMutableArray *temp = [[pref objectForKey:@"paramsarray"] mutableCopy];
    [temp replaceObjectAtIndex:self.partyIndex withObject:self.parameters];
        [pref setObject:temp forKey:@"paramsarray"];
        [pref synchronize];
    }
}

-(void) viewWillDisappear:(BOOL)animated
{
    if (self.partyIndex >= 0)
    {
        NSUserDefaults *pref = [NSUserDefaults standardUserDefaults];
        NSMutableArray *temp = [[pref objectForKey:@"paramsarray"] mutableCopy];
        [temp replaceObjectAtIndex:self.partyIndex withObject:self.parameters];
        [pref setObject:temp forKey:@"paramsarray"];
        [pref synchronize];
    }
}
- (IBAction)tickTouched:(Checkbox *)sender {
    //ARRUMAR
    [sender buttonTouched];
    if (self.partyIndex>=0){
        NSUserDefaults *pref = [NSUserDefaults standardUserDefaults];
        [(NSMutableArray *)[self.parameters objectAtIndex:5] setObject:[NSNumber numberWithInt:1] atIndexedSubscript:sender.tag];
    }
    //[[pref objectForKey:@"paramsarray"] setObject:self.parameters atIndex:self.partyIndex];
}
- (IBAction)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
