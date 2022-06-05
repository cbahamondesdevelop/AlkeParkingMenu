import UIKit

class UserViewController: UIViewController {

    @IBOutlet weak var nombreTextField: UITextField!
    @IBOutlet weak var apellidoTextField: UITextField!
    @IBOutlet weak var usuarioTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repetirPassTextFiedl: UITextField!
    
    let aviso:String = "AVISO"
    let OK:String = "Entendido"
    
    var comun = Comunes()
    var manUser = ManagerUsuario()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onTapCrearUsuario(_ sender: Any) {
        
        guard let nombre = nombreTextField.text, nombre.count > 0 else {
            alertaAviso(tituloAlerta: aviso, mensaje: "Nombre es requerido", tituloOK: OK)
            return
        }

        guard let apellido = apellidoTextField.text, apellido.count > 0 else {
            alertaAviso(tituloAlerta: aviso, mensaje: "Apellido es requerido", tituloOK: OK)
            return
        }

        guard let usuario = usuarioTextField.text, usuario.count > 0 else {
            alertaAviso(tituloAlerta: aviso, mensaje: "Usuario es requerido", tituloOK: OK)
            return
        }
        
        guard let password = passwordTextField.text, password.count > 0 else {
            alertaAviso(tituloAlerta: aviso, mensaje: "Password es requerido", tituloOK: OK)
            return
        }
        
        guard let repetirPass = repetirPassTextFiedl.text, repetirPass.count > 0 else {
            alertaAviso(tituloAlerta: aviso, mensaje: "Repetir Password es requerido", tituloOK: OK)
            return
        }
        
        if password == repetirPass {
            
            let user = Usuarios(nombre: nombre, apellido: apellido, nomUsuario: usuario, password: password)
            
            manUser.insertarUsuario(per: user)
            imprimirAlertaRegistroSatisfactorio()
        }
        
    }
    
    func alertaAviso (tituloAlerta:String, mensaje:String, tituloOK:String)
    {
        let alert = UIAlertController(title: tituloAlerta, message: mensaje, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: tituloOK, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert,animated: true, completion: nil)
    }
    
    func imprimirAlertaRegistroSatisfactorio() {
        let alert = UIAlertController(title: "Registro satisfactorio", message: "Usuario creado correctamente", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default) { _ in
            print("El usuario le dio tap en el boton OK")
            
            self.navigationController?.popViewController(animated: true)

//            self.navigationController?.pushViewController(CONTROLLER, animated: <#T##Bool#>)
        }
        alert.addAction(alertAction)
        self.present(alert, animated: true)
    }
}
