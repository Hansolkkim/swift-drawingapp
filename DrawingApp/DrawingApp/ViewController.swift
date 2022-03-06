//
//  ViewController.swift
//  DrawingApp
//
//  Created by 김한솔 on 2022/02/28.
//

import UIKit
import OSLog

class ViewController: UIViewController {
    
    let plane = Plane()
    weak var generateRectangleButton: UIButton!
    weak var drawableAreaView: UIView!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var backgroundColorButton: UIButton!
    @IBOutlet weak var alphaSlider: UISlider!
    
    weak var touchedView: RectangleView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addGenerateRectangleButton()
        addDrawableAreaView()
        plane.generateRectangleViewDelegate = self
        plane.changeRectangleBackgroundColorDelegate = self
        
    }
    
    func addGenerateRectangleButton() {
        let buttonUIAction = UIAction { _ in
            let pointLimit = (Double(self.drawableAreaView.frame.width),
                              Double(self.drawableAreaView.frame.height))
            self.plane.addNewRectangle(in: pointLimit)
        }
        let generateButton = UIButton(type: .custom, primaryAction: buttonUIAction)
        let buttonWidth = 100.0
        let buttonHeight = 100.0
        let buttonX = (self.view.frame.size.width/2.0) - (buttonWidth/2.0)
        let buttonY = self.view.frame.size.height - buttonHeight
        generateButton.frame = CGRect(x: buttonX, y: buttonY, width: buttonWidth, height: buttonHeight)
        generateButton.backgroundColor = .gray
        generateButton.setTitle("사각형 생성", for: .normal)
        
        self.generateRectangleButton = generateButton
        self.view.addSubview(generateButton)
    }
    
    func addDrawableAreaView() {
        let drawableViewX = self.view.frame.origin.x
        let drawableViewY = self.view.frame.origin.y
        let drawableViewWidth = self.view.frame.width - self.statusView.frame.width
        let generateButtonHeight = 100.0
        let drawableViewHeight = self.view.frame.height - generateButtonHeight
        let drawableAreaView = UIView(frame: CGRect(x: drawableViewX, y: drawableViewY, width: drawableViewWidth, height: drawableViewHeight))
        drawableAreaView.clipsToBounds = true
        
        self.drawableAreaView = drawableAreaView
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewDidTouched(sender:)))
        drawableAreaView.addGestureRecognizer(tapGesture)
        
        self.view.addSubview(drawableAreaView)
    }
    
    @objc func viewDidTouched(sender: UITapGestureRecognizer) {
        guard let touchedView = self.view.hitTest(sender.location(in: drawableAreaView),
                                                  with: nil) as? RectangleView
        else { return }
        
        self.touchedView = touchedView
        updateSelectedView(touchedView)
        
        guard let specifiedRectangle = plane.specifyRectangle(id: touchedView.id) else { return }
        
        updateBackgroundButton(color: specifiedRectangle.backgroundColor, alpha: specifiedRectangle.alpha)
        updateAlphaSlider(alpha: specifiedRectangle.alpha)
        
    }
    
    func updateSelectedView(_ selectedView: RectangleView) {
        drawableAreaView.subviews.forEach { rectangleView in
            rectangleView.layer.borderWidth = 0
        }
        
        selectedView.layer.borderWidth = 3
        selectedView.layer.borderColor = UIColor.black.cgColor
        
    }
    
    private func updateBackgroundButton(color: BackgroundColor, alpha: Alpha) {
        backgroundColorButton.setTitle(color.hexCode, for: .normal)
        let buttonBackgroundColor = UIColor(red: color.r/255, green: color.g/255, blue: color.b/255, alpha: alpha.value)
        backgroundColorButton.backgroundColor = buttonBackgroundColor
    }
    
    private func updateAlphaSlider(alpha: Alpha) {
        alphaSlider.setValue(Float(alpha.value), animated: true)
    }
    
    @IBAction func backgroundButtonTouched(_ sender: UIButton) {
        guard let touchedView = self.touchedView else {
            return
        }
        plane.changeBackGroundColorOfRectangle(id: touchedView.id)
    }
}

extension ViewController: GenerateRectangleViewDelegate {
    func planeDidAddRectangle(_ rectangle: Rectangle) {
        os_log("\(rectangle)")
        
        let newRectangleView = ViewFactory.generateRectangleView(of: rectangle)
        self.drawableAreaView.addSubview(newRectangleView)
    }
}

extension ViewController: ChangeRectangleBackgroundColorDelegate {
    func rectangleDidChangeBackgroundColor(to newColor: BackgroundColor, alpha: Alpha) {
        backgroundColorButton.setTitle(newColor.hexCode, for: .normal)
        backgroundColorButton.backgroundColor = UIColor(red: newColor.r/255, green: newColor.g/255, blue: newColor.b/255, alpha: alpha.value)
        self.touchedView?.backgroundColor = UIColor(red: newColor.r/255, green: newColor.g/255, blue: newColor.b/255, alpha: alpha.value)
    }
}
