//
//  GridTableViewCell.swift
//  Grocery
//
//  Created by Unholy Saint on 14/12/16.
//  Copyright © 2016 Ajit Horo. All rights reserved.
//

import UIKit

class GridTableViewCell: UITableViewCell {
    
    @IBOutlet weak var gridCollectionView: UICollectionView!
    var flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let nib = UINib(nibName: "GridCollectionViewCell", bundle: nil)
        self.gridCollectionView.register(nib, forCellWithReuseIdentifier: kCellCollectionGrid)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension GridTableViewCell {
    
    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate> (dataSourceDelegate: D, forRowSection rowSection: Int) {
        
        self.flowLayout.minimumInteritemSpacing = 1.0
        self.flowLayout.minimumLineSpacing = 1.0
        self.gridCollectionView.collectionViewLayout = self.flowLayout
        
        self.gridCollectionView.dataSource = dataSourceDelegate
        self.gridCollectionView.delegate = dataSourceDelegate
        self.gridCollectionView.tag = rowSection
        self.gridCollectionView.reloadData()
    }
}
