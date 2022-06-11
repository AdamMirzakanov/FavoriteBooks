//
//  BookFormTableViewController.swift
//  FavoriteBooks
//
//  Created by Adam on 11.06.2022.
//

import UIKit

class BookFormTableViewController: UITableViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var genreTextField: UITextField!
    @IBOutlet weak var lengthTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func saveButton(_ sender: UIButton) {
        
    }
}
