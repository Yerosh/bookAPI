//
//  TableViewCell.swift
//  booksAPI
//
//  Created by Yernur Adilbek on 11/24/24.
//

import UIKit
import SDWebImage

class TableViewCell: UITableViewCell {

    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorsLabel: UILabel!
    @IBOutlet weak var publishedDateLabel: UILabel!
    @IBOutlet weak var averageRatingLabel: UILabel!
    @IBOutlet weak var ratingsCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(book: BookItem){
        bookImageView.sd_setImage(with: URL(string: book.thumbnailLink))
        titleLabel.text = book.title
        authorsLabel.text = book.authors
        publishedDateLabel.text = book.publishedDate
        averageRatingLabel.text = String(book.averageRating)
        ratingsCountLabel.text = String(book.ratingsCount)
    }

}
