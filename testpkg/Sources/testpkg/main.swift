import Catui

let v1 = CatuiSemver(major:1, minor:2, patch:3)
let v2 = try! CatuiSemver(string:"2.3.4")
let v3 = CatuiSemver(major:1, minor:3, patch:0)
print("\(v1) can use \(v2)? \(v1.canUse(v2))")
print("\(v3) can support \(v1)? \(v3.canSupport(v1))")

let reqBytes = [UInt8]("""
{
    "catui-version": "0.1.0",
    "protocol": "com.example.test",
    "version": "1.2.3"
}
""".utf8)

assert(reqBytes.count <= CatuiConnectRequestBufSize)
let req = try! CatuiConnectRequest(bytes:reqBytes, length:reqBytes.count)
assert(req.version.canUse(v1)) // They are same version 1.2.3

var respBuf = [UInt8](repeating: 0, count: CatuiConnectResponseBufSize)
let resp = CatuiConnectResponse(errorMsg:"Hello!")
var msgSize = 0
try! resp.encodeBytes(&respBuf, bufSize:respBuf.count, msgSize:&msgSize)
assert(0 < msgSize)
