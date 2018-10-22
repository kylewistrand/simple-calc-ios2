//
//  HistoryViewController.swift
//  simple-calc
//
//  Created by Kyle Wistrand on 10/21/18.
//  Copyright © 2018 Kyle Wistrand. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {

    @IBOutlet weak var historyScrollView: UIScrollView!
    
    // Inspiration: https://stackoverflow.com/a/49371360
    
    public var incomingData : [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let labelHeight = 80
        let labelWidth = 250

        var yPos = 10
        for i in stride(from: incomingData.count - 1, through: 0, by: -1) {
            let historyLabel = UILabel()
            
            historyLabel.text = incomingData[i]
            historyLabel.frame = CGRect( x:10, y:yPos, width:labelWidth, height: labelHeight)
            yPos += labelHeight
            
            historyScrollView.addSubview(historyLabel)
            // Inspiration: https://stackoverflow.com/a/2833702
            historyScrollView.contentSize = CGSize(width: labelWidth, height: labelHeight * incomingData.count)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
