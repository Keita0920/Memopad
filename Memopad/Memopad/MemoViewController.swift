//
//  MemoViewController.swift
//  Memopad
//
//  Created by K I on 2022/08/26.
//

import UIKit

class MemoViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet var titleTextField:UITextField!
    @IBOutlet var contentTextField:UITextView!
    
    var saveData:UserDefaults=UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        titleTextField.text=saveData.object(forKey: "title")as? String
        contentTextField.text=saveData.object(forKey: "content")as? String
        titleTextField.delegate=self
    }
    
    @IBAction func saveMemo(){
        saveData.set(titleTextField.text,forKey: "title")
        saveData.set(contentTextField.text,forKey: "content")
        
        let alert:UIAlertController=UIAlertController(title: "保存", message: "メモの保存が完了しました。", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK",style: .default,handler:{action in self.navigationController?.popViewController(animated: true)}))
        
        present(alert,animated:true,completion:nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
