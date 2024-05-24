//
//  ShoppingTableViewController.swift
//  Assignmnet_240523
//
//  Created by 김상규 on 5/23/24.
//

import UIKit

class ShoppingTableViewController: UITableViewController {

    @IBOutlet var textField: UITextField!
    @IBOutlet var addButton: UIButton!
    
    var list = [Shopping(product: "치킨", check: false, star: true), Shopping(product: "대파", check: true, star: false), Shopping(product: "맥주", check: true, star: true), Shopping(product: "코카콜라 제로", check: false, star: false)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "쇼핑"
        
        tableView.rowHeight = 80
        
        configureTextField()
        configureAddButton()
        addButton.addTarget(self, action: #selector(addProduct), for: .touchUpInside)
    }
    
    func configureTextField() {
        textField.borderStyle = .roundedRect
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        textField.leftViewMode = .always
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 70, height: 0))
        textField.rightViewMode = .always
    }
    
    func configureAddButton() {
        addButton.setTitle("추가", for: .normal)
        addButton.setTitleColor(.black, for: .normal)
        addButton.backgroundColor = .lightGray
        addButton.tintColor = .white
        addButton.layer.cornerRadius = 7
    }
    
    // 셀 갯수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    // 셀 디자인
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Shopping") as! ShoppingTableViewCell
        
        // 테이블셀의 버튼 동작
        cell.checkButton.addTarget(self, action: #selector(checkProduct), for: .touchUpInside)
        
        cell.starButton.addTarget(self, action: #selector(starProduct), for: .touchUpInside)
        
        let data = list[indexPath.row]
        
        // 셀의 버튼 및 라벨 UI 설정
        cell.shoppingLabel.text = data.product
        cell.shoppingLabel.font = .systemFont(ofSize: 18)
        
        cell.checkButton.tag = indexPath.row
        cell.starButton.tag = indexPath.row
        
        let checkImage = data.check ? "checkmark.square.fill" : "checkmark.square"
        let starImage = data.star ? "star.fill" : "star"
        
        cell.checkButton.setTitle(nil, for: .normal)
        cell.checkButton.setImage(UIImage(systemName: checkImage), for: .normal)
        
        cell.starButton.setTitle(nil, for: .normal)
        cell.starButton.setImage(UIImage(systemName: starImage), for: .normal)
        
        
        return cell
    }

    @objc
    func addProduct() {
        let product = textField.text
        guard let p = product, p.count >= 2 else {
            textField.text = ""
            textField.placeholder = "한글자 이상 입력하세요"
            
            return
        }
        
        let shopping = Shopping(product: p, check: false, star: false)
        list.append(shopping)
        
        tableView.reloadData()
    }
    
    @objc
    func checkProduct(button: UIButton) {
        list[button.tag].check.toggle()
        
        tableView.reloadData()
    }
    
    @objc
    func starProduct(button: UIButton) {
        list[button.tag].star.toggle()
        
        tableView.reloadData()
    }
    
}


struct Shopping {
    let product: String
    var check: Bool
    var star: Bool
}
