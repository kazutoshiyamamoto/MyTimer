//
//  SettingViewController.swift
//  MyTimer
//
//  Created by home on 2018/01/26.
//  Copyright © 2018年 Swift-beginners. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    //UIPickerViewに表示するデータをArrayで作成
    let settingArray : [Int] = [10,20,30,40,50,60]
    
    // 設定値を覚えるキーを設定
    let settingKey = "timer_value"
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // timerSettingPickerのデリゲートとデータソースの通知先を指定
        timerSettingPicker.delegate = self
        timerSettingPicker.dataSource = self
        
        // UserDefaultsの取得
        let settings = UserDefaults.standard
        let timerValue = settings.integer(forKey: settingKey)
        
        // Pickerの選択を合わせる
        for row in 0..<settingArray.count {
            if settingArray[row] == timerValue {
                timerSettingPicker.selectRow(row, inComponent: 0, animated: true)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBOutlet weak var timerSettingPicker: UIPickerView!
    
    // 決定ボタンがタップされた時に実行される
    @IBAction func decisionButtonAction(_ sender: Any) {
        // 前画面に戻る
        _ = navigationController?.popViewController(animated: true)
    }
    
    // UIpickerViewの列数を設定
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //UIpickerViewの行数を取得
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return settingArray.count
    }
    
    // UIpickerViewの表示する内容を設定
    func pickerView(_ pickerView: UIPickerView, titleForRow row : Int, forComponent component: Int) -> String?{
    return String(settingArray[row])
    }
    
    // picker選択時に実行
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
      // UserDefaultsの設定
      let settings = UserDefaults.standard
      settings.setValue(settingArray[row], forKey: settingKey)
      settings.synchronize()
    }
}
