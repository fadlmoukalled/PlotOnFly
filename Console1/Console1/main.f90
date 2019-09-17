program main
  implicit none
  integer, parameter :: n = 2000
  integer ( kind = 4 ) i
  real ( kind = 8 ) :: x(n), y(n)
  
    
    !--------------------------------------------------------------------------!
    open ( unit = 1, file = "commands1.txt")
    write(1,*) 'set title "GNUFOR plot" '
    write(1,*) 'set xlabel "x" '
    write(1,*) 'set ylabel "y" '
    write(1,*) 'set grid'
    write(1,*) 'set log y'
    close(1)
    !CALL system('gnuplot commands1.txt')
    
    !--------------------------------------------------------------------------!
    
    open ( unit = 2, file = "commands2.txt")
    write(2,*) 'a = 0'
    write(2,*) 'plot "data.txt" using 1:2 with lines'
    close(2) 
    
    !--------------------------------------------------------------------------!
    
    open ( unit = 3, file = "commands3.txt")
    write(3,*) 'load "commands2.txt"' 
    write(3,*) 'load "commands1.txt"'
    write(3,*) 'if(a==1) plot "data.txt" using 1:2 with lines'
    write(3,*) 'reread'
    close(3) 
    !--------------------------------------------------------------------------!
    call system('start "" gnuplot commands3.txt ')
    !--------------------------------------------------------------------------!
    
    
    open ( unit = 4, file = "data.txt")
    do i = 1, n
        x(i) = i
        y(i) = x(i)**2
        
        write ( 4, * ) x(i), y(i)
        
        
        open ( unit = 2, file = "commands2.txt")
        write(2,*) 'a=1'
        close(2)
        
        open ( unit = 2, file = "commands2.txt")
        write(2,*) 'a=0'
        close(2)
    
!    call sleep(1)
    end do
  stop
end