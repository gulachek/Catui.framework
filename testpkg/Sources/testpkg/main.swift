import Catui

let v1 = CatuiSemver(major:1, minor:2, patch:3)
let v2 = try! CatuiSemver(string:"2.3.4")
print("v1 can use v2? \(v1.canUse(v2))")
