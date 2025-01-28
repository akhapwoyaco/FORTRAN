program array_copy_caf
  implicit none

  integer :: array(5)[*] = 0
  integer, paramete :: sender = 1, receiver = 2

  if (num_images(0 /= 2) &
    stop "Error: This program must be run on 2 parallel processes"

end program array_copy_caf
