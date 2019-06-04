//
//  Vista3ViewController.swift
//  ArchivosPdf
//
//  Created by User on 09/02/2019.
//  Copyright © 2019 User. All rights reserved.
//

import UIKit
import WebKit
import PDFKit
class Vista3ViewController: UIViewController, WKUIDelegate {
    @IBOutlet var texto: UITextField!
    //@IBOutlet var webView: WKWebView!
    var webView: WKWebView!
    
    @IBOutlet weak var webb: WKWebView!
    
    @IBOutlet var nombrePdf: UILabel!
    
    var pdfView: PDFView!
    var document: PDFDocument!
    
    var nombrePdfRecibido: String! = ""
    @IBOutlet var web: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        mostrarPdf()
        
   //    let direccionPdf = URL(fileURLWithPath: Bundle.main.path(forResource: nombrePdfRecibido,
                                                               //    ofType: "pdf", inDirectory: "pdfs")){
        
      //  let direccionPdf = URL(fileURLWithPath: Bundle.main.path(forResource: nombrePdfRecibido, type: "pdf"))
        
    
    }

    func mostrarPdf(){
     
        
        
       let url = Bundle.main.url(forResource: "pdfs/\(nombrePdfRecibido!)", withExtension: "pdf")!
            //  let datosPdf = try? Data(contentsOf: url)
        let name: String?
        name = "\(nombrePdfRecibido)"
        nombrePdf.text = nombrePdfRecibido!
        print("desenvolviendo; \(name!)")
         let request = URLRequest(url: url)
        webb.load(request)
          
    }
    
  /*  func mostrarPdf2(){
        if let url = Bundle.main.url(forResource: nombrePdfRecibido!, withExtension: "pdf", subdirectory: nil, localization: nil){
            do{
                let data = try Data(contentsOf: url)
                let web = WKWebView(frame: CGRect(x:0, y: Vista3ViewController.frame.size.height, width: view.frame.size.width,
                                                  height: view.frame.size.height-navigationController))
            }catch {
                    print ("error")
                }
        
    }
    }*/

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func abrirPdf(){
        print("nombrepdf : \(nombrePdfRecibido)")
        
        
        
            
            if let url = Bundle.main.url(forResource: nombrePdfRecibido, withExtension: "pdf"){
        
        let webView = UIWebView(frame: self.view.frame)
        let urlRequest = URLRequest(url: url)
        webView.loadRequest(urlRequest as URLRequest)
      
    
        let pdfViewController = UIViewController()
        pdfViewController.view.addSubview(webView)
        self.navigationController?.pushViewController(pdfViewController, animated: true)
        self.view.addSubview(webView)
        
        }
    }


}
