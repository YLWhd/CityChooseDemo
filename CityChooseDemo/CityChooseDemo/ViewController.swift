//
//  ViewController.swift
//  CityChooseDemo
//
//  Created by 袁利伟 on 17/5/8.
//  Copyright © 2017年 ylifegroup. All rights reserved.
//

import UIKit

let ScreenWidth: CGFloat = UIScreen.main.bounds.width
let ScreenHeight: CGFloat = UIScreen.main.bounds.height
class ViewController: UIViewController {

    lazy var cityInputView: UITextField = {
        let view = UITextField()
        view.borderStyle = UITextBorderStyle.line
        view.placeholder = "地址选择"
        view.addTarget(self, action: #selector(self.beginEdit), for: UIControlEvents.editingDidBegin)
        return view
    
    }()
    
    private lazy var addressPickerView: AddressCityPickerView = {
        let view = AddressCityPickerView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 220))
        view.delegate = self
        return view
    }()
    
    private lazy var ypbinputAccessoryView: YPBInputAccessoryView = {
        let inputAccessoryView = YPBInputAccessoryView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 44))
        inputAccessoryView.cancleBtn.addTarget(self, action: #selector(self.didClickEndEditing(btn:)), for: UIControlEvents.touchUpInside)
        inputAccessoryView.doneBtn.addTarget(self, action: #selector(self.didClickEndEditing(btn:)), for: UIControlEvents.touchUpInside)
        return inputAccessoryView
    }()
    
    override internal var inputAccessoryView : UIView? {
        return ypbinputAccessoryView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    func setUI() {
        
        view.addSubview(cityInputView)
        cityInputView.frame = CGRect(x: 10, y: 50, width: ScreenWidth-20, height: 44)
        cityInputView.inputView = addressPickerView
        
        
    }
    
    func beginEdit() {
//        addressPickerView.locationDescribe = 
    }
    
    @objc private func didClickEndEditing(btn:UIButton) {
        cityInputView.resignFirstResponder()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: AddressCityPickerViewDelegate {
    
    func addressCityPickerView(view: AddressCityPickerView, cityDidChange province: String, city: String, area: String) {
        
        cityInputView.text = province + " " + city + " " + area
        
    }
    
}

