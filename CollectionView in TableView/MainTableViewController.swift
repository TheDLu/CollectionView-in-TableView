//
//  MainTableViewController.swift
//  CollectionView in TableView
//
//  Created by Daryl Lu on 12/3/14.
//  Copyright (c) 2014 Daryl Lu. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var colorArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadData()
        
        self.tableView.estimatedRowHeight = 24
        self.tableView.rowHeight = UITableViewAutomaticDimension

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func loadData() {
        let numberOfTableViewRows = 20
        let numberOfCollectionViewCells = 15
        
        var mutableArray = NSMutableArray()
        
        for (var i = 0; i < numberOfTableViewRows; i++) {
            var colorArray = NSMutableArray()
            
            for (var j = 0; j < numberOfCollectionViewCells; j++) {
                var red: CGFloat = CGFloat(Int(arc4random()) % 255)
                var green: CGFloat = CGFloat(Int(arc4random()) % 255)
                var blue: CGFloat = CGFloat(Int(arc4random()) % 255)
                var color: UIColor = UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1.0)
                
                colorArray.addObject(color)
            }
            
            mutableArray.addObject(colorArray)
        }
        
        self.colorArray = mutableArray

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return colorArray.count
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colorArray[collectionView.tag].count
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("pictureCell", forIndexPath: indexPath) as PictureCollectionViewCell
        
        // Configure the cell
        var collectionArray: NSMutableArray = self.colorArray[collectionView.tag] as NSMutableArray
        var pictureUIColor = collectionArray[indexPath.item] as UIColor
        cell.pictureImageView.layer.backgroundColor = pictureUIColor.CGColor
        
        return cell
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tableCell", forIndexPath: indexPath) as MainTableViewCell

        // Configure the cell...
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 90, height: 120)
        
        cell.picturesCollectionView.delegate = self
        cell.picturesCollectionView.dataSource = self
        cell.picturesCollectionView.tag = indexPath.row

        return cell
    }

}
