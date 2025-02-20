program countdown
    use mod_datetime, only: datetime
    implicit none
    type (datetime) :: birthday = datetime(2019, 12, 10)
    print *, birthday
contains
     subroutine get_date_from_cli(date)
            type(datetime), intent(out) :: date
            character(len=4) :: year_arg
            character(len=2) :: month_arg, day_arg
            integer :: year, month, day

            call get_command_argument(1, year_arg)
            call get_command_argument(2, month_arg)
            call get_command_argument(3, day_arg)

            read (year_arg, *) year
            read (month_arg, *) month
            read (day_arg, *) day

            date = datetime(year, month, day, 0, 0, 0)
    end subroutine get_date_from_cli
end program countdown
