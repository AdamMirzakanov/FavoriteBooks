import UIKit

class BookTableViewController: UITableViewController {
    
    var books: [Book] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath)

        let book = books[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = book.title
        content.secondaryText = book.description
        cell.contentConfiguration = content

        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            books.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

    // MARK: - Navigation
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
        
        
        // проверить id перехода
        // скастить до контроллера из которого происходит переход
        // получить доступ к свойству book
        guard let sourceViewController = segue.source as? BookFormTableViewController,
              let book = sourceViewController.book else { return }
        
        /// если переход туда был из ячейки
        //  получить индекс этой ячейки
        //  перезаписать по этому индексу элемент массива
        //  обновить ячейку по этому индексу
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            books[selectedIndexPath.row] = book
            tableView.reloadRows(at: [selectedIndexPath], with: .none)
            
        /// если переход туда был из кнопки +
        //  вычислить индекс новой ячейки в конце списка
        //  добавить в массив book
        //  добавить строку в таблицу
        } else {
            let newIndexPath = IndexPath(row: books.count, section: 0)
            books.append(book)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
    /*
     guard let source = segue.source as? BookFormTableViewController,
           let book = source.book else { return }
     
     if let indexPath = tableView.indexPathForSelectedRow {
         books.remove(at: indexPath.row)
         books.insert(book, at: indexPath.row)
         tableView.deselectRow(at: indexPath, animated: true)
     } else {
         books.append(book)
     }
     */
    
    
    @IBSegueAction func editBook(_ coder: NSCoder, sender: Any?) -> BookFormTableViewController? {
        
        guard let cell = sender as? UITableViewCell,
              let indexPath = tableView.indexPath(for: cell)
        else { return BookFormTableViewController(coder: coder, book: nil) }
        
        let book = books[indexPath.row]
        
        return BookFormTableViewController(coder: coder, book: book)
    }
    
    
}
