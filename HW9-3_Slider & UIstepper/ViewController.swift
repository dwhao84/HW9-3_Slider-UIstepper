//
//  ViewController.swift
//  HW9-3_Slider & UIstepper
//
//  Created by Dawei Hao on 2023/4/5.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var shoesImageView: UIImageView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var modeLabel: UILabel!
    @IBOutlet weak var modeSwitch: UISwitch!
    @IBOutlet weak var shoesPageControl: UIPageControl!
    @IBOutlet weak var qtyStepper: UIStepper!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var shoesPriceLabel: UILabel!
    @IBOutlet weak var qtyLabel: UILabel!
    
    /* Set a array for shoes picture */
    let shoesPics = ["nikeCortez1", "nikeCortez2","nikeCortez3", "nikeCortez4"]
    
    /* Set up a initial value as 0 */
    var index = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        /* Set up ininital mode for mode Switch */
        modeSwitch.isOn = true
        
        /* let initial value show as below. */
        redLabel.text = "255"
        greenLabel.text = "255"
        blueLabel.text = "255"
        totalLabel.text = "0"
        qtyLabel.text = "0"
        
        //Purpose
        //Set up Slider's value in the begging
        redSlider.value = 255
        greenSlider.value = 255
        blueSlider.value = 255
        
        shoesPageControl.currentPage = 0
        
    }
    
    /* Purpose
     Use the Slider's value change the label's text */
    func labelTextToSlider () {
        redLabel.text = String(Int(redSlider.value))
        greenLabel.text = String(Int(greenSlider.value))
        blueLabel.text = String(Int(blueSlider.value))
    }
    
    
    /* Purpose
     Use the ImageView's background color to show different color. */
    @IBAction func colorChange(_ sender: Any) {
        //imageView的顏色變化用slider的移動做出顏色變化
        let backGroundColor =  UIColor(red: CGFloat(redSlider.value/255), green: CGFloat(greenSlider.value/255), blue:  CGFloat(blueSlider.value/255), alpha: 1)
        shoesImageView.backgroundColor = backGroundColor
        
        labelTextToSlider()
    }
    
    /* Purpose
     Use the random button to do the random color section */
    @IBAction func random(_ sender: Any) {
        //Slider數字用亂數並利用close range設定
        redSlider.value = Float.random(in: 0...255)
        blueSlider.value = Float.random(in: 0...255)
        greenSlider.value = Float.random(in: 0...255)
        
        let backGroundColor =  UIColor(red: CGFloat(redSlider.value/255), green: CGFloat(greenSlider.value/255), blue:  CGFloat(blueSlider.value/255), alpha: 1)
        shoesImageView.backgroundColor = backGroundColor
        labelTextToSlider()
        print("random sucess")
    }
    
    /* Purpose
     Use the pageControl to do the page change for show different shoes pics.*/
    @IBAction func pageChange(_ sender: UIPageControl) {
        index = sender.currentPage
        let display = shoesPics[index]
        print(index, display)
        shoesImageView.image = UIImage(named: display)
    }
    /* Add shoes pics for next page */
    @IBAction func nextPage(_ sender: Any) {
        index = ( index + 1 ) % shoesPics.count
        shoesImageView.image = UIImage(named:shoesPics[index])
        shoesPageControl.currentPage = index
        print("next")
    }
    /* Add shoes pics for previous page */
    @IBAction func prePage(_ sender: Any) {
        index = ( index + shoesPics.count - 1 ) % shoesPics.count
        shoesImageView.image = UIImage(named:shoesPics[index])
        shoesPageControl.currentPage = index
        print("previous")
    }
    /*
     1.Add qty for UILabel after click the UIstepper
     2.Add shoesPriceLabel muilt PriceLabel equals totalPriceLabel
     */
    @IBAction func qtyOrder(_ sender: UIStepper) {
        let price = 3100.0
        qtyLabel.text = Int(sender.value).description
        let qty = Double(qtyLabel.text!)
        totalLabel.text = String(qty! * price)
        print("count")
    }
    
    /* Use the Switch to control the slider's function.
     Lock the Slider & Label's value, also update the label.text value.
     */
    @IBAction func modeChange(_ sender: UISwitch) {
        if modeSwitch.isOn == false {
            redLabel.text = "0"
            greenLabel.text = "0"
            blueLabel.text = "0"
            /* Adjust the maximum to 0,Slider's value can not be change*/
            redSlider.maximumValue = 0
            greenSlider.maximumValue = 0
            blueSlider.maximumValue = 0
            labelTextToSlider()
        } else if modeSwitch.isOn == true {
            redLabel.text = "255"
            greenLabel.text = "255"
            blueLabel.text = "255"
            /* Adjust the maximum to 255*/
            redSlider.maximumValue = 255
            greenSlider.maximumValue = 255
            blueSlider.maximumValue = 255
            labelTextToSlider()
        }
    }
}
