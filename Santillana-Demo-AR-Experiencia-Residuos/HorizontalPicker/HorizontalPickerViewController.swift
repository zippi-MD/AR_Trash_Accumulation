//
//  ViewController.swift
//  Santillana-Demo-AR-Experiencia-Residuos
//
//  Created by Alejandro Mendoza on 6/10/19.
//  Copyright © 2019 Alejandro Mendoza. All rights reserved.
//

import UIKit

class HorizontalPickerViewController: UIViewController {
    
    private var picker: UIPickerView!
    private var selectorIndicatorView: UIView!
    private var suffixLabel: UILabel!
    
    var values: [Int]! {
        didSet{
            updatePickerData()
        }
    }
    private var singularSuffix: String! {
        didSet{
            updatePickerData()
        }
    }
    
    private var pluralSuffix: String! {
        didSet{
            updatePickerData()
        }
    }
    
    var delegate: HorizontalPickerDelegate?
    
    private let rotationAngle: CGFloat = 90 * (.pi/180)
    
    private let viewHeight = 150
    private let viewWidth = 250
    private let viewCornerRadius = CGFloat(10)
    
    private let pickerRowHeight = CGFloat(120)
    
    private let numberLabelWidth = 100
    private let numberLabelHeight = 100
    
    private let indicatorBorderWidth = CGFloat(5)
    
    private let viewBackgroundColor = UIColor.darkGray.withAlphaComponent(0.7)
    private let textColor = UIColor.white
    
    private let numberTextFont = UIFont(name: "PingFangTC-Semibold", size: 40)
    private let textFont = UIFont(name: "PingFangTC-Semibold", size: 25)
    
    private var massUnit: Mass?
    private var timeUnit: Time?
    
    init(values: [Int], unit mass: Mass){
        self.values = values
        self.massUnit = mass
        self.timeUnit = nil
        (singularSuffix!, pluralSuffix!) = getSuffixesFor(mass)
        super.init(nibName: nil, bundle: nil)
    }
    
    init(values: [Int], unit time: Time){
        self.values = values
        self.timeUnit = time
        self.massUnit = nil
        (singularSuffix!, pluralSuffix!) = getSuffixesFor(time)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = UIView(frame: CGRect(x: Int(-viewCornerRadius / 2), y: 0, width: viewWidth, height: viewHeight))
        self.view.backgroundColor = viewBackgroundColor
        view.layer.cornerRadius = viewCornerRadius
        
        setupPicker()
        setupSelectorIndicatorView()
        setupSuffixLabel()
    }
    
    private func setupPicker(){
        picker = UIPickerView(frame: CGRect(x: 60, y: Int(-pickerRowHeight/2), width: viewHeight - 20, height: viewWidth))
        picker.dataSource = self
        picker.delegate = self
        
        picker.showsSelectionIndicator = false
        picker.transform = CGAffineTransform(rotationAngle: rotationAngle)
        
        self.view.addSubview(picker)
    }
    
    private func setupSuffixLabel(){
        let suffixLabelHeight = viewHeight/3
        suffixLabel = UILabel(frame: CGRect(x: 0, y: 0, width: Int(pickerRowHeight), height: suffixLabelHeight))
        
        let pickerCenterInViewCoordinates = view.convert(picker.center, to: view)
        
        suffixLabel.center = CGPoint(x: pickerCenterInViewCoordinates.x, y: CGFloat(viewHeight - suffixLabelHeight/2 - Int(indicatorBorderWidth)))
        
        suffixLabel.text = singularSuffix
        suffixLabel.textColor = textColor
        suffixLabel.font = textFont
        suffixLabel.textAlignment = .center
        
        view.insertSubview(suffixLabel, at: 0)
        
    }
    
    
    private func setupSelectorIndicatorView(){
        let indicatorWidth = pickerRowHeight + indicatorBorderWidth
        selectorIndicatorView = UIView(frame: CGRect(x: 0, y: 0, width: Int(indicatorWidth), height: viewHeight - Int(indicatorBorderWidth)))
        selectorIndicatorView.isUserInteractionEnabled = false
        selectorIndicatorView.center = CGPoint(x: picker.center.x, y: picker.center.y + indicatorBorderWidth*2)
        selectorIndicatorView.layer.borderWidth = indicatorBorderWidth
        selectorIndicatorView.layer.borderColor = textColor.cgColor
        selectorIndicatorView.layer.cornerRadius = 5
        
        view.addSubview(selectorIndicatorView)
        
    }
    
    override func didMove(toParent parent: UIViewController?) {
        view.center.y = parent!.view.center.y
    }
    
    private func updatePickerData(){
        if let picker = picker{
            picker.reloadAllComponents()
        }
    }
    
    //MARK: - Public Methods
    func getActualPickerValue() -> (Int, Any){
        let value = values[picker.selectedRow(inComponent: 0)]
        
        if let time = timeUnit {
            return(value, time)
        }
        else {
            return(value, massUnit!)
        }
    }
    
}

extension HorizontalPickerViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return values.count
    }
    
    
}

extension HorizontalPickerViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row == 0 {
            suffixLabel.text = singularSuffix
        }
        else {
            suffixLabel.text = pluralSuffix
        }
        
        if let time = timeUnit{
            delegate?.pickerDidChangedValueTo(values[row], withUnit: time)
            return
        }
        if let mass = massUnit {
            delegate?.pickerDidChangedValueTo(values[row], withUnit: mass)
            return
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return pickerRowHeight
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let numberLabel = UILabel(frame: CGRect(x: 0, y: 0, width: numberLabelWidth, height: numberLabelHeight))
        numberLabel.text = "\(values[row])"
        numberLabel.textColor = textColor
        numberLabel.textAlignment = .center
        numberLabel.font = numberTextFont
        numberLabel.transform = CGAffineTransform(rotationAngle: -rotationAngle)
        
        return numberLabel
        
    }
}


