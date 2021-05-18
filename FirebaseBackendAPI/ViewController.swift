//
//  ViewController.swift
//  FirebaseBackendAPI
//
//  Created by Osaretin Idele on 16/05/2021.
//

import UIKit
import Firebase
import FirebaseFirestoreSwift

class ViewController: UIViewController {

    @IBOutlet weak var msgLbl: UILabel!
    @IBOutlet weak var msgLbl2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //
    }

    @IBAction func doAction(_ sender: Any) {
        let book = Book()
        book.author = "Author name"
        book.book_type = "Novel"
        book.publish_date =  Date()
        book.no_of_pages =  400
        book.publish_date =  Date()
        
        BackendAPI<Book>().save(book) { response in
            if let response = response, response {
                self.msgLbl.text = "New Book object successfuly saved"
            } else {
                self.msgLbl.text = "Unable to save Book object"
            }
        }
        
        var vehicle = Vehicle()
        vehicle.vehicle_type = "SUV"
        vehicle.vehicle_model = "Prado"
        vehicle.no_of_passengers =  7
        vehicle.purchase_date = Date()
        vehicle.create_date =  Date()
        
        BackendAPI<Vehicle>().save(vehicle) { res in
            if let res = res, res {
                self.msgLbl2.text = "New Vehicle object successfuly saved"
            } else {
                self.msgLbl2.text = "Unable to save Vehicle object"
            }
        }
        
        
        
        BackendAPI<Book>().get(docId: book.doc_id!) { retBook in
            if let retBook = retBook {
                self.msgLbl.text = "Successfully retrieved the saved Book object \(String(describing: book.doc_id))"
            } else {
                self.msgLbl.text = "Unable to retrieve the saved Book object"
            }
        }
        
        
        
        
        BackendAPI<Book>().update(book) { res in
            if let res = res, res {
                self.msgLbl.text = " Book object successfully updated"
            } else {
                self.msgLbl.text =  "Unable to update Book object"
            }
        }
        
        
        BackendAPI<Book>().delete(docId: book.doc_id!) { res in
            if let res = res, res {
                self.msgLbl.text = " Book object successfully deleted"
            } else {
                self.msgLbl.text =  "Unable to delete Book object"
            }
        }
    }
    
}

