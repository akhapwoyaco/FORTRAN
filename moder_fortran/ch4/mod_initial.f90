module mod_initial
  use iso_fortran_env, only: int32, real32
  implicit none

contains
 pure subroutine set_gaussian(x, icenter, decay)
   real, intent(in out) :: x(:)
   integer, intent(in) :: icenter
   real, intent(in) :: decay
   integer :: i
   do concurrent(i = 1:size(x))
     x(i) = exp(-decay * (i - icenter)**2)
   end do
  end subroutine set_gaussian

end module mod_initial
