program array_slice
	implicit none

	integer :: i
	integer :: array1(10) ! 1D array of 10 integer elements
	integer :: array2(10,10) ! 2D integer array of 100 elements

	array1 = [1,2,3,4,5,6,7,8,9,10] ! array constructor
	array1 = [(i, i = 1,10)] ! implied do loop constructor
	array1(:) = 0 ! set all elements to zero
	array1(1:5) = 1 ! set first fiveelements to one
	array1(6:) = 1 ! Set all elementsafter five to one

	print *, array1(1:10:2) ! print out elements at odd indices
	print *, array2(:, 1) ! print out first collumn in array 2
	print *, array1(10:1:-1) ! print an array in reverse


end program array_slice