//
//  ViewController.swift
//  Assignment4
//
//  Created by Aye Myat Minn on 8/31/19.
//  Copyright © 2019 Aye Myat Minn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var booksCollectionView: UICollectionView!
    
    let numberofItemPerRow:CGFloat = 3.0 //number of item per row
    let spacing:CGFloat = 16 //leading + trailling
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        booksCollectionView.delegate = self
        booksCollectionView.dataSource = self
        
        let nib = UINib(nibName: String(describing: BooksItemCollectionViewCell.self), bundle: nil)
        booksCollectionView.register(nib, forCellWithReuseIdentifier: String(describing: BooksItemCollectionViewCell.self))
        
        let totalPadding:CGFloat = numberofItemPerRow * spacing
        let itemWidth = (self.view.frame.width - totalPadding)/numberofItemPerRow
        
        let layout = booksCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 5
        layout.itemSize = CGSize(width: itemWidth, height: 322)
        
    }
}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: BooksItemCollectionViewCell.self)
            , for: indexPath) as! BooksItemCollectionViewCell
        return item
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
   
}

