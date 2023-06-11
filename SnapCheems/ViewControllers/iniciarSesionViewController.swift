//
//  ViewController.swift
//  SnapCheems
//
//  Created by Aidan Silva on 1/06/23.
//

import UIKit
import FirebaseAuth
import GoogleSignIn
import Firebase
import FirebaseDatabase

class iniciarSesionViewController: UIViewController {
    

    func signIn(){
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        //Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config

        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { [unowned self] result, error in
          guard error == nil else {
            // ...
              return
          }

          guard let user = result?.user,
            let idToken = user.idToken?.tokenString
          else {
            // ...
              return
          }

          let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                         accessToken: user.accessToken.tokenString)

          // ...
        }
    }

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
       
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func IniciarSesionTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            print("Intentando Iniciar Sesion")
            if error != nil {
                print("Error de \(error)")
                
                // Mostrar una alerta indicando que el usuario no existe.
                let alerta = UIAlertController(title: "Error", message: "El usuario no existe o los datos ingresados son erróneos", preferredStyle: .alert)
                let btnOK = UIAlertAction(title: "Aceptar", style: .default)
                alerta.addAction(btnOK)
                self.present(alerta, animated: true, completion: nil)
            } else {
                print("Inicio de Sesion Exitoso")
                self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
            }
        }
    }

//    @IBAction func IniciarSesionTapped(_ sender: Any) {
//        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
//            print("Intentando Iniciar Sesion")
//            if error != nil{
//                print("Error de \(error)")
//                Auth.auth().createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!,completion: {(user,error) in
//                    print("Intentando crear un usuario")
//                    if error != nil {
//                        print("Se presento el siguiente error al crear el usuario: \(error)")
//                    }else{
//                        print("El usuario fue creado exitosamente")
//
//                        Database.database().reference().child("usuarios").child(user!.user.uid).child("email").setValue(user!.user.email)
//
//                        let alerta = UIAlertController(title: "Creacion de Usuario", message: "Usuario: \(self.emailTextField.text!) se creo correctamente.", preferredStyle: .alert)
//                        let btnOK = UIAlertAction(title: "Aceptar", style: .default, handler:
//                            { (UIAlertAction) in
//                            self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
//                        })
//                        alerta.addAction(btnOK)
//                        self.present(alerta, animated: true,completion: nil)
//                        //self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
//                    }
//                })
//            }else{
//                print("Inicio de Sesion Exitoso")
//                self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
//            }
//        }
//    }
    


    @IBAction func loginGoo(_ sender: Any) {
        //GIDSignIn.sharedInstance.signIn(withPresenting: self)
        signIn()
    }
    
}





