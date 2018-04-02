//
//  ViewController.swift
//  Demo
//
//  Created by Red Davis on 27/03/2018.
//  Copyright © 2018 Red Davis. All rights reserved.
//

import SegmentedControl
import SnapKit
import UIKit


internal final class ViewController: UIViewController
{
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let segmentedControl = SegmentedControl()
        segmentedControl.tintColor = UIColor.blue
        segmentedControl.addButton(title: "Button A")
        segmentedControl.addButton(title: "Button B")
        segmentedControl.addButton(title: "Button C")
        segmentedControl.addTarget(self, action: #selector(self.segmentedControlValueDidChange(_:)), for: .valueChanged)
        self.view.addSubview(segmentedControl)
        
        segmentedControl.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: Actions
    
    @objc private func segmentedControlValueDidChange(_ sender: Any)
    {
        
    }
}
