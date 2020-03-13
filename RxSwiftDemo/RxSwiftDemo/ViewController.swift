//
//  ViewController.swift
//  RxSwiftDemo
//
//  Created by chao jie deng on 2020/3/13.
//  Copyright © 2020 chao jie deng. All rights reserved.
//  https://www.jianshu.com/p/f7d89f969ad7

import UIKit
import RxSwift
import RxCocoa
//import Combine
class ViewController: UIViewController {
    var tf: UITextField!
    var per: Person!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tap = UITapGestureRecognizer()
        let label = UILabel(frame: CGRect(x: 100, y: 50, width: 100, height: 40))
        label.text = "kd;w;w;w;w;;s"
        label.addGestureRecognizer(tap)
        label.isUserInteractionEnabled = true
        _ = tap.rx.event.subscribe(onNext: { [weak self](event) in
         print("tap the label")
            self?.tf.resignFirstResponder()
        }, onError: nil, onCompleted: nil, onDisposed: nil)
        self.view.addSubview(label)
        
        let btn = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 40))
        btn.setTitle("button", for: .normal)
        btn.backgroundColor = UIColor.blue
        self.view.addSubview(btn)
        _ =  btn.rx.tap.subscribe(onNext: { [weak self] in
            self?.view.backgroundColor = UIColor.orange
        }, onError: nil, onCompleted: nil, onDisposed: nil)

        
        let tf = UITextField(frame: CGRect(x: 100, y: 150, width: 200, height: 40))
        _ = tf.rx.text.subscribe(onNext: { (text) in
            print(text ?? "")
        }, onError: nil, onCompleted: nil, onDisposed: nil)
        self.view.addSubview(tf)
        self.tf = tf
        
        tf.borderStyle = .roundedRect
        let sc = UIScrollView(frame: CGRect(x: 0, y: 200, width: self.view.frame.width, height: 300))
        sc.contentSize = self.view.frame.size
        _ = sc.rx.contentOffset.subscribe(onNext: { [weak self] (point) in
            self?.view.backgroundColor = UIColor(red: point.y/255.0*0.8, green: point.y/255.0*0.3, blue: point.y/255.0*0.6, alpha: 1)
        }, onError: nil, onCompleted: nil, onDisposed: nil)
        self.view.addSubview(sc)
        sc.backgroundColor = UIColor.white
        
        
        let per = Person(name: "dcj")
        _ = per.rx.observeWeakly(String.self, "name").subscribe(onNext: { (new) in
            print(new ?? "")
        }, onError: nil, onCompleted: nil, onDisposed: nil)
        self.per = per
        
        
        _ = NotificationCenter.default.rx
        .notification(UIResponder.keyboardWillShowNotification)
            .subscribe(onNext: { (note) in
            print(note)
        }, onError: nil, onCompleted: nil, onDisposed: nil)
        
 

        
        let url = URL(string: "https://www.baidu.com")
        _ =  URLSession.shared.rx.response(request: URLRequest(url: url!)).subscribe(onNext: { (res, data) in
            print(data)
        }, onError: nil, onCompleted: nil, onDisposed: nil)
        
//        let timer = Observable<Int>.interval(1, scheduler: MainScheduler.instance)
//        _ = timer.subscribe(onNext: { (num) in
//            print("hello, \(num)")
//        }, onError: nil, onCompleted: nil, onDisposed: nil)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.per.name = "zxx"

    }

}

