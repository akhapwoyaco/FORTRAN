program read_value
	implicit none
	integer :: age

	print *, 'Please enter your age: '
	read(*,*) age
	print *, 'in ten years, your age will be ', age +10
end program read_value