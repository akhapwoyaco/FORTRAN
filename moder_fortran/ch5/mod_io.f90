subroutine read_stock(filename, time, open, high, low, close, adjclose, volume)
    implicit none

    integer :: fileunit
    integer :: n, nm

    nm = num_records(filename) - 1

    if (allocated(time)) deallocate(time)
    allocate(character(10) :: time(nm))

    call alloc(open, nm)
    call alloc(high, nm)
    call alloc(low, nm)
    call alloc(close, nm)
    call alloc(adjclose, nm)
    call alloc(volume, nm)

    open(newunit=fileunit, file=filename)
    read(fileunit, fmt=*, end=1)
    do n = 1, nm
        read(fileunit, fmt=*, end=1) time(n), open(n), high(n), low(n), close(n), adjclose(n), volume(n)
    end do
    1 close(fileunit)

end subroutine read_stock
