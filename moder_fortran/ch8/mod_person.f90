module mod_person
  type :: Person
    character(len=20) :: name
    integer :: age
    character(len=20) :: occupation
  contains
    procedure, pass(self) :: greet
  end type Person
contains
  subroutine greet(self)
    class(Person), intent(in) :: self
    print *, 'Hello, my name is'//trim(self%name) // ', of age a', self%age, ' years, and I am an'// trim(self%occupation)
  end subroutine greet

end module mod_person
