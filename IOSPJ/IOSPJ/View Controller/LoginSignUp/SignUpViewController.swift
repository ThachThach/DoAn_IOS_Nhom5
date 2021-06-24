//
//  SignUpViewController.swift
//  IOSPJ
//
//  Created by CNTT on 6/2/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!			
    @IBOutlet weak var errorLabel: UILabel!
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
            print("hihi")
        setUpElements()
    }
    
    func setUpElements() {
        
        //Hide the error lable
        errorLabel.alpha = 0
        //style the elements
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleHellowButton(signUpButton)
    }
    
    func validateFields() -> String? {
        //Check that all fields are filled in
        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Hay nhap day du thong tin"
        }
        
        //check if the password is secure
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            
            return "Vui long nhap lai password"
        }
        
        return nil
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
            let email = emailTextField.text
            let password = passwordTextField.text
            let name = "admin"
            let chucVu = "1"
            let calam = "fulltime"
            Auth.auth().createUser(withEmail: email!, password: password!){ (resuls, err) in
                let em = email as? String ?? ""
                var ref: DocumentReference? = nil
                ref = self.db.collection("nhanvien").addDocument(data: [
                    "calam": "\(calam)",
                    "chucvu": "\(chucVu)",
                    "tennhanvien": "\(name)",
                    "email": "\(em)"
                    
                ]){
                    err in
                    if let err = err {
                        print("Error adding document: \(err)")
                    } else {
                        print("Document added with ID: \(ref!.documentID)")
                    }
                }
                
                self.transitionToHome();
            }
    }
    
    /*
     Auth.auth().createUser(withEmail: "y@gmail.com", password: "123456") { authResult, error in
     // ...
     }
     */
    
    func showError(_ message:String){
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func transitionToHome(){
        
        let homeViewController =
            storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as? MainViewController
        homeViewController?.email = emailTextField?.text as? String ?? ""
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
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
