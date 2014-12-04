//
//  MainTableViewCell.swift
//  CollectionView in TableView
//
//  Created by Daryl Lu on 12/3/14.
//  Copyright (c) 2014 Daryl Lu. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet var picturesCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
