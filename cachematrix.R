##FUNCTION NAME: makeCacheMatrix
## I/P ->  x is an invertible matrix
## returns a list containing functions to
##              1. set the matrix
##              2. get the matrix
##              3. set the inverse
##              4. get the inverse
##         this list is used as the input to cacheSolve()

makeCacheMatrix <- function(x = matrix()) {
  
  inv <- NULL ##Assigns NULL when called for a first time
  
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() {
    x
  }
  setinv <- function(inverse) {
    inv <<- inverse
  }
  getinv <- function() {
    inv
  }
  list(set=set, get=get, setinv=setinv, getinv=getinv)
}

##FUNCTION NAME : cacheSolve
## x is the output of makeCacheMatrix() function when passed a Invertible matrix to it
## returns the inverse of the original matrix input to makeCacheMatrix()

cacheSolve <- function(x, ...) {
  
  inv <- x$getinv()  ##Get the Inverse of a matrix if already cached
  if(!is.null(inv)) {
    
    ## Checks if the Inverse is cached and fetch it
    
    message("Getting cached data")
  }
  
  ## if inverse is not cached, calculate the inverse and store it with the setinv function
  
  
  mat.data <- x$get()
  inv <- solve(mat.data, ...)
  x$setinv(inv)
  return(inv)
}