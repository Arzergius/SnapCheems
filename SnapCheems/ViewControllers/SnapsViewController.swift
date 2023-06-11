//
//  SnapsViewController.swift
//  SnapCheems
//
//  Created by Aidan Silva on 7/06/23.
//

import UIKit

class SnapsViewController: UIViewController {

    @IBAction func cerrarSesionTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func plusimage(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        //self.performSegue(withIdentifier: "photopicker", sender: nil)
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
