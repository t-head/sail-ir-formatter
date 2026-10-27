; RUN: sail-irformatter -S < %s | FileCheck %s

; Verify that the "+inf" float token is parsed correctly and not rejected.

; ModuleID = '<stdin>'
source_filename = "<stdin>"

define float @k(float %0) {
  ; CHECK: %{{.+}} = fcmp one float %{{.+}}, 0x7FF0000000000000
  %r = fcmp one float %0, +inf
  ret float %0
}