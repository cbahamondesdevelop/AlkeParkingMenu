import Foundation
import UIKit

class Comunes:UIViewController {
    
    func alertaAviso (tituloAlerta:String, mensaje:String, tituloOK:String)
    {
        let alert = UIAlertController(title: tituloAlerta, message: mensaje, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: tituloOK, style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert,animated: true, completion: nil)
    }
    
    func alertaCreado ()
    {
        let alert = UIAlertController(title: "Registro satisfactoria", message: "Se creó tu registro de carro satisfactoriamente", preferredStyle: .alert)
                
        let alertAction = UIAlertAction(title: "Ok", style: .default) { _ in
                    print("El usuario le dio tap en el boton OK")
            
            self.navigationController?.popViewController(animated: true)
            
        }
        
        alert.addAction(alertAction)
        self.present(alert, animated: true)
    }
    
}
