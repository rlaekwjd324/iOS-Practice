//
//  ViewController.swift
//  DBPractice
//
//  Created by 김다정 on 2020/07/22.
//  Copyright © 2020 김다정. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func getData(_ sender: Any) {
        self.textFieldTitle.text = UserDefaults.standard.object(forKey: "title") as? String
        self.textFieldContents.text = UserDefaults.standard.object(forKey: "contents") as? String
        
        self.textFieldTitle.isEnabled = false
        self.textFieldContents.isEnabled = false
        self.saveButton.isEnabled = false
    }
    
    @IBAction func insertData(_ sender: Any) {
        self.textFieldTitle.text = ""
        self.textFieldContents.text = ""
        self.textFieldTitle.isEnabled = true
        self.textFieldContents.isEnabled = true
        self.saveButton.isEnabled = true
        
        self.textFieldTitle.placeholder = "제목"
        self.textFieldContents.placeholder = "내용"
    }
    
    @IBAction func saveData(_ sender: Any) {
        UserDefaults.standard.set(self.textFieldTitle.text, forKey: "title")
        UserDefaults.standard.set(textFieldContents.text, forKey: "contents")
        
        self.showToast(message: "저장되었습니다.")
    }
    
    @IBOutlet weak var textFieldTitle: UITextField!
    @IBOutlet weak var textFieldContents: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textFieldTitle.isEnabled = false
        self.textFieldContents.isEnabled = false
        self.saveButton.isEnabled = false
    }

    
    func showToast(message : String) {
        let width_variable:CGFloat = 10
        let toastLabel = UILabel(frame: CGRect(x: width_variable, y: self.view.frame.size.height-300, width: view.frame.size.width-2*width_variable, height: 35))
        // 뷰가 위치할 위치를 지정해준다. 여기서는 아래로부터 100만큼 떨어져있고, 너비는 양쪽에 10만큼 여백을 가지며, 높이는 35로
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }

}

