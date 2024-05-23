//
//  KakaoSettingTableViewController.swift
//  Assignmnet_240523
//
//  Created by 김상규 on 5/23/24.
//

import UIKit

class KakaoSettingTableViewController: UITableViewController {
    let sections = ["전체 설정", "개인 설정", "기타"]
    let allSettings = ["공지사항", "실험실", "버전 정보"]
    let personalSettings = ["개인/보안", "알림", "채팅", "멀티 프로필"]
    let etcSettings = ["고객센터/도움말"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // 섹션의 갯수
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    // 섹션의 타이틀
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return sections[section]
    }
    
    // 셀 갯수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return allSettings.count
        } else if section == 1 {
            return personalSettings.count
        } else if section == 2 {
            return etcSettings.count
        }
        
        return 0
    }
    
    // 셀 높이
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }

    // 셀 디자인
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell")!
        
        if indexPath.section == 0 {
            cell.textLabel?.text = "\(allSettings[indexPath.row])"
        } else if indexPath.section == 1 {
            cell.textLabel?.text = "\(personalSettings[indexPath.row])"
        } else if indexPath.section == 2 {
            cell.textLabel?.text = "\(etcSettings[indexPath.row])"
        }
        
        cell.textLabel?.font = .systemFont(ofSize: 13)

        return cell
    }
}
