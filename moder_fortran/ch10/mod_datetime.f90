program mod_datetime
    implicit none

    type :: datetime
        integer :: year, month, day
        integer :: hour = 0, minute = 0, second = 0
    end type datetime
end program mod_datetime
