## This code has two parts. Function "makeCacheMatrix" allows the user to create a matrix (assume the matrix is invertible) and chaches the invesrse. 
## The second part "chacheSolve" is the funciton that actually calculates the inverse and prints it out. IF the matrix has been already calculated it just retrieves it from chache.


makeCacheMatrix <- function(x = matrix()) {
# this funtion creates a special matrix object that can catche its inverse

m <- NULL                            # this creates a variable in makeCacheMatrix environment 
set <- function(y) {                 # this sets the value of the matrix
	x <<- y 						 # THIS part is lunched only when set is called, then assings the value y to x using the superassignment (<<-)
	m <<- NULL 						
	}
get <- function() x					# this part the part that makes the fuction show you the matrix you called
setinverse <- function(solve) {m <<- solve}    # here, the value of the inverse is defined and stored but not calculated yet
getinverse <- function() {m} 					# This part gets the inverse of the matrix.   

list(set = set, get = get,             # this is simple a list of the funcitons. Is created here so it will be possilbe to access it from the global environment.
   setinverse = setinverse, getinverse = getinverse)
}

						
cacheSolve <- function(x, ...)               # here is the function where the inverse of the matrix is calculated 
{           
	m <- x$getinverse 						# here it checks if the inverse of the matrix has been already calculated. 
	if(!is.null(m)) {
		message("getting cached data")       
		return(m)
		}
	 
	data <- x$get()							# if not it calculated the inverse of the matrix and returns it via setinverse. 
	m <- solve(data, ...)
	x$setinverse(m) 
	m
        ## Return a matrix that is the inverse of 'x'
}

