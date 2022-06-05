import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var UsuarioTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    let aviso:String = "AVISO"
    let OK:String = "Entendido"
    
    let usuarioFijo = "pepe"
    let passFija = "12345"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTapIngresar(_ sender: Any) {
        
        guard let usuario = UsuarioTextField.text, usuario.count > 0 else {
            alertaAviso(tituloAlerta: aviso, mensaje: "Usuario es requerido", tituloOK: OK)
            return
        }
        
        guard let password = PasswordTextField.text, password.count > 0 else {
            alertaAviso(tituloAlerta: aviso, mensaje: "Password es requerida", tituloOK: OK)
            return
        }
        
        if usuario != usuarioFijo || password != passFija {
            self.navigationController?.popToRootViewController(animated: true)
        }
        
    }
    
    
    func alertaAviso (tituloAlerta:String, mensaje:String, tituloOK:String)
    {
        let alert = UIAlertController(title: tituloAlerta, message: mensaje, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: tituloOK, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert,animated: true, completion: nil)
    }

}
