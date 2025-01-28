program stock_volatility
  use mod_arrays, only: average, std, moving_average, moving_std, reverse
  use mod_io, only: read_stock, write_stock

  do n = 1, size(symbols)
    im = size(time)
    adjclose = reverse(adjclose)

    call write_stock(
    trim(symbols(n)) // '_volatility.txt', time(im:1:-1), adjclose,moving_average(adjclose, 30), moving_std(adjclose, 30))

end do
end program stock_volatility
