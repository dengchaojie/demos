//
//  ViewController.swift
//  SendMessageViaBluetooth
//
//  Created by chao jie deng on 2019/10/31.
//  Copyright © 2019 chao jie deng. All rights reserved.
//

import UIKit
import CoreBluetooth
import SVProgressHUD

class ViewController: UIViewController {
    let myTableV = UITableView.init()
    var dataSource = [CBPeripheral]()
    var cbManager: CBCentralManager?
    var peripheralConnected: CBPeripheral?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "连接手机"

        // Do any additional setup after loading the view.
        myTableV.frame = self.view.bounds
        self.view.addSubview(myTableV)
        myTableV.dataSource = self
        myTableV.delegate = self
        myTableV.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        cbManager = CBCentralManager.init(delegate: self, queue: DispatchQueue.main, options: [CBCentralManagerOptionShowPowerAlertKey:NSNumber.init(value: true)])
        
    }

    
    var sendMessageView: SendMessageView {
        let view = SendMessageView.init(frame: self.view.bounds)

        return view
        
    }
    

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let per = self.dataSource[indexPath.row]
        cell.textLabel?.text = per.name
        
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let per = self.dataSource[indexPath.row]
        self.cbManager?.connect(per, options: nil)
        self.cbManager?.stopScan()
    }
}

extension ViewController: CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .poweredOn:
            central.scanForPeripherals(withServices: nil, options: nil)
        case .poweredOff:
            SVProgressHUD.showInfo(withStatus: "请您打开手机蓝牙")
            
        default:
            break
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        print(peripheral.name as Any)
        self.dataSource.append(peripheral)
        self.myTableV.reloadData()
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        print("didConnect")
        peripheral.delegate = self
        self.peripheralConnected = peripheral
        guard self.sendMessageView.superview != nil else {
            return
        }
        self.view.addSubview(self.sendMessageView)
        self.sendMessageView.blockTouch = {
//            self.peripheralConnected.set
        }
    }
    
    
    
}

extension ViewController: CBPeripheralDelegate {
    
}


