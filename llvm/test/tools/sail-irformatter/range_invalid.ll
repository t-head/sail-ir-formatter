; RUN: split-file %s %t
; RUN: not sail-irformatter -S %t/equal.ll 2>&1 | FileCheck %s --check-prefix=EQUAL
; RUN: not sail-irformatter -S %t/overflow.ll 2>&1 | FileCheck %s --check-prefix=OVERFLOW
; RUN: not sail-irformatter -S %t/noninteger.ll 2>&1 | FileCheck %s --check-prefix=TYPE

;--- equal.ll
; EQUAL: equal range limits must both be zero
declare range(i32 5, 5) i32 @equal()

;--- overflow.ll
; OVERFLOW: integer is too large for the bit width of specified type
declare range(i8 0, 256) i8 @overflow()

;--- noninteger.ll
; TYPE: the range must have integer type!
declare range(float 0, 1) i32 @noninteger()
