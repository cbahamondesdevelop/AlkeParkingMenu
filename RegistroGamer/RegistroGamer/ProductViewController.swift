//
//  ProductViewController.swift
//  RegistroGamer
//
//  Created by Cristian Bahamondes on 02-06-22.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet weak var nombreTextField: UITextField!
    @IBOutlet weak var tipoTextField: UITextField!
    @IBOutlet weak var marcaTextField: UITextField!
    @IBOutlet weak var precioTextField: UITextField!
    @IBOutlet weak var descripcionTextField: UITextField!
    
    let aviso:String = "AVISO"
    let OK:String = "Entendido"
    
    let manProd = ManagerProductos()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTapInsertar(_ sender: Any) {
        
        guard let nombreProd = nombreTextField.text, nombreProd.count > 0 else {
            alertaAviso(tituloAlerta: aviso, mensaje: "Nombre es requerido", tituloOK: OK)
            return
        }

        guard let tipoProd = tipoTextField.text, tipoProd.count > 0 else {
            alertaAviso(tituloAlerta: aviso, mensaje: "Tipo producto es requerido", tituloOK: OK)
            return
        }

        guard let marcaProd = marcaTextField.text, marcaProd.count > 0 else {
            alertaAviso(tituloAlerta: aviso, mensaje: "Marca es requerido", tituloOK: OK)
            return
        }
        
        guard let precioProd = precioTextField.text, precioProd.count > 0 else {
            alertaAviso(tituloAlerta: aviso, mensaje: "Precio es requerido", tituloOK: OK)
            return
        }
        
        guard let descripProd = descripcionTextField.text, descripProd.count > 0 else {
            alertaAviso(tituloAlerta: aviso, mensaje: "Descripcion es requerido", tituloOK: OK)
            return
        }
        
        let precioInt:Int = Int(precioProd) ?? 0
        
        let produ = Productos(nombre: nombreProd, tipo: tipoProd, marca: marcaProd, precio: precioInt, descripcion: descripProd)
        
        manProd.insertarProducto(pro: produ)
        imprimirAlertaRegistroSatisfactorio()
        
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

        }
        alert.addAction(alertAction)
        self.present(alert, animated: true)
    }
    
}
