//
//  SegmentedControl.swift
//  SegmentedControl
//
//  Created by Red Davis on 27/03/2018.
//  Copyright © 2018 Red Davis. All rights reserved.
//

import SnapKit
import UIKit


public final class SegmentedControl: UIControl
{
    // Public
    public var selectedButtonIndex: Int? {
        willSet(newValue)
        {
            if let currentSelectedButtonIndex = self.selectedButtonIndex
            {
                let currentSelectedButton = self.buttons[currentSelectedButtonIndex]
                currentSelectedButton.isSelected = false
            }
            
            if let newSelectedButtonIndex = newValue
            {
                let newSelectedButton = self.buttons[newSelectedButtonIndex]
                newSelectedButton.isSelected = true
            }
        }
        
        didSet
        {
            self.layoutBottomBorder(animated: true)
        }
    }
    
    // Private
    private var buttons = [UIButton]()
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        
        return view
    }()
    
    private let bottomBorder = UIView()
    private let currentSelectionBottomBorder = UIView()
    
    // MARK: Initialization
    
    public required init()
    {
        super.init(frame: CGRect.zero)
        
        self.tintColor = UIColor.black
        self.setContentHuggingPriority(.required, for: .vertical)
        self.setContentCompressionResistancePriority(.required, for: .vertical)
        
        // Container
        let container = UIView()
        self.addSubview(container)
        
        container.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().priority(999)
        }
        
        // Stack view
        container.addSubview(self.stackView)
        
        self.stackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        // Bottom border
        self.bottomBorder.backgroundColor = self.tintColor
        self.addSubview(self.bottomBorder)
        
        self.bottomBorder.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(0.5)
        }
        
        // Current selection border
        self.currentSelectionBottomBorder.backgroundColor = self.tintColor
        self.addSubview(self.currentSelectionBottomBorder)
        self.layoutBottomBorder(animated: false)
    }
    
    public required init?(coder aDecoder: NSCoder)
    {
        abort()
    }
    
    // MARK: Layout
    
    private func layoutBottomBorder(animated: Bool)
    {
        guard let unwrappedSelectedButtonIndex = self.selectedButtonIndex,
              self.buttons.count > 0 else
        {
            self.currentSelectionBottomBorder.isHidden = true
            return
        }
        
        self.currentSelectionBottomBorder.isHidden = false
        
        let layout = {
            let selectedButton = self.buttons[unwrappedSelectedButtonIndex]
            
            self.currentSelectionBottomBorder.snp.remakeConstraints { (make) in
                make.height.equalTo(1.0)
                make.bottom.equalToSuperview()
                make.width.equalToSuperview().dividedBy(self.buttons.count)
                make.left.equalTo(selectedButton)
            }
        }
        
        if animated
        {
            UIView.animate(withDuration: 0.25) {
                layout()
                self.layoutIfNeeded()
            }
        }
        else
        {
            layout()
        }
    }
    
    // MARK: Buttons
    
    public func addButton(title: String)
    {
        let button = UIButton(type: .custom)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17.0, weight: .regular)
        button.setTitleColor(self.tintColor, for: .selected)
        button.setTitleColor(self.tintColor.with(alpha: 0.6), for: .normal)
        button.tag = self.buttons.count
        button.addTarget(self, action: #selector(self.buttonTapped(_:)), for: .touchUpInside)
        self.buttons.append(button)
        
        // Update stack view
        self.stackView.addArrangedSubview(button)
        
        button.snp.makeConstraints { (make) in
            make.height.equalToSuperview()
        }
        
        // If this is the first button, mark it as selected
        if self.selectedButtonIndex == nil
        {
            self.selectedButtonIndex = 0
        }
        
        self.layoutBottomBorder(animated: false)
    }
    
    // MARK: Autolayout
    
    public override var intrinsicContentSize: CGSize {
        return CGSize(width: UIViewNoIntrinsicMetric, height: 40.0)
    }
    
    // MARK: UI
    
    public override func tintColorDidChange()
    {
        super.tintColorDidChange()
        
        self.currentSelectionBottomBorder.backgroundColor = self.tintColor
        self.bottomBorder.backgroundColor = self.tintColor.with(alpha: 0.6)
        
        for subview in self.subviews
        {
            subview.tintColor = self.tintColor
        }
    }
    
    // MARK: Actions
    
    @objc private func buttonTapped(_ sender: Any)
    {
        guard let button = sender as? UIButton else
        {
            return
        }
        
        self.selectedButtonIndex = button.tag
        self.sendActions(for: .valueChanged)
    }
}
