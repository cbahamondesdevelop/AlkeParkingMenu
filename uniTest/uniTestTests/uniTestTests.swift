import XCTest
@testable import uniTest

class uniTestTests: XCTestCase {

    var sut:MathOperation! //sut=Software under testing
    
    override func setUp() { //similar a viewDidLoad ya que se debe realizar al momento de instanciar las pruebas unitarias
        super.setUp()
        sut = MathOperation()
    }
    
    func testSumarSucces() {
        let num01 = 20
        let num02 = 10
        
        let resultado = sut.sumar(num1: num01, num2: num02)
        
        if resultado == 30 {
            XCTAssert(true)
        }
        else {
            XCTAssert(false)
        }
    }
    
    func testRestarSucces() {
        let num01 = 50
        let num02 = 30
        
        let resultado = sut.restar(num1: num01, num2: num02)
        
        if resultado == 20 {
            XCTAssert(true)
        }
        else {
            XCTAssert(false)
        }
    }
    
    func testMultiplicarSucces() {
        let num01 = 2
        let num02 = 3
        
        let resultado = sut.multiplicar(num1: num01, num2: num02)
        
        if resultado == 6 {
            XCTAssert(true)
        }
        else {
            XCTAssert(false)
        }
    }
    
    func testConsolidadoCase1Succes() {
        let num01 = 5
        let num02 = 4
        
        
        let resultado = sut.consolidado(num1: num01, num2: num02, operationType: .sumar)
        
        if resultado == 9 {
            XCTAssert(true)
        }
        else {
            XCTAssert(false)
        }
    }
    
    func testConsolidadoCase2Succes() {
        
        let num01 = 16
        let num02 = 10
        
        let resultado = sut.consolidado(num1: num01, num2: num02, operationType: .restar)
        
        if resultado == 6 {
            XCTAssert(true)
        }
        else {
            XCTAssert(false)
        }
    }
    
    func testConsolidadoCase3Succes() {
    
        let num01 = 2
        let num02 = 10
        
        let resultado = sut.consolidado(num1: num01, num2: num02, operationType: .multiplicar)
        
        if resultado == 20 {
            XCTAssert(true)
        }
        else {
            XCTAssert(false)
        }
    }
}
