//
//  DescriptionViewController.swift
//  booksAPI
//
//  Created by Yernur Adilbek on 11/24/24.
//

import UIKit

class DescriptionViewController: UIViewController {

    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorsLabel: UILabel!
    @IBOutlet weak var descriptionView: UITextView!
    
    var book: BookItem?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel.text = book!.title
        authorsLabel.text = book!.authors
        descriptionView.text = book!.description
        let secureThumbnailLink = book!.thumbnailLink.replacingOccurrences(of: "http://", with: "https://")
        bookImageView.sd_setImage(with: URL(string: secureThumbnailLink))
    }
    
    
    @IBAction func samplePressed(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        vc.readerLink = book!.webReaderLink
        navigationController?.show(vc, sender: self)
    }
    
}
