import XCTest
@testable import ios_stage_task

class MessageDecryptorTests: XCTestCase {
    
    var messageDecryptor: MessageDecryptor!
    
    override func setUpWithError() throws {
        messageDecryptor = MessageDecryptor()
    }
    
    override func tearDownWithError() throws {
        messageDecryptor = nil
    }
    
    func test1() {
        XCTAssertEqual(messageDecryptor.decryptMessage("secretmessage"), "secretmessage")
    }
    
    func test2() {
        XCTAssertEqual(messageDecryptor.decryptMessage("[secretmessage]"), "secretmessage")
    }
    
    func test3() {
        XCTAssertEqual(messageDecryptor.decryptMessage("0[secretmessage]"), "")
    }
    
    func test4() {
        XCTAssertEqual(messageDecryptor.decryptMessage("1[secretmessage]"), "secretmessage")
    }
    
    func test5() {
        XCTAssertEqual(messageDecryptor.decryptMessage("3[secret]2[message]"), "secretsecretsecretmessagemessage")
    }
    
    func test6() {
        XCTAssertEqual(messageDecryptor.decryptMessage("4[secret]me3[s]age"), "secretsecretsecretsecretmesssage")
    }
    
    func test7() {
        XCTAssertEqual(messageDecryptor.decryptMessage("s4[e]cr3[e]tme2[ss]age"), "seeeecreeetmessssage")
    }
    
    func test8() {
        XCTAssertEqual(messageDecryptor.decryptMessage("3[message2[secret]]"), "messagesecretsecretmessagesecretsecretmessagesecretsecret")
    }
    
    func test9() {
        XCTAssertEqual(messageDecryptor.decryptMessage("2[2[secret]]message"), "secretsecretsecretsecretmessage")
    }
    
    func test10() {
        XCTAssertEqual(messageDecryptor.decryptMessage("1[s]1[e]1[c]1[r]1[e]1[t]1[m]1[e]2[s]1[a]1[g]1[e]"), "secretmessage")
    }
    
    func test11() {
        XCTAssertEqual(messageDecryptor.decryptMessage("1[s]2[e]3[c]4[r]5[e10[t]]11[m]12[e13[s]]3[a]1[g]1[e]"), "seecccrrrrettttttttttettttttttttettttttttttettttttttttettttttttttmmmmmmmmmmmesssssssssssssesssssssssssssesssssssssssssesssssssssssssesssssssssssssesssssssssssssesssssssssssssesssssssssssssesssssssssssssesssssssssssssesssssssssssssesssssssssssssaaage")
    }
    
    func test12() {
        XCTAssertEqual(messageDecryptor.decryptMessage("2[s2[e2[c2[r2[e2[t2[m]]]]]]essage]"),
                       "secretmmtmmetmmtmmretmmtmmetmmtmmcretmmtmmetmmtmmretmmtmmetmmtmmecretmmtmmetmmtmmretmmtmmetmmtmmcretmmtmmetmmtmmretmmtmmetmmtmmessagesecretmmtmmetmmtmmretmmtmmetmmtmmcretmmtmmetmmtmmretmmtmmetmmtmmecretmmtmmetmmtmmretmmtmmetmmtmmcretmmtmmetmmtmmretmmtmmetmmtmmessage")
    }
    
    func test13() {
        XCTAssertEqual(messageDecryptor.decryptMessage("[s6[e5[c4[r3[e2[t1[m]e]s]s]a]g]e]"),
                       "secretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessacretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessacretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessacretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessacretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessagecretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessacretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessacretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessacretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessacretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessagecretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessacretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessacretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessacretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessacretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessagecretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessacretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessacretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessacretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessacretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessagecretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessacretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessacretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessacretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessacretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessagecretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessacretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessacretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessacretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessacretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessretmetmesetmetmesetmetmessage")
    }
}
