//
//  TableViewController.swift
//  ArchivosPdf
//
//  Created by User on 03/03/2019.
//  Copyright © 2019 User. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var contenidoCeldas = ["Ejercicios Tema 1",
                           "3 Estados y Metodos de Hilos en Java",
                           "Anatomía de un Tema WP",
                           "12_Sockets",
                           "5_Hilos_en_Android"]
    
    var nombrePdfSelecionado: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        

            super.viewDidLoad()
            navigationItem.leftBarButtonItem = editButtonItem
        
        
        
        
    }


    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contenidoCeldas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let nuevaCelda =  UITableViewCell(style: .default, reuseIdentifier: "Celda")
        
        nuevaCelda.textLabel?.text = contenidoCeldas[indexPath.row]
        
        return nuevaCelda
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let idSeleccionado = indexPath.row
        nombrePdfSelecionado =   contenidoCeldas[idSeleccionado]
        self.performSegue(withIdentifier: "seguePdf", sender: idSeleccionado)
    }
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("se va a borrar")
            // Delete the row from the data source
            contenidoCeldas.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let Vista3ViewController = segue.destination as? Vista3ViewController else {
            fatalError("Unexpected destination: \(segue.destination)")
        }
        //   guard let pdfSeleccionado = sender as? HomeCellTableViewCell else {
        //    fatalError("Unexpected sender: \(sender)")
        //   }
        
        // guard let indexPath = contenidoCeldas.indexPath(for: pdfSeleccionado) else {
        //   fatalError("The selected cell is not being displayed by the table")
        //  }
        
        //if let nombreP = shoes[indexPath.row]
        Vista3ViewController.nombrePdfRecibido = nombrePdfSelecionado
        
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
}


}
