program print_compiler_info
  use iso_fortran_env, only: int32, real32
  implicit none
  print *, "Compiler Version: ", compiler_version()
  print *, "Compiler Options: ", compiler_options()
end program print_compiler_info
