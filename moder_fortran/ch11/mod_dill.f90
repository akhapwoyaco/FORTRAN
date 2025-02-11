module mod_dill
  use iso_c_binding, only: c_char
  implicit none

  private
  public :: ipaddr

  type, bind(c, name= 'dill_ipaddr') :: ipaddr
    character(c_char) :: address(32)
  end type ipaddr
end module mod_dill
