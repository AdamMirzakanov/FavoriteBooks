//
//  BookFormTableViewController.swift
//  FavoriteBooks
//
//  Created by Adam on 11.06.2022.
//

import UIKit

class BookFormTableViewController: UITableViewController {
    
    var book: Book?

    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var authorTextField: UITextField!
    @IBOutlet var genreTextField: UITextField!
    @IBOutlet var lengthTextField: UITextField!
    
    init?(coder: NSCoder, book: Book?) {
        self.book = book
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        self.book = nil
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    }
    
    func updateView() {
        
        guard let book = book else { return }
        
        titleTextField.text = book.title
        authorTextField.text = book.author
        genreTextField.text = book.genre
        lengthTextField.text = book.length
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "UnwindToBookTable" else { return }
        let title = titleTextField.text ?? ""
        let author = authorTextField.text ?? ""
        let genre = genreTextField.text ?? ""
        let length = lengthTextField.text ?? ""
        
        book = Book(title: title, author: author, genre: genre, length: length)
    }
}
