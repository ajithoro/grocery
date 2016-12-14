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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.automaticallyAdjustsScrollViewInsets = false
        self.tableViewGrocery.delegate = self
        self.tableViewGrocery.dataSource = self
        let gridCellNib: UINib = UINib(nibName: "GridTableViewCell", bundle: nil)
        self.tableViewGrocery.register(gridCellNib, forCellReuseIdentifier: kCellGrid)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: kCellGrid, for: indexPath) as? GridTableViewCell
            return cell!
        }
        return UITableViewCell()
    }
    
}

