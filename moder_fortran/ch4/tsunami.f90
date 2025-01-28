program tsunami
  use mod_diff, only: diff
  use mod_initial, only: set_gaussian
  implicit none

  integer :: n

  integer, parameter :: grid_size = 100
  integer, parameter :: num_time_steps = 100
  real, parameter :: dt = 1, dx = 1, c = 1 ! phasing speed

  real :: h(grid_size)

  integer, parameter :: icenter = 25
  real, parameter :: decay = 0.02

  if (grid_size <= 0) stop 'grid_size must be >0'
  if (dt <= 0) stop 'time step dt must be > 0'
  if (dx <= 0) stop 'grid spacing dx must be > 0'
  if (c <= 0) stop 'background flow speed c must be > 0'

  call set_gaussian(h, icenter, decay)

  print *, 0, h

  time_loop: do n = 1,num_time_steps
    h = h - c * diff(h) /dx*dt
    print *, n,h
  end do time_loop

end program tsunami
