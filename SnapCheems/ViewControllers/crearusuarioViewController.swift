//
//  crearusuarioViewController.swift
//  SnapCheems
//
//  Created by Aidan Silva on 11/06/23.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class crearusuarioViewController: UIViewController {

    @IBOutlet weak var lblpassword: UITextField!
    @IBOutlet weak var lblusuario: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnRegistrar(_ sender: Any) {
        guard let usuario = lblusuario.text, !usuario.isEmpty,
              let password = lblpassword.text, !password.isEmpty else {
            // Mostrar una alerta indicando que los campos están vacíos.
            let alerta = UIAlertController(title: "Error", message: "Por favor, ingresa un usuario y una contraseña válidos.", preferredStyle: .alert)
            let btnOK = UIAlertAction(title: "Aceptar", style: .default)
            alerta.addAction(btnOK)
            present(alerta, animated: true, completion: nil)
            return
        }
        
        Auth.auth().createUser(withEmail: usuario, password: password) { (authResult, error) in
            if let error = error {
                // Mostrar una alerta indicando el error al crear el usuario.
                let alerta = UIAlertController(title: "Error", message: "No se pudo crear el usuario: \(error.localizedDescription)", preferredStyle: .alert)
                let btnOK = UIAlertAction(title: "Aceptar", style: .default)
                alerta.addAction(btnOK)
                self.present(alerta, animated: true, completion: nil)
                return
            }
            
            // Usuario creado exitosamente.
            if let user = authResult?.user {
                // Puedes realizar acciones adicionales después de crear el usuario, como guardar información en la base de datos.
                // Por ejemplo, para guardar el email del usuario en la base de datos:
                let ref = Database.database().reference()
                ref.child("usuarios").child(user.uid).child("email").setValue(user.email)
                
                // Mostrar una alerta indicando el éxito de la creación del usuario.
                let alerta = UIAlertController(title: "Creación de Usuario", message: "El usuario se creó correctamente.", preferredStyle: .alert)
                let btnOK = UIAlertAction(title: "Aceptar", style: .default) { (UIAlertAction) in
                    // Realizar alguna acción después de que el usuario presiona Aceptar en la alerta, si es necesario.
                    // Por ejemplo, realizar una transición a otra vista.
                    self.navigationController?.popViewController(animated: true)
                }
                alerta.addAction(btnOK)
                self.present(alerta, animated: true, completion: nil)
            }
        }
    }

}

