//
//  verSnapViewController.swift
//  SnapCheems
//
//  Created by Aidan Silva on 18/06/23.
//

import UIKit
import SDWebImage
import Firebase

class verSnapViewController: UIViewController {

    var snap = Snap()
    @IBOutlet weak var uimageview: UIImageView!
    @IBOutlet weak var vermensajelbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vermensajelbl.text = "Mensaje: " + snap.descrip
        uimageview.sd_setImage(with: URL(string: snap.imagenURL), completed: nil)

        // Do any additional setup after loading the view.
    }
    override func viewWillDisappear(_ animated: Bool) {
        
        Database.database().reference().child("usuarios").child((Auth.auth().currentUser?.uid)!).child("snaps").child(snap.id).removeValue()
        
        Storage.storage().reference().child("imagenes").child("\(snap.imagenID).jpg").delete
        {  (error) in
            print("Se elimina la imagen correctamente")
        }
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

