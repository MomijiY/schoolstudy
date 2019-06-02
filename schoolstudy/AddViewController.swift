//
//  AddViewController.swift
//  schoolstudy
//
//  Created by 吉川椛 on 2019/04/21.
//  Copyright © 2019 吉川椛. All rights reserved.
//

import UIKit

var TodoKobetsunonakami = [String]()

class AddViewController: ViewController {
    

    
    class AddController: UIViewController {
        
        //テキストフィールドの設定
        @IBOutlet weak var TodoTextField: UITextField!
        
        //追加ボタンの設定
        @IBAction func TodoAddButten(_ sender: Any) {
            //変数に入力内容を入れる
            TodoKobetsunonakami.append(TodoTextField.text!)
            //追加ボタンを押したらフィールドを空にする
            TodoTextField.text = ""
            //変数の中身をUDに追加
            UserDefaults.standard.set( TodoKobetsunonakami, forKey: "TodoList" )
        }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

}
