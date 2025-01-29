program savings_account
  implicit none
  integer :: choice, customer_number, time_period
  real :: initial_deposit, interest_rate
  character(len=50) :: customer_name, savings_type, period_type
  character(len=80) :: filename
  integer :: i
  logical :: found
  type :: customer
     integer :: customer_number
     character(len=50) :: customer_name
     real :: initial_deposit
     character(len=20) :: savings_type
     real :: interest_rate
     character(len=10) :: period_type
     integer :: time_period
  end type customer
  type(customer), dimension(100) :: customers
  integer :: num_customers = 0

  ! File name for storing customer data
  filename = 'customers.txt'

  ! Load previous records from file
  call load_data(customers, num_customers, filename)

  do
     ! Main menu
     print *, 'Choose an option:'
     print *, '1. Add Data (A)'
     print *, '2. Edit Data (E)'
     print *, '3. Delete Data (D)'
     print *, '4. View Compound Table (Vi)'
     print *, '5. Exit (Ex)'
     read(*,*) choice

     select case(choice)
     case(1)
        call add_data(customers, num_customers)
     case(2)
        call edit_data(customers, num_customers)
     case(3)
        call delete_data(customers, num_customers)
     case(4)
        call view_table(customers, num_customers)
     case(5)
        print *, 'Exiting...'
        call save_data(customers, num_customers, filename)
        stop
     case default
        print *, 'Invalid option!'
     end select
  end do

contains

  ! Subroutine to load data from a file
  subroutine load_data(customers, num_customers, filename)
    type(customer), dimension(:), intent(out) :: customers
    integer, intent(out) :: num_customers
    character(len=80), intent(in) :: filename
    integer :: iunit, ios, i
    ! Open the file for reading, check if file exists
    open(unit=iunit, file=filename, status='old', action='read', iostat=ios)

    if (ios == 0) then
        ! File exists, read the number of customers
        read(iunit,*) num_customers
        do i = 1, num_customers
            read(iunit,*) customers(i)%customer_number, customers(i)%customer_name, &
                          customers(i)%initial_deposit, customers(i)%savings_type, &
                          customers(i)%interest_rate, customers(i)%period_type, &
                          customers(i)%time_period
        end do
        close(iunit)
    else
        print *, 'No existing data file found. Starting fresh.'
    end if
  end subroutine load_data

  ! Subroutine to save data to a file
  subroutine save_data(customers, num_customers, filename)
    type(customer), dimension(:), intent(in) :: customers
    integer, intent(in) :: num_customers
    character(len=80), intent(in) :: filename
    integer :: iunit, i
    open(unit=iunit, file=filename, status='replace', action='write')
    write(iunit,*) num_customers
    do i = 1, num_customers
       write(iunit,*) customers(i)%customer_number, customers(i)%customer_name, &
                      customers(i)%initial_deposit, customers(i)%savings_type, &
                      customers(i)%interest_rate, customers(i)%period_type, &
                      customers(i)%time_period
    end do
    close(iunit)
  end subroutine save_data

  ! Subroutine to add customer data
  subroutine add_data(customers, num_customers)
    type(customer), dimension(:), intent(inout) :: customers
    integer, intent(inout) :: num_customers
    integer :: new_customer_number, new_time_period
    real :: new_initial_deposit, new_interest_rate
    character(len=50) :: new_customer_name, new_savings_type, new_period_type

    print *, 'Enter customer number (must be unique):'
    read(*,*) new_customer_number
    ! Check if customer number already exists
    if (any([customers(:)%customer_number == new_customer_number])) then
       print *, 'Customer number already exists!'
       return
    endif
    print *, 'Enter customer name:'
    read(*,*) new_customer_name
    print *, 'Enter initial deposit:'
    read(*,*) new_initial_deposit
    print *, 'Enter interest rate (as a decimal, e.g., 0.15 for 15%):'
    read(*,*) new_interest_rate
    print *, 'Enter time period type (Years, Months, or Days):'
    read(*,*) new_period_type
    print *, 'Enter number of ', trim(new_period_type), ':'
    read(*,*) new_time_period
    print *, 'Enter savings type (e.g., Savings, Fixed Deposit):'
    read(*,*) new_savings_type

    ! Add new customer to the list
    num_customers = num_customers + 1
    customers(num_customers)%customer_number = new_customer_number
    customers(num_customers)%customer_name = new_customer_name
    customers(num_customers)%initial_deposit = new_initial_deposit
    customers(num_customers)%interest_rate = new_interest_rate
    customers(num_customers)%period_type = new_period_type
    customers(num_customers)%time_period = new_time_period
    customers(num_customers)%savings_type = new_savings_type

    print *, 'Customer added successfully.'
  end subroutine add_data

  ! Subroutine to edit customer data
  subroutine edit_data(customers, num_customers)
    type(customer), dimension(:), intent(inout) :: customers
    integer, intent(inout) :: num_customers
    integer :: customer_number, i
    logical :: found
    found = .false.
    print *, 'Enter customer number to edit:'
    read(*,*) customer_number
    do i = 1, num_customers
       if (customers(i)%customer_number == customer_number) then
          found = .true.
          print *, 'Customer found. Enter new deposit amount:'
          read(*,*) customers(i)%initial_deposit
          print *, 'Enter new interest rate (as a decimal):'
          read(*,*) customers(i)%interest_rate
          print *, 'Enter new time period type (Years, Months, or Days):'
          read(*,*) customers(i)%period_type
          print *, 'Enter new number of ', trim(customers(i)%period_type), ':'
          read(*,*) customers(i)%time_period
          print *, 'Customer data edited successfully.'
          return
       endif
    end do
    if (.not. found) then
       print *, 'Customer number not found!'
    end if
  end subroutine edit_data

  ! Subroutine to delete customer data
  subroutine delete_data(customers, num_customers)
    type(customer), dimension(:), intent(inout) :: customers
    integer, intent(inout) :: num_customers
    integer :: customer_number, i, j
    character(len=1) :: confirm
    logical :: found
    found = .false.
    print *, 'Enter customer number to delete:'
    read(*,*) customer_number
    do i = 1, num_customers
       if (customers(i)%customer_number == customer_number) then
          found = .true.
          print *, 'Are you sure you want to delete this record? (y/n):'
          read(*,*) confirm
          if (confirm == 'y' .or. confirm == 'Y') then
             ! Delete the record
             do j = i, num_customers-1
                customers(j) = customers(j+1)
             end do
             num_customers = num_customers - 1
             print *, 'Record deleted successfully.'
          else
             print *, 'Deletion cancelled.'
          end if
          return
       endif
    end do
    if (.not. found) then
       print *, 'Customer number not found!'
    end if
  end subroutine delete_data

  ! Subroutine to view compound interest table
  subroutine view_table(customers, num_customers)
    type(customer), dimension(:), intent(in) :: customers
    integer, intent(in) :: num_customers
    integer :: i, time_step, time_max
    real :: interest_rate, starting_balance, interest, ending_balance, time_factor
    character(len=80) :: csv_filename
    integer :: iunit, customer_number
    logical :: found
    found = .false.

    print *, 'Enter customer number to view compound interest table:'
    read(*,*) customer_number

    ! Search for the customer
    do i = 1, num_customers
      if (customers(i)%customer_number == customer_number) then
        found = .true.
        starting_balance = customers(i)%initial_deposit
        interest_rate = customers(i)%interest_rate
        time_max = customers(i)%time_period

        ! Determine time factor based on period type
        select case(trim(customers(i)%period_type))
        case('Years')
           time_factor = 1.0
        case('Months')
           time_factor = 1.0 / 12.0
        case('Days')
           time_factor = 1.0 / 365.0
        case default
           print *, 'Invalid time period type!'
           return
        end select

        ! Create CSV file for this customer
        write(csv_filename, '(A, "_", I0, "_interest.csv")') trim(adjustl(customers(i)%customer_name)), customer_number
        open(newunit=iunit, file=csv_filename, status='replace', action='write')

        ! Write CSV header
        write(iunit, '(A)') 'Time Period,Starting Balance,Interest,Ending Balance'
        print *, 'Time Period  Starting Balance  Interest  Ending Balance'

        ! Calculate and write compound interest data
        do time_step = 1, time_max
          interest = starting_balance * interest_rate * time_factor
          ending_balance = starting_balance + interest

          ! Write each row to the CSV
          write(iunit, '(I10, ",", F12.2, ",", F12.2, ",", F12.2)') time_step, starting_balance, interest, ending_balance

          ! Display to console as well
          print '(I10, F12.2, F12.2, F12.2)', time_step, starting_balance, interest, ending_balance

          starting_balance = ending_balance
        end do

        close(iunit)
        print *, 'Compound interest table saved to: ', trim(csv_filename)
        return
      end if
    end do

    if (.not. found) then
      print *, 'Customer number not found!'
    end if
  end subroutine view_table

end program savings_account
