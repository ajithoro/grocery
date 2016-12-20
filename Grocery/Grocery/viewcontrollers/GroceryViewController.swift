//
//  ViewController.swift
//  Grocery
//
//  Created by Unholy Saint on 14/12/16.
//  Copyright © 2016 Ajit Horo. All rights reserved.
//

import UIKit

class GroceryViewController: BaseViewController {

    @IBOutlet weak var tableViewGrocery: UITableView!
    var gridItems: [GridItem] = [GridItem]()
    var allGridItems: [GridItem] = [GridItem]()
    var fourGridItems: [GridItem] = [GridItem]()
    var itemWidth: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.automaticallyAdjustsScrollViewInsets = false
        self.tableViewGrocery.delegate = self
        self.tableViewGrocery.dataSource = self
        let grocery = GridItem(imageName: "strawberry-filled-50", name: "Grocery")
        let fruitsVegetables = GridItem(imageName: "strawberry-filled-50", name: "Fruits & Vegetables")
        let neverRunOutSales = GridItem(imageName: "strawberry-filled-50", name: "Never Run Out Sales")
        let more = GridItem(imageName: "strawberry-filled-50", name: "More")
        let less = GridItem(imageName: "strawberry-filled-50", name: "Less")
        self.fourGridItems.append(grocery)
        self.fourGridItems.append(fruitsVegetables)
        self.fourGridItems.append(neverRunOutSales)
        self.fourGridItems.append(more)
        
        self.allGridItems.append(grocery)
        self.allGridItems.append(fruitsVegetables)
        self.allGridItems.append(neverRunOutSales)
        self.allGridItems.append(less)
        self.allGridItems.append(grocery)
        self.allGridItems.append(fruitsVegetables)
        self.allGridItems.append(neverRunOutSales)
        self.allGridItems.append(grocery)
        self.allGridItems.append(fruitsVegetables)
        self.allGridItems.append(neverRunOutSales)
        self.gridItems = self.fourGridItems
        
        self.itemWidth = (self.view.frame.width - 5.0)/4.0
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableViewGrocery.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func toggleMoreCell(toggle: Bool) {
        if toggle {
            self.gridItems = self.allGridItems
            self.tableViewGrocery.reloadData()
        } else {
            self.gridItems = self.fourGridItems
            self.tableViewGrocery.reloadData()
        }
    }
}

extension GroceryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return 0
    }
    
    /*func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Sectoin: \(section)"
    }*/
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0 {
            let cellSize = ceil((Double (self.gridItems.count) / 4.0))
            return CGFloat(cellSize) * (itemWidth + 2.0)
        }
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: kCellGrid, for: indexPath) as? GridTableViewCell
            return cell!
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let gridCell = cell as? GridTableViewCell else {
            return
        }
        gridCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRowSection: indexPath.section)
    }
    
}

extension GroceryViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView.tag == 0 {
            return 1
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0 {
            return self.gridItems.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCellCollectionGrid, for: indexPath) as? GridCollectionViewCell
            cell?.backgroundColor = UIColor.purple
            
            if let image = UIImage(named: self.gridItems[indexPath.row].imageName ?? "") {
                cell?.imageViewImage.image = image
            }
            cell?.labelName.text = self.gridItems[indexPath.row].name ?? ""
            return cell!
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 0 {
            if indexPath.row == 3 {
                if let cell = collectionView.cellForItem(at: indexPath) as? GridCollectionViewCell {
                    if cell.labelName.text == "More" {
                        self.toggleMoreCell(toggle: true)
                    } else {
                        self.toggleMoreCell(toggle: false)
                    }
                }
            }
        }
    }
}

extension GroceryViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.itemWidth, height: self.itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1.0, left: 1.0, bottom: 1.0, right: 1.0)
    }
}

