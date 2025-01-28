program multiplication_table
  implicit none
  integer :: i, j, n, m
  integer, dimension(10,10) :: mult_table

  n = 10
  m = 10



  do i = 1, n
    do j = 1, m
        mult_table(i, j) = i*j
        !print *, i*j
    end do
  end do

  print *, mult_table

end program multiplication_table
