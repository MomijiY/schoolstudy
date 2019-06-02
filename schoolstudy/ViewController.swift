//
//  ViewController.swift
//  schoolstudy
//
//  Created by 吉川椛 on 2019/04/20.
//  Copyright © 2019 吉川椛. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource,UITableViewDelegate,UITableViewDataSource {
    
    //UITableView、numberOfRowsInSectionの追加(表示するcell数を決める)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //戻り値の設定(表示するcell数)
        return TodoKobetsunonakami.count
    }
    
    //UITableView、cellForRowAtの追加(表示するcellの中身を決める)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //変数を作る
        let TodoCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        //変数の中身を作る
        TodoCell.textLabel!.text = TodoKobetsunonakami[indexPath.row]
        //戻り値の設定（表示する中身)
        return TodoCell
    }
    
    
    
    
    //スクリーンサイズの取得
    let screenSize = UIScreen.main.bounds.size
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    var printingImage: UIImage?
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return dataList.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return dataList[row]
    }
    
    
    
    
    
    @IBOutlet var pickerView: UIPickerView! //科目のpicker
    
    var dataList = [
        "数学", "国語", "英語", "理科", "社会",
        "音楽", "技術・家庭科", "保健・体育", "美術",
        "書道", "道徳", "聖書", "塾", "その他", "プログラミング",
        ]
    
    var seconds = 30
    var timer = Timer()
    
    @IBAction func startbutton(_ sender: Any) {  //タイマーのstartボタン
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        timepicker.isHidden = true
        timehyouji.isHidden = false
        
    }
    
    
    @IBAction func stopbutton(_ sender: Any) {  //タイマーのstopボタン
        if timer.isValid == true {  //もしタイマーが動いていたら
            timer.invalidate()      //タイマーを止める
            timepicker.isHidden = false
            timehyouji.isHidden = true
        }
        
        timer.invalidate()
        seconds = 30
        
    }
    
    
    @objc func updateTimer() {
        
        func timeString(time:TimeInterval) -> String {
            
            let hours = Int(time) / 3600
            let minutes = Int(time) / 60 % 60
            let seconds = Int(time) % 60
            
            return String(format: "%2d:%02d:%02d", hours,minutes,seconds)
            
        }
        
        
        timepicker.setDate(timepicker.date - 1, animated: true)
        
        
        if seconds == 0 {
            timer.invalidate()
           
        }
        
        
    }
    
    @IBOutlet weak var scSegment: UISegmentedControl!  //viewのセグメントコントロール
    
    var stopwatchtimer = Timer()                 // Timerクラス
    var startTime: TimeInterval = 0     // Startボタンを押した時刻
    var elapsedTime: Double = 0.0       // Stopボタンを押した時点で経過していた時間
    var time : Double = 0.0             // ラベルに表示する時間
    
    @IBOutlet weak var labelStopwatch: UILabel!     // タイムを表示するラベル
    
    @IBOutlet weak var buttonStart: UIButton!   // Startボタン
    @IBOutlet weak var buttonStop: UIButton!    // Stopボタン
    @IBOutlet weak var buttonReset: UIButton!   // Resetボタン
    
    //<--->//
    
    
    // Startボタンを押した時の処理
    @IBAction func tapStart() {
        
        buttonStart.isEnabled = false
        buttonReset.isEnabled = false
        
        buttonStop.isEnabled = true
        
        startTime = Date().timeIntervalSince1970
        // 0.01秒おきに関数「update」を呼び出す
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        
        buttonStart.layer.cornerRadius = 10
    }
    
    // 0.01秒ごとに呼び出される処理
    @objc func update() {
        // 経過時間は以下の式で計算する
        // (現在の時刻 - Startボタンを押した時刻) + Stopボタンを押した時点で経過していた時刻
        time = Date().timeIntervalSince1970 - startTime + elapsedTime
        // 時間を小数点前後で分割(小数点以下は2桁だけ取得)
        let sec = Int(time)
        
        // 「XX:XX:XX」形式でラベルに表示する
        let displayStr = NSString(format: "%2d:%02d:%02d", sec/3600, (sec/60)%60, sec%60) as String
        labelStopwatch.text = displayStr
    }
    
    // Stopボタンを押した時の処理
    @IBAction func tapStop() {
        
        buttonStop.layer.cornerRadius = 10
        
        // Startボタン、Resetボタンを有効化
        buttonStart.isEnabled = true
        buttonReset.isEnabled = true
        // Stopボタンを無効化
        buttonStop.isEnabled = false
        // タイマー処理を止める
        timer.invalidate()
        // 再度Startボタンを押した時に加算するため、これまでに計測した経過時間を保存
        elapsedTime = time
        
    }
    
    // Resetボタンを押した時の処理
    @IBAction func tapReset() {
        
        buttonReset.layer.cornerRadius = 100
        // 経過時間、ラベルを初期化する
        elapsedTime = 0.0
        labelStopwatch.text = "00:00:00"
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //追加画面で入力した内容を取得する
        if UserDefaults.standard.object(forKey: "TodoList") != nil {
            TodoKobetsunonakami = UserDefaults.standard.object(forKey: "TodoList") as! [String]
        }
        
        
        
        // PickerView のサイズと位置
        pickerView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 300)
        
        
        // PickerViewはスクリーンの中央に設定
        pickerView.center = self.view.center
        
        // Delegate設定
        pickerView.delegate = self
        pickerView.dataSource = self
        
        
        reset.isHidden = true
        start.isHidden = true
        stop.isHidden = true
        timerstart.isHidden = true
        timerstop.isHidden = true
        timerLabel.isHidden = true
        stopwatchlabel.isHidden = true
        timepicker.isHidden = true
        timehyouji.isHidden = true
        
    }
    
    @IBOutlet weak var reset: UIButton!               //ストップウォッチ（リセット）
    @IBOutlet weak var start: UIButton!               //ストップウォッチ（スタート）
    @IBOutlet weak var stop: UIButton!                //ストップウォッチ（ストップ）
    @IBOutlet weak var timerstart: UIButton!          //タイマー（スタート）
    @IBOutlet weak var timerstop: UIButton!           //タイマー（ストップ）
    @IBOutlet weak var stopwatchlabel: UILabel!       //ストップウォッチ（00:00:00）
    @IBOutlet weak var manualpicker: UIDatePicker!    //手動入力(時間のピッカー)
    @IBOutlet weak var timepicker: UIDatePicker!    //タイマーピッカー
    
    @IBAction func resetbutton(_ sender: Any) {   //ストップウォッチ
    }
    
    @IBAction func startbutton1(_ sender: Any) {   //ストップウォッチ
    }
    
    @IBAction func stopbutton2(_ sender: Any) {    //ストップウォッチ
    }
    
    @IBOutlet weak var timerLabel: UILabel!       //ストップウォッチ
    
    @IBAction func StartButton(_ sender: Any) {   //タイマー
    }
    
    @IBAction func StopButton(_ sender: Any) {    //タイマー
    }
    
    
    @IBOutlet weak var manualsublabel: UILabel!        //教科を表示するラベル（pickerに対応するラベル）
    
    
    @IBAction func manualpicker(_ sender: Any) {    //時間のpicker
    }
    
    
    
    @IBOutlet weak var manuallabel3: UILabel!  //科目pickerに対応させるlabel
    
    @IBOutlet weak var manualpicker2: UIPickerView!  //科目picker
    
    
    
    @IBAction func timepicker(_ sender: Any) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "00:00:00"
        
    }
    
    @IBOutlet weak var timehyouji: UILabel!   //タイム表示のラベル
    
    
    @IBAction func segmentButton() {
        
        
        switch scSegment.selectedSegmentIndex {
        case 0:
            
            reset.isHidden = true
            start.isHidden = true
            stop.isHidden = true
            timerstart.isHidden = true
            timerstop.isHidden = true
            timerLabel.isHidden = true
            stopwatchlabel.isHidden = true
            manualpicker.isHidden = false
         
            manualpicker2.isHidden = false
         
            manuallabel3.isHidden = false
           
            timepicker.isHidden = true
            timehyouji.isHidden = true
            
            
        case 1:
          
            reset.isHidden = false
            start.isHidden = false
            stop.isHidden = false
            timerstart.isHidden = true
            timerstop.isHidden = true
            timerLabel.isHidden = true
            stopwatchlabel.isHidden = false
            manualpicker.isHidden = true
            
            manualpicker2.isHidden = true
            
            manuallabel3.isHidden = true
            
            timepicker.isHidden = true
            timehyouji.isHidden = true
            
        case 2:
         
            reset.isHidden = true
            start.isHidden = true
            stop.isHidden = true
            timerstart.isHidden = false
            timerstop.isHidden = false
            timerLabel.isHidden = false
            stopwatchlabel.isHidden = true
            manualpicker.isHidden = true
      
            manualpicker2.isHidden = true
           
            manuallabel3.isHidden = true
          
            timepicker.isHidden = false
            timehyouji.isHidden = true
            
            
        default: break
            
        }
        
        
        
    }
    
    // UIPickerViewのRowが選択された時の挙動
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        
        manuallabel3.text = dataList[row]
    }
    
    
}






/*
 MARK: - Navigation
 
 In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 Get the new view controller using segue.destination.
 Pass the selected object to the new view controller.
 }
 */



