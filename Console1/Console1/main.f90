program main
  implicit none
  integer, parameter :: n = 10000
  integer ( kind = 4 ) i
  real ( kind = 8 ) :: x(n)
  character(len = 200) :: PlotLine
  integer, parameter :: nVariables = 5 !assign the number of variables here
  character (len = 30) :: nVariablesChar
  
    
    write(nVariablesChar , *) nVariables
    
    PlotLine = 'plot for [i=1:'//trim(adjustl(nVariablesChar))//'] "data.txt" using 1:i with lines title columnheader(i)'
    !--------------------------------------------------------------------------!
    1   format (6e20.12)
    open ( unit = 4, file = "data.txt")
    !write titles of the graphs here
    write ( 4,*) "Title1 ", "Title2 ", "Title3 ", "Title4 ", "Title5 "
  
    !--------------------------------------------------------------------------!
    open ( unit = 2, file = "commands2.txt")
    write(2,*) 'a = 0'
    write(2,*) 'trim(PlotLine)'
    close(2) 
    !--------------------------------------------------------------------------!
    !Write the options here
    open ( unit = 1, file = "commands1.txt")
    write(1,*) 'set title "GNUFOR plot" '
    write(1,*) 'set xlabel "x" '
    write(1,*) 'set ylabel "y" '
    write(1,*) 'set grid'
!    write(1,*) 'set log y'
    write(1,*) 'load "commands2.txt" ' 
    write(1,*) 'if(a==1) '//trim(PlotLine)
    write(1,*) 'reread'
    close(1)
    !--------------------------------------------------------------------------!
    call system('start "" gnuplot commands1.txt ')
    !--------------------------------------------------------------------------!
 
    do i = 1, n
        x(i) = i 
        
        write ( 4,1) x(i), 2*x(i), 3*x(i), 4*x(i), 5*x(i), 6*x(i)
        
        !--------------------------------------------------------------!
        !Should be added directly after writing residuals to the files
        open ( unit = 2, file = "commands2.txt")
        write(2,*) 'a=1'
        close(2)
        open ( unit = 2, file = "commands2.txt")
        write(2,*) 'a=0'
        close(2)
        !--------------------------------------------------------------!
    
!    call sleep(1/100)
    end do
  stop
end