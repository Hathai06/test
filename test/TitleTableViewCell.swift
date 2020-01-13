//
//  TitleTableViewCell.swift
//  test
//
//  Created by living mobile on 13/1/2563 BE.
//  Copyright © 2563 living mobile. All rights reserved.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
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
        if data.completed == true {
            descriptionLabel.textColor = .green
            
        }else{
            descriptionLabel.textColor = .red
            
        }
        
    }
}
