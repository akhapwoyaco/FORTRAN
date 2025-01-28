program run_func
  implicit none

  real :: v(9)
  real :: vector_norm2

  v(:) = 9

  print *, "Vector norm = ", vector_norm2(9,v)

  contains
  ! L1 Norm of vector
  function vector_norm2(n, vec) result(norm)
    implicit none
    integer, intent(in) :: n
    real, intent(in) :: vec(n)
    real :: norm

    norm = sqrt(sum(vec**2))
  end function vector_norm2
end program run_func
