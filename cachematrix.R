## These functions return the inverse of a matrix but
## they cache the results in order to save computation time
## in case the inverse of the matrix has already been
## calculated

## The function makeCacheMatrix contains a list of functions
## that return the matrix stored or changes the baseline 
## special matrix we are goint to evaluate later

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) m <<- solve
  getsolve <- function() m
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
  
}


## The function cacheSolve determine if the value of the
## inverse of the matrix created in the function makeCacheMatrix
## has been computed. If it has, then it returns a message
## to let you know it is looking for it on the cache
## and returns the value stored.
## If the value of the inverse of the matrix has not been 
## calculated, then the function computes it and returns it

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getsolve()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setsolve(m)
  m
}

