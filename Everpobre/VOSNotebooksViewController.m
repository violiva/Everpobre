//
//  VOSNotebooksViewController.m
//  Everpobre
//
//  Created by Vicente Oliva de la Serna on 4/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSNotebooksViewController.h"
#import "VOSNotebook.h"
#import "VOSNote.h"
#import "VOSNotesViewController.h"
#import "VOSNotebookTableViewCell.h"


@interface VOSNotebooksViewController ()

@end

@implementation VOSNotebooksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"Everpobre";
    
    // Añadimos botón para añadir nueva libreta.
    UIBarButtonItem * addBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                             target:self
                                                                             action:@selector( addNoteBook: )];
    
    self.navigationItem.rightBarButtonItem = addBtn;
    
    // Registramos el nib de la celda
    UINib * nib = [UINib nibWithNibName:@"VOSNotebookTableViewCell"
                                 bundle:[NSBundle mainBundle]];
    
    [self.tableView registerNib:nib forCellReuseIdentifier:[VOSNotebookTableViewCell cellId]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Nuestro controlador implementa ya por sí solo los números de secciones y filas en cada sección,
// pero debemos especificarle que tipo de celda queremos para cada fila recuperada.

-(UITableViewCell *) tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    // Averiguamos de qué libreta me hablan
    VOSNotebook * nb = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // creo una celda
    VOSNotebookTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:[VOSNotebookTableViewCell cellId]
                                                                      forIndexPath:indexPath];
    
    // La configuro ( sincronizo modelo y vista )
    cell.nameView.text = nb.name;
    cell.notesView.text = [NSString stringWithFormat:@"%lu", (unsigned long)nb.notes.count];
    
    /*
    static NSString * cellId = @"NotebookId";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil ){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:cellId];
    }
    
    // la configuro ( sincronizo modelo con vista )
    cell.textLabel.text = nb.name;
    NSDateFormatter * fmt = [NSDateFormatter new];
    fmt.dateStyle = NSDateFormatterShortStyle;
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ (%lu notes)", [fmt stringFromDate:nb.modificationDate], (unsigned long) nb.notes.count ];
    */
     
     
    // la devuelvo
    return cell;
    
}

-(CGFloat) tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [VOSNotebookTableViewCell height];
}


-(void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Averiguar si el usuario quiere definitivamente eliminar el registro
    if ( editingStyle == UITableViewCellEditingStyleDelete ){
        
        // borramos la libreta, pero ¿ cuál es ?
        NSManagedObjectContext * ctx = self.fetchedResultsController.managedObjectContext;
        VOSNotebook * difunto = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        [ctx deleteObject:difunto];
    }
}

// Personalización del título del botón que aparece con el gesto de deslizar a la izquierda. Por defecto viene como Delete.
-(NSString *) tableView:(UITableView *)tableView
titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"Remove";
}

#pragma mark - Delegate
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Averiguar cual fue la libreta seleccionada
    VOSNotebook * nb = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // Creo la selección de datos
    NSFetchRequest * r = [NSFetchRequest fetchRequestWithEntityName:[VOSNote entityName]];
    
    r.fetchBatchSize = 30;
    r.sortDescriptors = @[ [NSSortDescriptor sortDescriptorWithKey:VOSNoteAttributes.name
                                                         ascending:YES
                                                          selector:@selector(caseInsensitiveCompare:)],
                           [NSSortDescriptor sortDescriptorWithKey:VOSNoteAttributes.modificationDate
                                                         ascending:NO
                            ]];
    r.predicate = [NSPredicate predicateWithFormat:@"notebook == %@", nb];

    
    
    NSFetchedResultsController * fc = [[NSFetchedResultsController alloc] initWithFetchRequest:r
                                                                          managedObjectContext:self.fetchedResultsController.managedObjectContext
                                                                            sectionNameKeyPath:nil cacheName:nil];
    
    // Creamos una instancia de controlador de Notas
    VOSNotesViewController * nVC = [[VOSNotesViewController alloc] initWithFetchedResultsController:fc
                                                                                              style:UITableViewStylePlain];
    
    // Le asignamos su libreta para que lo sepa
    nVC.notebook = nb;
    
    // Lo pusheo
    [self.navigationController pushViewController:nVC
                                         animated:YES];
    
}


#pragma mark - Actions
-(void) addNoteBook:(id) sender{
    [VOSNotebook notebookWithName:@"Nueva libreta"
                          context:self.fetchedResultsController.managedObjectContext];
    
}



@end
