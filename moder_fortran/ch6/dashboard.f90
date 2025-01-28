program dashboard
  use iso_fortran_env, only: dash => output_unit
  implicit none

  real :: lat = 59.329444, lon = 18.068611, alt = 116789.3
  integer :: eng(4) = [96,96,95,97]
  logical :: airborne = .true.
  character :: pilot = 'chris'

  character(len=:), allocatable :: dashfmt

  dashfmt = '(a, 2(f9.5, 2x), f7.1, 2x, 4(i3.3, 2x), l)'
  write (dash, dashfmt) pilot, lat, lon, alt, eng, airborne

end program dashboard
