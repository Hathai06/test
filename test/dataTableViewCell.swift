//
//  dataTableViewCell.swift
//  test
//
//  Created by living mobile on 13/1/2563 BE.
//  Copyright © 2563 living mobile. All rights reserved.
//

import UIKit

class dataTableViewCell: UITableViewCell {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageDataView: UIImageView!
    var modelData : Model? {
        didSet {
            
            setUp()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUp() {
        guard let data = modelData else {
            return
        }
        descriptionLabel.text = data.title
        imageDataView.performImageRequest(thumbnailUrl: data.thumbnailUrl)
        
    }
}
