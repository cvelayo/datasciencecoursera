## These are a pair of functions that calculate the inverse of a matrix and cache the result. 

## Creates a list of functions to set the matrix, get the matrix, get the inverse of the matrix, and set the inverse of the matrix.

makeCacheMatrix <- function(x = matrix()) {

    i <- NULL
    set <- function(y) {
      x <<- y
      i <<- NULL
    }
    get <- function() x
    setinverse <- function(solve) i <<- solve
    getinverse <- function() i
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## Calculates the inverse of the matrix. Looks at the cache first for a solution.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    i <- x$getinverse()
    if(!is.null(i)) {
        message("getting cached data")
        return(i)
    }
    data <- x$get()
    i <- solve(data)
    x$setinverse(i)
    i
}
