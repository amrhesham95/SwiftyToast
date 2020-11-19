//
//  ToastView.swift
//  ToastDemo
//
//  Created by Amr Hesham on 11/19/20.
//  Copyright © 2020 VictoryLink. All rights reserved.
//

import UIKit
//MARK: - ToastView
class ToastView: UIView {
    
    //MARK: - Outlets
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet var parentView: UIView!
    
    //MARK: - Properties
    
    //MARK: - Init
    init() {
        super.init(frame: .zero)
        addAndFixContentView()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addAndFixContentView()
        configureView()
    }
    
    //MARK: - Handlers
    func addAndFixContentView() {
        Bundle.main.loadNibNamed(String(describing: ToastView.self), owner: self, options: [:])
        addSubview(parentView)
        parentView.frame = bounds
        parentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    static func showToast(to view:UIView) {
        let toastView = ToastView()
        toastView.frame = view.bounds
        view.addSubview(toastView)
        toastView.hideToast()
    }
    
    //TODO: enum has short, mid, long cases to determine the time of the toast shown
    func hideToast() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.removeFromSuperview()
        }
    }
    
}

//MARK: - Configure View
private extension ToastView {
    
    func configureView() {
        configureContentView()
        configureParentView()
    }
    func configureContentView() {
        contentView.alpha = 0.9
        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true
    }
    func configureParentView() {
        parentView.backgroundColor = .clear
        parentView.isUserInteractionEnabled = true
    }
}
