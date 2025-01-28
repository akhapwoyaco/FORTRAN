module mod_alloc(a, n)
  use iso_fortran_env, only:: int32, real32
  implicit none

  subroutine alloc
    real, allocatable, intent(in out) :: a(:)
    integer(int32) :: n
    integer(int32) :: stat
    character(len=*) :: errmsg
    if (allocated(a), call free(a)
    allocate(a(n), stat = stat, errmsg = errmsg)
    if (stat > 0) error stop errmsg
  end subroutine alloc
    real, allocatable, intent(in out) :: a(:)
    deallocate(a)
  subroutine free
    real, allocatable, intent(in out) :: a(:)
    integer(int32) :: stat
    character(len=100) :: errmsg
    if (.not. allocated(a)) return
    deallocate(a, stat = stat, errmsg = errmsg)
    if (stat > 0) error stop errmsg
  end subroutine free
end module mod_alloc
