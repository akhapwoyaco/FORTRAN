module my_mod
  implicit none

  private
  public public_var, print_matrix

  real, parameter :: public_var = 2
  integer :: private_var

contains
  ! print matrix to screen
  subroutine print_matrix(A)
    implicit none

    real, intent(in) :: A(:, :)

    integer :: i

    do i = 1, size(A, 1)
        print *, A(i,:)
    end do
  end subroutine print_matrix

end module my_mod
