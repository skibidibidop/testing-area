#|
Author: Mark Beltran
Date: May 22, 2023

Practice defining structure types
|#

; A phone_num is a structure:
; (make-phone_num [Number Number])
; Interpretation: area code, phone number
(define-struct phone_num [area_code number])

; A contact_entry is a structure:
; (make-contact_entry [String phone_num phone_num phone_num])
; Interpretation: the name, home number, office number, and
; cellphone number of a contact
(define-struct contact_entry [name home_num office_num cell_num])

(define contact_mark
  (make-contact_entry "Mark"
                      [make-phone_num 123 456789]
                      [make-phone_num 456 098746]
                      [make-phone_num 789 091872]))

(phone_num-number (contact_entry-home_num contact_mark))
