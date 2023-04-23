//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Evgeny Savin on 23.04.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile"
        self.view.backgroundColor = .lightGray
        // Do any additional setup after loading the view.
    }
    
    let profileHeaderView = ProfileHeaderView()
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.view.addSubview(profileHeaderView)
        profileHeaderView.frame = view.safeAreaLayoutGuide.layoutFrame
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
