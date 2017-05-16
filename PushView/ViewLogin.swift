//
//  ViewLogin.swift
//  PushView
//
//  Created by Vu Thanh Tung on 5/16/17.
//  Copyright © 2017 silverpear. All rights reserved.
//

import UIKit

class ViewLogin: UIViewController {

    @IBOutlet weak var tfUser: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    var users = ["tung": "1234",
                 "kien": "567",
                 "liem": "789"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func actionDangNhap(_ sender: UIButton) {
        if let password = users[tfUser.text!] {
            if password == tfPassword.text {
                print("Đăng nhập thành công.")
                let math = self.storyboard?.instantiateViewController(withIdentifier: "Math") as! ViewMath
                self.navigationController?.pushViewController(math, animated: true)
            } else {
                print("Mật khẩu không đúng.")
            }
        } else {
            print("Tài khoản không tồn tại.")
        }
    }
    
    @IBAction func actionDanhSach(_ sender: UIButton) {
        for user in users {
            print("Tên đăng nhập: \(user.0), mật khẩu: \(user.1)")
        }
    }
    
    @IBAction func actionThemUser(_ sender: UIButton) {
        let newUser = tfUser.text
        let newPass = tfPassword.text
        var existUser = false
        
        if (newUser!.isEmpty)||(newPass!.isEmpty) {
            print("Không đủ thông tin để tạo tài khoản")
            existUser = true
        } else if (newUser![newUser!.startIndex] == " ") {
            print("Tên người dùng không được bắt đầu bằng khoảng trắng")
            existUser = true
        } else {
            for name in users.keys {
                if name == newUser {
                    print("Tài khoản đăng nhập đã tồn tại")
                    existUser = true
                }
            }
        }
        
        if !existUser {
            print("Đã thêm tài khoản mới")
            users[newUser!] = newPass!
        }
    }
    
    @IBAction func actionXoaUser(_ sender: UIButton) {
        let delUser = tfUser.text
        let delPass = tfPassword.text
        var existUser = false
        
        if (delUser!.isEmpty)||(delPass!.isEmpty) {
            print("Không đủ thông tin để xóa tài khoản")
            existUser = false
        } else {
            for name in users.keys {
                if (name == delUser) {
                    existUser = true
                    break
                }
            }
        }
        
        if existUser {
            if delPass == users[delUser!] {
                print("Đã xóa tài khoản")
                users.removeValue(forKey: delUser!)
            } else {
                print("Không đúng mật khẩu")
            }
        } else {
            print("Tài khoản không tồn tại")
        }
    }
}
