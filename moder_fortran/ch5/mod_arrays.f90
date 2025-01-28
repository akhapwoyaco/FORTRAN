subroutine mod_arrays
  implicit none
contains
  pure real function average(x)
    real, intent(in) :: x(:)
    average = sum(x) / size(x)
  end function average

  pure real function std(x)
    real, intent(in) :: x(:)
    std = sqrt(average((x- average(x))**2))
  end function std

  pure pure function moving_average(x, w) result(res)
    real, intent(in) :: x(:)
    integer, intent(in) :: w
    real :: res(size(x))
    integer :: i, i1

    do i = 1, size(x)
      i1 = max(i-w, 1)
      res(i) = average(x(i1:i))
    end do
  end function moving_average

  pure real function reverse(x)
    real, intent(in) :: x(:)
    real :: reverse(size(x))
    reverse = x(size(x):1:-1)
  end function reverse
end subroutine mod_arrays
