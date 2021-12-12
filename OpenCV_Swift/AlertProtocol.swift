//
//  AlertProtocol.swift
//  OpenCV_Swift
//
//  Created by Motoki Onayama on 2021/12/08.
//

import Foundation

/// UIViewControllerで使用する
protocol AlertViewController where Self: UIViewController {
    
    /// 成功
    /// - Parameter title: アラートのタイトル
    func success(title: String, message: String) -> Bool
    
    /// 失敗
    /// - Parameters:
    ///   - title: アラートのタイトル
    ///   - retry: 再実行ボタン（※ 文言が変わる場合は、引数にする）
    ///   - handler: 処理させたい内容を書く
    func failure(title: String, retry: String, handler: ((UIAlertAction) -> Void)?) -> Bool
    
    /// 画像保存確認アラート
    /// - Parameter handler: 呼ばれるか確認
    func saveToImage(handler: ((UIAlertAction) -> Void)?) -> Bool
    
}

extension AlertViewController {
    
    func success(title: String, message: String) -> Bool {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let cancel: UIAlertAction = UIAlertAction(title: "閉じる", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
        return true
    }
    
    func failure(title: String, retry: String, handler: ((UIAlertAction) -> Void)?) -> Bool {
        let alert = UIAlertController(title: title, message: "", preferredStyle: UIAlertController.Style.alert)
        let action: UIAlertAction = UIAlertAction(title: retry, style: UIAlertAction.Style.default, handler: handler)
        let cancel: UIAlertAction  = UIAlertAction(title: "閉じる", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(action)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
        return true
    }
    
    func saveToImage(handler: ((UIAlertAction) -> Void)?) -> Bool {
        let alert = UIAlertController(title: "変換画像を保存", message: "この画像を保存しますか？", preferredStyle: .alert)
        let save = UIAlertAction(title: "保存", style: .default, handler: handler)
        
        let cancel = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        
        alert.addAction(cancel)
        alert.addAction(save)
        
        self.present(alert, animated: true, completion: nil)
        return true
    }
}

/// UIVIewで使用する
protocol AlertView where Self: UIView {
    
    /// 成功
    /// - Parameter title: アラートのタイトル
    func success(title: String) -> Bool
    
    /// 失敗
    /// - Parameters:
    ///   - title: アラートのタイトル
    ///   - retry: 再実行ボタン（※ 文言が変わる場合は、引数にする）
    ///   - handler: 処理させたい内容を書く
    func failure(title: String, retry: String, handler: ((UIAlertAction) -> Void)?) -> Bool
}

extension AlertView {
    
    func success(title: String) -> Bool {
        let alert = UIAlertController(title: title, message: "", preferredStyle: UIAlertController.Style.alert)
        let cancel: UIAlertAction = UIAlertAction(title: "閉じる", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(cancel)
        let window = UIApplication.shared.windows.first { $0.isKeyWindow }
        window?.rootViewController?.present(alert, animated: true, completion: nil)
        return true
    }
    
    func failure(title: String, retry: String, handler: ((UIAlertAction) -> Void)?) -> Bool {
        let alert = UIAlertController(title: title, message: "", preferredStyle: UIAlertController.Style.alert)
        let action: UIAlertAction = UIAlertAction(title: retry, style: UIAlertAction.Style.default, handler: handler)
        let cancel: UIAlertAction  = UIAlertAction(title: "閉じる", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(action)
        alert.addAction(cancel)
        let window = UIApplication.shared.windows.first { $0.isKeyWindow }
        window?.rootViewController?.present(alert, animated: true, completion: nil)
        return true
    }
}

