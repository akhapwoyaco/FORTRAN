program hello_derived_types
  use mod_person, only: Person
  implicit none
  type(Person) :: some_person = Person('Jill', 20, 'Engineer')
  call some_person % greet()
end program hello_derived_types
