//
//  ViewController.swift
//  MultiComponentPickerViewExample
//
//  Created by Satyadev Chauhan on 19/07/19.
//  Copyright © 2019 Satyadev Chauhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var lblPickerSelection: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        picker.delegate = self
        picker.dataSource = self
        updateData()
    }
    
    func updateData() {
        let countrySelected = SampleData.countries[picker.selectedRow(inComponent: 0)]
        let stateNumberSelected = SampleData.points[picker.selectedRow(inComponent: 1)]
        lblPickerSelection.text = "\(countrySelected) has \(stateNumberSelected) olympic gold medals."
    }
}

//MARK:- UIPickerViewDataSource methods

extension ViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if component == 0 {
            return SampleData.countries.count
        }
        else {
            return SampleData.points.count
        }
    }
}

//MARK:- UIPickerViewDelegates methods

extension ViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100.0
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 60.0
    }
    
    // Using String
    /*func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        if component == 0 {
            return SampleData.countries[row]
        }
        else {
            return SampleData.points[row]
        }
    }*/
    
    // Using NSAttributedString
    /*func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {

        if component == 0 {
            return SampleData.countries[row].countryAttribute()
        }
        else {
            return SampleData.points[row].pointAttribute()
        }
    }*/
    
    // Using UIView
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {

        var label:UILabel

        if let newView = view as? UILabel{
            label = newView
        }
        else {
            label = UILabel()
        }
        
        if component == 0 {
            label.textColor = UIColor.red
            label.font = UIFont(name: "Helvetica", size: 16)
            label.text = SampleData.countries[row]
        }
        else {
            label.textColor = UIColor.green
            label.font = UIFont(name: "HelveticaNeue-Italic", size: 16)
            label.text = SampleData.points[row]
        }
        
        label.textAlignment = .left
        label.sizeToFit()

        return label
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        updateData()
    }
}

