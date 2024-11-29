//
//  TableViewController.swift
//  booksAPI
//
//  Created by Yernur Adilbek on 11/24/24.
//

import UIKit
import SVProgressHUD
import Alamofire
import SwiftyJSON

class TableViewController: UITableViewController, UISearchBarDelegate {
    
    var arrayBook = [BookItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let search = UISearchController()
        search.searchBar.delegate = self
        search.searchBar.placeholder = "Search Book"
        
        navigationItem.searchController = search
        
        searchBook(query: "Habit")
    }
    
    func searchBook(query: String){
        SVProgressHUD.show()
        
        let parameters = ["q": query, "key": "AIzaSyDjfBvQg31lI3irfByRyWbyOL80F4lNivw"]
        AF.request("https://www.googleapis.com/books/v1/volumes", method: .get, parameters: parameters).responseData { response in
            SVProgressHUD.dismiss()
            
            if response.response?.statusCode == 200{
                let json = JSON(response.data!)
                if let array = json["items"].array {
                    for item in array{
                        let book = BookItem(json: item)
                        self.arrayBook.append(book)
                    }
                }
                self.tableView.reloadData()
            }
        }
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        arrayBook.removeAll()
        tableView.reloadData()
        searchBook(query: searchBar.text!)
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayBook.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell

        // Configure the cell...
        cell.setData(book: arrayBook[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DescriptionVC") as! DescriptionViewController
        vc.book = arrayBook[indexPath.row]
        navigationController?.show(vc, sender: self)
    }

}
