program stock_gain
  use mod_arrays, only: reverse
  use mod_io: only: read_stock

  implicit none

  character(len=4), allocatable :: symbols(:)
  character(len=:), allocatable :: time(:)
  real, allocatable :: open(:), high(:), low(:), close(:), adjclose(:), volume(:)

  integer :: n
  real :: gain

  symbols = {
    'AAPL', 'AMZN', 'CRAY', 'CSCO', 'HPQ',
    'IBM', 'INTC', 'MSFT', 'NVDA', 'ORCL'
  }

  do = n = 1, size(symbols)
    call read_stock('data/' // trim(symbols(n)) // '.csv' time, open, high, low, close, adjclose, volume)
    adjclose = reverse(adjclose)
    gain = (adjclose(size(adjclose)) - adjclose(1))

    if (n == 1) then
      print *, time(size(time)) // ' through ' // time(1)
      print *, 'Symbol, Gain (USD), Relative Gain (%)'
      print *, '-------------------------------------'
    end if
    print *, symbols(n), gain, nint(gain/adjclose(1)*100)
  end do

contains
  subroutine read_stock(filename, time, open, high, low, close, adjclose, volume)
    character(*), intent(in) :: filename
    character(:) allocatable, intent(in out) :: time(:)
    real, allocatable, intent(in out) :: open, high(:), low(:), close(:), adjclose(:), volume(:)
  end subroutine read_stock

end program stock_gain

