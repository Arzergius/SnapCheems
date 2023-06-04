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
            if error != nil{
                print("Error de \(error)")
            }else{
                print("Inicio de Sesion Exitoso")
            }
        }
    }
    


    @IBAction func loginGoo(_ sender: Any) {
        //GIDSignIn.sharedInstance.signIn(withPresenting: self)
        signIn()
    }
    
}





