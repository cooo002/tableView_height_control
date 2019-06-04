//
//  ListViewController.swift
//  Table-Cell-height
//
//  Created by 김재석 on 04/06/2019.
//  Copyright © 2019 김재석. All rights reserved.
//

import Foundation
import UIKit

class ListViewController: UITableViewController {
    var list = [String]() // String 타입의 자료가 저장될 수 있는 빈배열 선언하는 코드
    @IBAction func add(_ sender: Any) {
        let alert = UIAlertController(title: "목록 입력", message: "추가될 글을 입력하세요", preferredStyle: .alert)
        // todo 알림참 객체를 인스턴스화해서 실제 메모리에 올리고 실제화를 시킴
        alert.addTextField(){(tf) in // todo : 암림창에 입력 폼을 추가함(tf는 덱스트 필드 즉 입력 폼을 뜻함)
            tf.placeholder = "내용을 입력하세요"
            
        }
        let ok = UIAlertAction(title: "ok", style: .default){(_) in
            if let title = alert.textFields?[0].text{
// note 알림창에서는 하나 이상의 입력필드를 추가해줄 수 있는데 이 입력필드는 배열 형태로 처리된다.()
                self.list.append(title)
                self.tableView.reloadData()
                
            }
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        self.present(alert, animated: false)
        
        
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count // note: 이 메소드는 나중에 테이블 뷰에 셀이 생성될 때 자동을 호출되는데 이 때
        // note: 반환 되는 값 만큼 셀이 만들어지게된다
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell()
        // 프로토타입 셀로 "cell"이라는 identifier을 가지는 셀의 객체를 읽어온댜. 그러나 만약 해당 셀이 없다면 그냥 UITableViewCell()의 인스턴스가 cell에 저장된다.
        cell.textLabel?.numberOfLines = 0 // note: textLabel 객체 입력되는 행 수를 강제로 지정하는 속성이다()
        // note: 기본 값을 1이기 때문에 글이 아무리 길어도 한줄로만 표시된다. 그러나 이 값을 0 으로 바꿔주면 글자의 수가 많으면
        // note: 자동적으로 여러줄로 표시된다.
        cell.textLabel?.text = list[indexPath.row]
        
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        // 만들려는 셀의 높이를 결정하기 위해 셀의 높이는 반환하는 메소드이다
        let row = self.list[indexPath.row]
        
        let height = CGFloat(60 + (row.count/30)*20) // note 기본 높이 60 + 30자를 넘길때 만다 20을 더해준다
        return height // 위에서 만든 수가 만들고자 하는 셀의 높이로 반환된다.
    }
    
}
